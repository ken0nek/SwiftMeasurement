import Foundation

/// A type-erased measurement that can be converted to a specific unit type
public struct DimensionalMeasurement: Equatable, Hashable, CustomStringConvertible, CustomDebugStringConvertible, Sendable {
    /// The value of the quantity in base units
    public let value: Double

    /// The dimensional signature of the quantity
    public let dimensions: DimensionalExponents

    /// Tolerance for floating-point comparison in == and hash(into:)
    private static let epsilon: Double = 1e-10

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

    /// Multiply by a scalar
    public static func * (lhs: DimensionalMeasurement, rhs: Double) -> DimensionalMeasurement {
        return DimensionalMeasurement(value: lhs.value * rhs, dimensions: lhs.dimensions)
    }

    /// Multiply a scalar by a measurement
    public static func * (lhs: Double, rhs: DimensionalMeasurement) -> DimensionalMeasurement {
        return DimensionalMeasurement(value: lhs * rhs.value, dimensions: rhs.dimensions)
    }

    /// Divide by a scalar
    public static func / (lhs: DimensionalMeasurement, rhs: Double) -> DimensionalMeasurement {
        return DimensionalMeasurement(value: lhs.value / rhs, dimensions: lhs.dimensions)
    }

    /// Divide a scalar by a measurement (reciprocal)
    public static func / (lhs: Double, rhs: DimensionalMeasurement) -> DimensionalMeasurement {
        return DimensionalMeasurement(value: lhs / rhs.value, dimensions: DimensionalExponents() - rhs.dimensions)
    }

    /// Add two measurements with the same dimensions.
    /// Traps if dimensions don't match.
    public static func + (lhs: DimensionalMeasurement, rhs: DimensionalMeasurement) -> DimensionalMeasurement {
        precondition(lhs.dimensions == rhs.dimensions, "Cannot add measurements with different dimensions: \(lhs.dimensions) vs \(rhs.dimensions)")
        return DimensionalMeasurement(value: lhs.value + rhs.value, dimensions: lhs.dimensions)
    }

    /// Subtract two measurements with the same dimensions.
    /// Traps if dimensions don't match.
    public static func - (lhs: DimensionalMeasurement, rhs: DimensionalMeasurement) -> DimensionalMeasurement {
        precondition(lhs.dimensions == rhs.dimensions, "Cannot subtract measurements with different dimensions: \(lhs.dimensions) vs \(rhs.dimensions)")
        return DimensionalMeasurement(value: lhs.value - rhs.value, dimensions: lhs.dimensions)
    }

    /// Negate a measurement
    public static prefix func - (measurement: DimensionalMeasurement) -> DimensionalMeasurement {
        return DimensionalMeasurement(value: -measurement.value, dimensions: measurement.dimensions)
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

    /// Convert directly to a specific unit (e.g., `.kilometers`).
    /// Returns `nil` if the dimensions don't match.
    public func convert<T: Dimension & DimensionalUnit>(to unit: T) -> Measurement<T>? {
        guard T.dimensions == dimensions else {
            return nil
        }
        return Measurement(value: value, unit: T.baseUnit()).converted(to: unit)
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
        return abs(lhs.value - rhs.value) < Self.epsilon
    }

    // MARK: - Hashable Protocol Implementation

    public func hash(into hasher: inout Hasher) {
        // Round to match the epsilon used in == so that
        // a == b always implies a.hashValue == b.hashValue.
        hasher.combine((value / Self.epsilon).rounded())
        hasher.combine(dimensions)
    }

    // MARK: - Safe Comparison

    /// Compare two measurements with the same dimensions.
    /// Returns `nil` if the dimensions don't match.
    public func isLessThan(_ other: DimensionalMeasurement) -> Bool? {
        guard dimensions == other.dimensions else {
            return nil
        }
        return value < other.value
    }

    /// Compare two measurements with the same dimensions.
    /// Returns `nil` if the dimensions don't match.
    public func isGreaterThan(_ other: DimensionalMeasurement) -> Bool? {
        guard dimensions == other.dimensions else {
            return nil
        }
        return value > other.value
    }

    /// Compare two measurements with the same dimensions.
    /// Returns `nil` if the dimensions don't match.
    public func isLessThanOrEqual(to other: DimensionalMeasurement) -> Bool? {
        guard dimensions == other.dimensions else {
            return nil
        }
        return value <= other.value
    }

    /// Compare two measurements with the same dimensions.
    /// Returns `nil` if the dimensions don't match.
    public func isGreaterThanOrEqual(to other: DimensionalMeasurement) -> Bool? {
        guard dimensions == other.dimensions else {
            return nil
        }
        return value >= other.value
    }

    // MARK: - Magnitude

    /// The absolute value of this measurement, preserving dimensions.
    public var magnitude: DimensionalMeasurement {
        return DimensionalMeasurement(value: abs(value), dimensions: dimensions)
    }

    // MARK: - Compound Assignment Operators

    /// Multiply-assign by a scalar
    public static func *= (lhs: inout DimensionalMeasurement, rhs: Double) {
        lhs = lhs * rhs
    }

    /// Divide-assign by a scalar
    public static func /= (lhs: inout DimensionalMeasurement, rhs: Double) {
        lhs = lhs / rhs
    }

    /// Add-assign a same-dimension measurement.
    /// Traps if dimensions don't match.
    public static func += (lhs: inout DimensionalMeasurement, rhs: DimensionalMeasurement) {
        lhs = lhs + rhs
    }

    /// Subtract-assign a same-dimension measurement.
    /// Traps if dimensions don't match.
    public static func -= (lhs: inout DimensionalMeasurement, rhs: DimensionalMeasurement) {
        lhs = lhs - rhs
    }

    // MARK: - CustomStringConvertible

    public var description: String {
        return "\(value) [\(dimensions)]"
    }

    // MARK: - CustomDebugStringConvertible

    public var debugDescription: String {
        return "DimensionalMeasurement(value: \(value), dimensions: \(dimensions.debugDescription))"
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
