# SwiftMeasurement

The best way to deal with Measurements and Units in Swift.

Measurements and Units are introduced in iOS 10.
* [Measurements and Units - WWDC 2016 - Videos - Apple Developer](https://developer.apple.com/videos/play/wwdc2016/238/)

## Features

- Support for all units declared in the Foundation framework
- Easy conversion between different units
- Simple and intuitive API for working with measurements
- **Dimensional Analysis System** for type-safe calculations between different units
- **Automatic dimensional tracking** for operations like speed × time = distance
- **Math operations** for physical quantities with different dimensions
- **Smart conversion system** that understands physical relationships

## Usage

### Basic Operations

- before
```swift
Measurement<UnitLength>(value: 3, unit: .kilometers) + Measurement<UnitLength>(value: 4, unit: .kilometers)
```

- after
```swift
3.kilometers + 4.kilometers
```

### Dimensional Calculations

```swift
// Speed × Duration = Length
let speed = 60.0.kilometersPerHour
let time = 2.5.hours
let distance = speed * time  // returns an AnyMeasurement

// Convert to a specific measurement type
if let distanceInKm = distance.asLength?.converted(to: .kilometers) {
    print("Distance: \(distanceInKm)")  // 150.0 km
}

// Length × Length = Area
let length = 10.0.meters
let width = 5.0.meters
let area = length * width

if let areaInSqM = area.asArea?.converted(to: .squareMeters) {
    print("Area: \(areaInSqM)")  // 50.0 m²
}
```

## Installation

### Swift Package Manager (Recommended)

The [Swift Package Manager](https://swift.org/package-manager/) is the recommended way to add SwiftMeasurement to your project.

1. In Xcode, select File > Add Package Dependencies...
2. Enter the repository URL: `https://github.com/ken0nek/SwiftMeasurement.git`
3. Select "Up to Next Major Version" with the current version
4. Click "Add Package"

You can also add SwiftMeasurement as a dependency directly in your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/ken0nek/SwiftMeasurement.git", from: "2.0.0")
]
```

Then add the dependency to your target:

```swift
.target(
    name: "YourTarget",
    dependencies: ["SwiftMeasurement"]
)
```

### Swift Package Manager (Command Line)

You can also add SwiftMeasurement using the Swift Package Manager command line:

```bash
swift package add-dependency https://github.com/ken0nek/SwiftMeasurement.git
```

## License

SwiftMeasurement is available under the MIT license. See the LICENSE file for more info.
