# CLAUDE.md

## Project Overview

SwiftMeasurement is a Swift 6 **package with two library products**:

- **`SwiftMeasurement`** — fluent syntax for Foundation's `Measurement` and `Unit` types, plus a dimensional analysis system for type-safe calculations between physical units (e.g., speed × time = distance).
- **`SwiftMeasurementCodable`** — a stable, portable JSON shape for measurements, `{"value": <number>, "unit": "<cldr-id>"}`, keyed by CLDR core unit identifiers instead of Foundation's leaky default `Codable` encoding. Independent target (imports only Foundation; no dependency on `SwiftMeasurement`).

Swift 6 language mode is enforced package-wide (`swiftLanguageModes: [.v6]`). Key types conform to `Sendable`.

## Build & Test

```bash
swift build                                        # Debug build
swift build -c release                             # Release build
swift test                                         # Run all tests
swift test --filter <TestSuiteName>                # Run a specific suite
swift test --filter <TestSuiteName>/testMethodName # Run a single test
swift run GenerateTypedAlgebra                    # Regenerate typed operators and their test
```

`swift test` runs both test targets (`SwiftMeasurementTests`, `SwiftMeasurementCodableTests`).

No linter configured. Follow `.editorconfig` (4-space indent, LF line endings).

CI (`.github/workflows/ci.yml`) runs on macOS and in Linux `swift:*` containers. It fails if `Sources/SwiftMeasurementCodable` imports `SwiftMeasurement`, or if the generated typed operators are stale.

## Architecture

The package has two independent targets. Paths written as `Sources/.../` below are under `Sources/SwiftMeasurement/`; the codable module lives in `Sources/SwiftMeasurementCodable/`.

**`MeasurementConvertible` protocol** (`Sources/.../MeasurementConvertible.swift`) — Conformed by `Double`, `Float`, `Int`. Provides `measurement(as:)` which all unit convenience properties call (e.g., `3.5.kilometers` → `Measurement<UnitLength>`).

**Unit extensions** (`Sources/.../Units/`) — One file per `Unit` type. Each extends `MeasurementConvertible` with computed properties (`.kilometers`, `.hours`, `.watts`, etc.).

**`Measurement+Extensions`** (`Sources/.../Measurement+Extensions.swift`) — `Int`/`Float` initializers for `Measurement`. There are deliberately no literal conformances: they make `x / 2` ambiguous against the typed operators.

**Dimensional System** (`Sources/.../DimensionalSystem/`):
- `DimensionalExponents` — 7 SI base dimension exponents (length, time, mass, current, temperature, amount, luminosity) plus two pseudo-dimensions, `angle` and `information`, so angles and data sizes never mix with plain ratios. Supports add/subtract/scalar-multiply.
- `DimensionalUnit` — Protocol mapping Foundation `Unit` types to their exponents and `coherentScale`, the SI value of one `baseUnit()`. Foundation's base unit is not SI for volume (L → 1e-3), angle (° → π/180), information (byte → 8 on Darwin; Linux's base is already the bit), dispersion (ppm → 1e-6) and fuel efficiency (L/100km → 1e-8 m²).
- `DimensionalMeasurement` — Type-erased wrapper storing a `Double` value in coherent SI units + exponents. Supports `*`, `/`, `power(_:)`, `squareRoot()` across `Measurement<T>` types. Convenience accessors (`.asLength`, `.asSpeed`, etc.) convert back to typed measurements. Invalid conversions return `nil`.
- `TypedAlgebra.generated.swift` — concrete `Measurement<A> op Measurement<B> -> Measurement<C>` overloads (or `-> Double` when the result is dimensionless), written by the `GenerateTypedAlgebra` executable target (not a product) together with `Tests/.../TypedAlgebra.generated.swift`. Never hand-edit either file. `UnitDispersion` and `UnitFuelEfficiency` (same exponents as `UnitArea`) are excluded. A concrete overload beats the generic `Measurement * Measurement -> DimensionalMeasurement`, so unannotated products are typed.

**`SwiftMeasurementCodable` module** (`Sources/SwiftMeasurementCodable/`) — Separate product/target giving `Measurement` the wire shape `{"value": <number>, "unit": "<cldr-id>"}`, where `unit` is a CLDR core unit identifier (`"gram"`, `"kilometer-per-hour"`). Imports **only Foundation** — no dependency on the `SwiftMeasurement` target, so the two products evolve independently.
- `UnitIdentifierRepresentable` — protocol on `Dimension` subclasses with two `switch`-based requirements mapping units ↔ identifiers (`unitIdentifier`, `static unit(forIdentifier:)`). Switch-based, not `static let` dictionaries, to avoid non-Sendable-static diagnostics under Swift 6 on Linux. The static factory ends in `as? Self` because Foundation's unit classes are non-final — the cast makes a subclass lookup return `nil`.
- `CodableMeasurement<UnitType>` — strict `Codable`/`Equatable`/`Sendable` wrapper. Encodes the *current* unit as-is (no canonicalization — `converted(to:)` first to pick the wire unit); unknown identifier → `DecodingError`, unit with no CLDR id → `EncodingError`. Sugar: `measurement.codable`.
- `RawMeasurement` — lenient passthrough keeping `unit` as a raw string; always decodes. `measurement(as:)` is the separate, failable typed step (`nil` if unrecognized).
- `Units/<Unit>+Identifiers.swift` — one `UnitIdentifierRepresentable` conformance per Dimension type (22 types). Only CLDR 48.2 `idStatus='regular'` constants are mapped; units CLDR lacks stay unmapped (`unitIdentifier == nil`). Consumers conform their own `Dimension` subclasses the same way.

## Tests

Uses Swift Testing (`@Test`, `@Suite`). Test structure mirrors source layout.

## Gotchas

- **Linux Foundation lags Darwin.** `UnitFrequency.framesPerSecond` is missing from corelibs-foundation before Swift 6.4; `Units/UnitFrequency.swift` shims it behind `#if !canImport(Darwin) && compiler(<6.4)`. The Codable module can't reuse that shim, so it never references platform-gated constants. Check any new unit constant against Linux. `UnitInformationStorage.baseUnit()` is the byte on Darwin and the bit on Linux, so its `coherentScale` is derived from Foundation's own bit coefficient.
- **Linux inverts L/100km when converting out of it.** corelibs-foundation builds `UnitFuelEfficiency.litersPer100Kilometers` with a reciprocal converter, so `Measurement(value: x, unit: .litersPer100Kilometers).converted(to: .milesPerGallon)` is wrong there. `DimensionalMeasurement.convert(to: unit)` goes through the target unit's converter instead; don't route new code through `converted(to:)` from a base-unit measurement.
- **Adding a unit type** touches: `Units/<Unit>.swift` + a `DimensionalUnit` conformance (+ `.asX` accessor if it has one) in `SwiftMeasurement`; `Units/<Unit>+Identifiers.swift` in `SwiftMeasurementCodable`; and matching test files in both test targets. Also set its `coherentScale`, add it to the list in `Sources/GenerateTypedAlgebra/main.swift`, and rerun `swift run GenerateTypedAlgebra`.
