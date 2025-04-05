# SwiftMeasurement

The best way to deal with Measurements and Units in Swift.

Measurements and Units are newly introduced in iOS 10.
* [Measurements and Units - WWDC 2016 - Videos - Apple Developer](https://developer.apple.com/videos/play/wwdc2016/238/)

## Usage

- before
```swift

Measurement<UnitLength>(value: 3, unit: .kilometers) + Measurement<UnitLength>(value: 4, unit: .kilometers)
```

- after
```swift

3.kilometers + 4.kilometers
```

SwiftMeasurement supports all units declared in Foundation framework.

- UnitLength
- UnitFuelEfficiency
- UnitElectricResistance
- UnitIlluminance
- UnitDispersion
- UnitElectricCharge
- UnitVolume
- UnitEnergy
- UnitAngle
- UnitDuration
- UnitTemperature
- UnitFrequency
- UnitPower
- UnitElectricCurrent
- UnitElectricPotentialDifference
- UnitAcceleration
- UnitSpeed
- UnitArea
- UnitMass
- UnitConcentrationMass
- UnitPressure

## Requirements

Current version is compatible with:

- Swift 5.0+
- masOS 10.12 or later
- iOS 10.0 or later
- watchOS 3.0 or later
- tvOS 10.0 or later

## Installation

TBU

## Future features
- [ ] Describe relations between dimentions. [L, M, T, L/T, L/T^2, etc...]

```swift

// Speed * Duration -> Length

func * (lhs: Measurement<UnitSpeed>, rhs: Measurement<UnitDuration>) -> Measurement<UnitLength> {
    let v = lhs.converted(to: .baseUnit()).value * rhs.converted(to: .baseUnit()).value
        return Measurement<UnitLength>(value: v, unit: .baseUnit())

}

let duration = 10.hours // 10.0 hr
let speed = 5.kilometersPerHour // 5.0 km/h

(speed * duration).converted(to: .kilometers) // 50.00004 km
```

