# SwiftMeasurement

![Version](https://img.shields.io/cocoapods/v/SwiftMeasurement)
![License](https://img.shields.io/cocoapods/l/SwiftMeasurement)
![Platforms](https://img.shields.io/cocoapods/p/SwiftMeasurement)

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
- iOS 10 or later
- masOS 10.12 or later

## Installation

SwiftMeasurement supports multiple methods for installing the library in a project.

## Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like SwiftMeasurement in your projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

#### Podfile

To integrate SwiftMeasurement into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'SwiftMeasurement'
```

Then, run the following command:

```bash
$ pod install
```

### Installation with Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate SwiftMeasurement into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "ken0nek/SwiftMeasurement"
```

Run `carthage` to build the framework and drag the built `SwiftMeasurement.framework` into your Xcode project.

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

