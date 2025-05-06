import Foundation

/// A type-erased measurement that can be converted to a specific unit type
public struct DimensionalMeasurement: Equatable, Hashable, Comparable {
    /// The value of the quantity in base units
    public let value: Double

    /// The dimensional signature of the quantity
    public let dimensions: DimensionalExponents

    /// Initialize with a value and dimension exponents
    public init(value: Double, dimensions: DimensionalExponents) {
        self.value = value
        self.dimensions = dimensions
    }

    /// Create from a Foundation Measurement
    public init<UnitType: Dimension & DimensionalUnit>(_ measurement: Measurement<UnitType>) {
        self.value = measurement.converted(to: UnitType.baseUnit()).value
        self.dimensions = UnitType.dimensions
    }

    // MARK: - Mathematical Operations

    /// Multiply two measurements
    public static func * (lhs: DimensionalMeasurement, rhs: DimensionalMeasurement) -> DimensionalMeasurement {
        return DimensionalMeasurement(
            value: lhs.value * rhs.value,
            dimensions: lhs.dimensions + rhs.dimensions
        )
    }

    /// Divide two measurements
    public static func / (lhs: DimensionalMeasurement, rhs: DimensionalMeasurement) -> DimensionalMeasurement {
        return DimensionalMeasurement(
            value: lhs.value / rhs.value,
            dimensions: lhs.dimensions - rhs.dimensions
        )
    }

    /// Raise to a power
    public func power(_ exponent: Int) -> DimensionalMeasurement {
        return DimensionalMeasurement(
            value: pow(value, Double(exponent)),
            dimensions: dimensions * exponent
        )
    }

    /// Take the square root
    public func squareRoot() -> DimensionalMeasurement? {
        // Check if all exponents are even numbers
        let halfExponents = DimensionalExponents(
            length: dimensions.length / 2,
            time: dimensions.time / 2,
            mass: dimensions.mass / 2,
            current: dimensions.current / 2,
            temperature: dimensions.temperature / 2,
            amount: dimensions.amount / 2,
            luminosity: dimensions.luminosity / 2
        )

        // Verify that we don't have fractional exponents
        guard halfExponents * 2 == dimensions else {
            return nil
        }

        return DimensionalMeasurement(
            value: Darwin.sqrt(value),
            dimensions: halfExponents
        )
    }

    // MARK: - Conversion Methods

    /// Convert to a specific Foundation Measurement type
    public func convert<T: Dimension & DimensionalUnit>(to unitType: T.Type) -> Measurement<T>? {
        // Check if dimensions match
        guard T.dimensions == dimensions else {
            return nil
        }

        return Measurement(value: value, unit: T.baseUnit())
    }

    /// Create dimensionless quantity (scalar)
    public static func dimensionless(_ value: Double) -> DimensionalMeasurement {
        return DimensionalMeasurement(value: value, dimensions: DimensionalExponents())
    }

    // MARK: - Equatable Protocol Implementation

    public static func == (lhs: DimensionalMeasurement, rhs: DimensionalMeasurement) -> Bool {
        // First check if dimensions match
        guard lhs.dimensions == rhs.dimensions else {
            return false
        }

        // Then check if values are equal (using some epsilon for floating point comparison)
        let epsilon = 1e-10
        return abs(lhs.value - rhs.value) < epsilon
    }

    // MARK: - Hashable Protocol Implementation

    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
        hasher.combine(dimensions)
    }

    // MARK: - Comparable Protocol Implementation

    public static func < (lhs: DimensionalMeasurement, rhs: DimensionalMeasurement) -> Bool {
        // Can only compare measurements with the same dimensions
        guard lhs.dimensions == rhs.dimensions else {
            fatalError("Cannot compare measurements with different dimensions")
        }

        return lhs.value < rhs.value
    }

    // MARK: - Convenience Type Conversions

    public var asLength: Measurement<UnitLength>? {
        return convert(to: UnitLength.self)
    }

    public var asArea: Measurement<UnitArea>? {
        return convert(to: UnitArea.self)
    }

    public var asVolume: Measurement<UnitVolume>? {
        return convert(to: UnitVolume.self)
    }

    public var asDispersion: Measurement<UnitDispersion>? {
        return convert(to: UnitDispersion.self)
    }

    public var asDuration: Measurement<UnitDuration>? {
        return convert(to: UnitDuration.self)
    }

    public var asFrequency: Measurement<UnitFrequency>? {
        return convert(to: UnitFrequency.self)
    }

    public var asSpeed: Measurement<UnitSpeed>? {
        return convert(to: UnitSpeed.self)
    }

    public var asAcceleration: Measurement<UnitAcceleration>? {
        return convert(to: UnitAcceleration.self)
    }

    public var asMass: Measurement<UnitMass>? {
        return convert(to: UnitMass.self)
    }

    public var asConcentrationMass: Measurement<UnitConcentrationMass>? {
        return convert(to: UnitConcentrationMass.self)
    }

    public var asEnergy: Measurement<UnitEnergy>? {
        return convert(to: UnitEnergy.self)
    }

    public var asPower: Measurement<UnitPower>? {
        return convert(to: UnitPower.self)
    }

    public var asPressure: Measurement<UnitPressure>? {
        return convert(to: UnitPressure.self)
    }

    public var asElectricCurrent: Measurement<UnitElectricCurrent>? {
        return convert(to: UnitElectricCurrent.self)
    }

    public var asElectricPotentialDifference: Measurement<UnitElectricPotentialDifference>? {
        return convert(to: UnitElectricPotentialDifference.self)
    }

    public var asElectricResistance: Measurement<UnitElectricResistance>? {
        return convert(to: UnitElectricResistance.self)
    }

    public var asElectricCharge: Measurement<UnitElectricCharge>? {
        return convert(to: UnitElectricCharge.self)
    }

    public var asTemperature: Measurement<UnitTemperature>? {
        return convert(to: UnitTemperature.self)
    }

    public var asIlluminance: Measurement<UnitIlluminance>? {
        return convert(to: UnitIlluminance.self)
    }

    public var asAngle: Measurement<UnitAngle>? {
        return convert(to: UnitAngle.self)
    }

    public var asInformationStorage: Measurement<UnitInformationStorage>? {
        return convert(to: UnitInformationStorage.self)
    }

    public var asFuelEfficiency: Measurement<UnitFuelEfficiency>? {
        return convert(to: UnitFuelEfficiency.self)
    }
}

// MARK: - Operator Overloads for Foundation Measurements

/// Multiply Foundation measurements with different unit types
public func * <T: Dimension & DimensionalUnit, U: Dimension & DimensionalUnit>(
    lhs: Measurement<T>,
    rhs: Measurement<U>
) -> DimensionalMeasurement {
    return DimensionalMeasurement(lhs) * DimensionalMeasurement(rhs)
}

/// Divide Foundation measurements with different unit types
public func / <T: Dimension & DimensionalUnit, U: Dimension & DimensionalUnit>(
    lhs: Measurement<T>,
    rhs: Measurement<U>
) -> DimensionalMeasurement {
    return DimensionalMeasurement(lhs) / DimensionalMeasurement(rhs)
}

// MARK: - Extension Methods for Foundation.Measurement

extension Measurement where UnitType: Dimension & DimensionalUnit {
    /// Convert to a dimensional measurement
    public var dimensionalMeasurement: DimensionalMeasurement {
        return DimensionalMeasurement(self)
    }
}
