# SwiftMeasurement

Fluent syntax and dimensional analysis for Foundation's `Measurement` types.

![Swift 6.0](https://img.shields.io/badge/Swift-6.0-orange)
![Platforms](https://img.shields.io/badge/Platforms-iOS%2017+%20|%20macOS%2014+%20|%20tvOS%2017+%20|%20watchOS%2010+%20|%20visionOS%201+%20|%20Linux-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![CI](https://github.com/ken0nek/SwiftMeasurement/actions/workflows/ci.yml/badge.svg)

## Quick Look

```swift
// Foundation
Measurement<UnitLength>(value: 42, unit: .kilometers)

// SwiftMeasurement
42.kilometers
```

Works with `Int`, `Double`, and `Float` across all 22 Foundation unit types.

## Dimensional Analysis

`DimensionalMeasurement` tracks SI dimension exponents automatically, so you can multiply, divide, and root physical quantities across different unit types.

```swift
// Speed × Time = Distance
let distance = 60.0.kilometersPerHour * 2.hours
distance.convert(to: UnitLength.kilometers)  // 120.0 km

// Length × Length = Area
let area = 10.0.meters * 5.0.meters
area.convert(to: UnitArea.squareMeters)  // 50.0 m²

// Square root
area.squareRoot()?.asLength  // back to meters
```

Typed accessors (`.asLength`, `.asArea`, `.asSpeed`, `.asEnergy`, etc.) convert back to `Measurement<T>` — returns `nil` if the dimensions don't match.

## Supported Units

<details>
<summary>All 22 unit types with example properties</summary>

| Unit Type | Example Properties |
|---|---|
| `UnitAcceleration` | `.metersPerSecondSquared`, `.gravity` |
| `UnitAngle` | `.degrees`, `.radians` |
| `UnitArea` | `.squareMeters`, `.squareKilometers`, `.hectares` |
| `UnitConcentrationMass` | `.gramsPerLiter`, `.milligramsPerDeciliter` |
| `UnitDispersion` | `.partsPerMillion` |
| `UnitDuration` | `.hours`, `.minutes`, `.seconds` |
| `UnitElectricCharge` | `.coulombs`, `.ampereHours` |
| `UnitElectricCurrent` | `.amperes`, `.milliamperes` |
| `UnitElectricPotentialDifference` | `.volts`, `.millivolts` |
| `UnitElectricResistance` | `.ohms`, `.kiloohms` |
| `UnitEnergy` | `.joules`, `.kilocalories`, `.kilowattHours` |
| `UnitFrequency` | `.hertz`, `.gigahertz` |
| `UnitFuelEfficiency` | `.litersPer100Kilometers`, `.milesPerGallon` |
| `UnitIlluminance` | `.lux` |
| `UnitInformationStorage` | `.bytes`, `.gigabytes`, `.terabytes` |
| `UnitLength` | `.kilometers`, `.meters`, `.miles`, `.feet` |
| `UnitMass` | `.kilograms`, `.grams`, `.pounds` |
| `UnitPower` | `.watts`, `.kilowatts`, `.horsepower` |
| `UnitPressure` | `.newtonsPerMetersSquared`, `.bars` |
| `UnitSpeed` | `.kilometersPerHour`, `.milesPerHour`, `.knots` |
| `UnitTemperature` | `.celsius`, `.fahrenheit`, `.kelvin` |
| `UnitVolume` | `.liters`, `.milliliters`, `.gallons` |

</details>

## SwiftMeasurementCodable

A standalone product (no dependency on the `SwiftMeasurement` module) that encodes and decodes `Measurement` values as stable, portable JSON:

```json
{"value": 21.5, "unit": "gram"}
```

`unit` is a [CLDR core unit identifier](https://www.unicode.org/reports/tr35/tr35-general.html#Unit_Elements) (CLDR 48.2) — the same vocabulary JavaScript's [`Intl.NumberFormat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#unit) accepts, so payloads stay locale-neutral and readable from any ecosystem. Foundation's built-in `Measurement` Codable shape (display symbols plus converter internals) is neither.

```swift
import Foundation
import SwiftMeasurementCodable

struct Recipe: Codable {
    var flour: CodableMeasurement<UnitMass>
    var oven: CodableMeasurement<UnitTemperature>
}

let recipe = Recipe(
    flour: Measurement(value: 500, unit: .grams).codable,
    oven: Measurement(value: 220, unit: .celsius).codable
)
let encoder = JSONEncoder()
encoder.outputFormatting = [.sortedKeys]   // stable key order on every platform
let data = try encoder.encode(recipe)
// {"flour":{"unit":"gram","value":500},"oven":{"unit":"celsius","value":220}}

let decoded = try JSONDecoder().decode(Recipe.self, from: data)
decoded.flour.measurement.converted(to: .ounces)
```

Add the product to your target:

```swift
.product(name: "SwiftMeasurementCodable", package: "SwiftMeasurement")
```

**Strict or lenient.** `CodableMeasurement` throws `DecodingError` on an unrecognized identifier. When your policy is "an unrecognized unit means the value is absent", decode `RawMeasurement` instead — it always succeeds, and typed access is failable:

```swift
let raw = try JSONDecoder().decode(RawMeasurement.self, from: json)
let mass: Measurement<UnitMass>? = raw.measurement(as: UnitMass.self)
```

**Mapping primitives.** The `UnitIdentifierRepresentable` protocol exposes both directions for custom wire shapes — `UnitMass.grams.unitIdentifier == "gram"` and `UnitMass.unit(forIdentifier: "ounce") == .ounces` — and lets you conform your own `Dimension` subclasses (see the protocol's documentation for the recipe).

Notes: encoding emits the measurement's current unit as-is (convert first to control the wire unit); all 22 Foundation `Dimension` types are covered for every constant with a regular CLDR 48.2 identifier; a few identifiers (e.g. `bar`) are valid CLDR but outside the smaller [ECMA-402 sanctioned subset](https://tc39.es/ecma402/#table-sanctioned-single-unit-identifiers) that `Intl.NumberFormat` formats.

## Installation

**Xcode:** File > Add Package Dependencies > enter `https://github.com/ken0nek/SwiftMeasurement.git`

**Package.swift:**

```swift
dependencies: [
    .package(url: "https://github.com/ken0nek/SwiftMeasurement.git", from: "2.3.0")
]
```

## License

MIT License. See [LICENSE](LICENSE) for details.
