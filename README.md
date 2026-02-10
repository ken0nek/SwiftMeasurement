# SwiftMeasurement

Fluent syntax and dimensional analysis for Foundation's `Measurement` types.

![Swift 6.0](https://img.shields.io/badge/Swift-6.0-orange)
![Platforms](https://img.shields.io/badge/Platforms-iOS%2017+%20|%20macOS%2014+%20|%20tvOS%2017+%20|%20watchOS%2010+%20|%20visionOS%201+-blue)
![License](https://img.shields.io/badge/License-MIT-green)

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

## Installation

**Xcode:** File > Add Package Dependencies > enter `https://github.com/ken0nek/SwiftMeasurement.git`

**Package.swift:**

```swift
dependencies: [
    .package(url: "https://github.com/ken0nek/SwiftMeasurement.git", from: "2.0.0")
]
```

## License

MIT License. See [LICENSE](LICENSE) for details.
