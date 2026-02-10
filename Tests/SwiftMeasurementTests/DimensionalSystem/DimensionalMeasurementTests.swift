import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("DimensionalMeasurement")
struct DimensionalMeasurementTests {

    @Suite("Core Operations")
    struct CoreOperationTests {

        @Test("Initialization")
        func initialization() {
            let measurement = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))
            #expect(measurement.value == 10.0)
            #expect(measurement.dimensions == DimensionalExponents(length: 1))

            let lengthMeasurement = Measurement(value: 20.0, unit: UnitLength.meters)
            let dimensionalMeasurement = DimensionalMeasurement(lengthMeasurement)
            #expect(dimensionalMeasurement.value == 20.0)
            #expect(dimensionalMeasurement.dimensions == UnitLength.dimensions)
        }

        @Test("Multiplication")
        func multiplication() {
            let length = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))
            let width = DimensionalMeasurement(value: 5.0, dimensions: DimensionalExponents(length: 1))

            let area = length * width
            #expect(area.value == 50.0)
            #expect(area.dimensions == DimensionalExponents(length: 2))
        }

        @Test("Division")
        func division() {
            let distance = DimensionalMeasurement(value: 100.0, dimensions: DimensionalExponents(length: 1))
            let time = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(time: 1))

            let speed = distance / time
            #expect(speed.value == 10.0)
            #expect(speed.dimensions == DimensionalExponents(length: 1, time: -1))
        }

        @Test("Power Operation")
        func power() {
            let length = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))

            let area = length.power(2)
            #expect(area.value == 100.0)
            #expect(area.dimensions == DimensionalExponents(length: 2))

            let volume = length.power(3)
            #expect(volume.value == 1000.0)
            #expect(volume.dimensions == DimensionalExponents(length: 3))
        }

        @Test("Square Root")
        func squareRoot() {
            let area = DimensionalMeasurement(value: 100.0, dimensions: DimensionalExponents(length: 2))

            let length = area.squareRoot()
            #expect(length != nil)
            #expect(length?.value == 10.0)
            #expect(length?.dimensions == DimensionalExponents(length: 1))

            // Test invalid square root (non-even exponents)
            let velocity = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1, time: -1))
            #expect(velocity.squareRoot() == nil)
        }

        @Test("Type Conversion")
        func conversion() {
            let dimensionalLength = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))

            // Convert to Length
            let length = dimensionalLength.convert(to: UnitLength.self)
            #expect(length != nil)
            #expect(length?.value == 10.0)
            #expect(length?.unit == UnitLength.meters)

            // Try to convert to incompatible unit
            #expect(dimensionalLength.convert(to: UnitMass.self) == nil)
        }

        @Test("Convenience Accessors")
        func convenienceAccessors() {
            let dimensionalLength = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))

            // Test asLength
            #expect(dimensionalLength.asLength != nil)
            #expect(dimensionalLength.asLength?.value == 10.0)
            #expect(dimensionalLength.asLength?.unit == UnitLength.meters)

            // Test asArea (should be nil)
            #expect(dimensionalLength.asArea == nil)

            // Create area measurement
            let dimensionalArea = DimensionalMeasurement(value: 100.0, dimensions: DimensionalExponents(length: 2))

            // Test asArea
            #expect(dimensionalArea.asArea != nil)
            #expect(dimensionalArea.asArea?.value == 100.0)
            #expect(dimensionalArea.asArea?.unit == UnitArea.squareMeters)
        }

        @Test("Dimensionless Quantity Creation")
        func dimensionlessQuantity() {
            let half = DimensionalMeasurement.dimensionless(0.5)

            #expect(half.value == 0.5)
            #expect(half.dimensions.isDimensionless)
        }
    }

    @Suite("Integration")
    struct IntegrationTests {

        @Test("Operator Overloads with Foundation Measurements")
        func operatorOverloadsWithFoundationMeasurements() {
            let speed = Measurement(value: 60.0, unit: UnitSpeed.kilometersPerHour)
            let time = Measurement(value: 2.5, unit: UnitDuration.hours)

            // Test multiplication
            let distance = speed * time

            #expect(distance.dimensions == UnitLength.dimensions)

            // Check value (60 km/h * 2.5 h = 150 km)
            // Since we're working with base units, we need to check the equivalent in meters
            let expectedMeters = 150_000.0 // 150 km in meters

            // Use a larger tolerance to account for floating point precision issues
            #expect(abs(distance.value - expectedMeters) < 0.15)

            // Convert time to DimensionalMeasurement for division
            let timeDimensional = DimensionalMeasurement(time)

            // Test division - distance is already DimensionalMeasurement
            let calculatedSpeed = distance / timeDimensional

            #expect(calculatedSpeed.dimensions == UnitSpeed.dimensions)

            // Convert to base units for comparison
            let speedInBaseUnits = speed.converted(to: .metersPerSecond).value
            #expect(abs(calculatedSpeed.value - speedInBaseUnits) < 0.15)
        }

        @Test("Physics Calculations with Dimensional Analysis")
        func physicsCalculations() {
            // Kinetic energy = 0.5 * m * v²
            let mass = Measurement(value: 2.0, unit: UnitMass.kilograms)
            let velocity = Measurement(value: 10.0, unit: UnitSpeed.metersPerSecond)

            let half = DimensionalMeasurement.dimensionless(0.5)
            let velocitySquared = DimensionalMeasurement(velocity).power(2)

            // Calculate kinetic energy
            let kineticEnergy = half * DimensionalMeasurement(mass) * velocitySquared

            // Check dimensions
            #expect(kineticEnergy.dimensions == UnitEnergy.dimensions)

            // Check value (0.5 * 2.0 kg * (10 m/s)² = 100 J)
            let energyInJoules = kineticEnergy.asEnergy?.converted(to: .joules)
            #expect(energyInJoules != nil)
            #expect(abs(energyInJoules!.value - 100.0) < 0.1)
        }
    }

    @Suite("Protocol Conformance")
    struct ProtocolConformanceTests {

        @Test("Equatable Implementation")
        func equatable() {
            // Create two equal measurements
            let length1 = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))
            let length2 = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))

            // Test equality
            #expect(length1 == length2)

            // Create different measurements
            let length3 = DimensionalMeasurement(value: 20.0, dimensions: DimensionalExponents(length: 1))
            #expect(length1 != length3)

            // Test different dimensions
            let time = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(time: 1))
            #expect(length1 != time)
        }

        @Test("Hashable Implementation")
        func hashable() {
            // Create measurement
            let length = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))

            // Use as dictionary key
            var dict: [DimensionalMeasurement: String] = [:]
            dict[length] = "Length measurement"

            // Retrieve value
            #expect(dict[length] == "Length measurement")
        }

        @Test("Safe Comparison - Same Dimensions")
        func safeComparisonSameDimensions() {
            let length1 = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))
            let length2 = DimensionalMeasurement(value: 20.0, dimensions: DimensionalExponents(length: 1))

            #expect(length1.isLessThan(length2) == true)
            #expect(length2.isLessThan(length1) == false)
            #expect(length2.isGreaterThan(length1) == true)
            #expect(length1.isGreaterThan(length2) == false)
        }

        @Test("Safe Comparison - Different Dimensions Returns Nil")
        func safeComparisonDifferentDimensions() {
            let length = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))
            let time = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(time: 1))

            #expect(length.isLessThan(time) == nil)
            #expect(length.isGreaterThan(time) == nil)
        }

        @Test("CustomStringConvertible - DimensionalMeasurement")
        func dimensionalMeasurementDescription() {
            let length = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))
            #expect("\(length)" == "10.0 [L^1]")

            let dimensionless = DimensionalMeasurement.dimensionless(2.5)
            #expect("\(dimensionless)" == "2.5 [dimensionless]")
        }
    }

    @Suite("Scalar Arithmetic")
    struct ScalarArithmeticTests {

        @Test("Multiply by scalar")
        func multiplyByScalar() {
            let length = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))

            let doubled = length * 2.0
            #expect(doubled.value == 20.0)
            #expect(doubled.dimensions == DimensionalExponents(length: 1))

            let prefixed = 3.0 * length
            #expect(prefixed.value == 30.0)
            #expect(prefixed.dimensions == DimensionalExponents(length: 1))
        }

        @Test("Divide by scalar")
        func divideByScalar() {
            let length = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))

            let halved = length / 2.0
            #expect(halved.value == 5.0)
            #expect(halved.dimensions == DimensionalExponents(length: 1))
        }

        @Test("Kinetic energy with scalar multiplication")
        func kineticEnergyWithScalar() {
            let mass = Measurement(value: 2.0, unit: UnitMass.kilograms)
            let velocity = Measurement(value: 10.0, unit: UnitSpeed.metersPerSecond)

            let kineticEnergy = 0.5 * DimensionalMeasurement(mass) * DimensionalMeasurement(velocity).power(2)

            #expect(kineticEnergy.dimensions == UnitEnergy.dimensions)
            #expect(abs(kineticEnergy.value - 100.0) < 0.1)
        }
    }

    @Suite("Addition and Subtraction")
    struct AdditionSubtractionTests {

        @Test("Add same-dimension measurements")
        func addSameDimension() {
            let a = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))
            let b = DimensionalMeasurement(value: 5.0, dimensions: DimensionalExponents(length: 1))

            let sum = a + b
            #expect(sum.value == 15.0)
            #expect(sum.dimensions == DimensionalExponents(length: 1))
        }

        @Test("Subtract same-dimension measurements")
        func subtractSameDimension() {
            let a = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))
            let b = DimensionalMeasurement(value: 3.0, dimensions: DimensionalExponents(length: 1))

            let diff = a - b
            #expect(diff.value == 7.0)
            #expect(diff.dimensions == DimensionalExponents(length: 1))
        }

        @Test("Unary negation")
        func unaryNegation() {
            let length = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))

            let negated = -length
            #expect(negated.value == -10.0)
            #expect(negated.dimensions == DimensionalExponents(length: 1))
        }
    }

    @Suite("Reciprocal Operator")
    struct ReciprocalOperatorTests {

        @Test("Scalar divided by measurement gives reciprocal dimensions")
        func scalarDividedByMeasurement() {
            let frequency = DimensionalMeasurement(value: 2.0, dimensions: DimensionalExponents(time: -1))
            let result = 1.0 / frequency

            #expect(result.value == 0.5)
            #expect(result.dimensions == DimensionalExponents(time: 1))
        }

        @Test("1/frequency gives duration dimensions")
        func reciprocalFrequencyGivesDuration() {
            let freq = DimensionalMeasurement(Measurement(value: 5.0, unit: UnitFrequency.hertz))
            let period = 1.0 / freq

            #expect(period.dimensions == UnitDuration.dimensions)
            #expect(abs(period.value - 0.2) < 1e-10)
        }

        @Test("Reciprocal in physics: period from frequency")
        func periodFromFrequency() {
            let freq = DimensionalMeasurement(Measurement(value: 440.0, unit: UnitFrequency.hertz))
            let period = 1.0 / freq
            let durationSeconds = period.asDuration?.converted(to: .seconds)

            #expect(durationSeconds != nil)
            #expect(abs(durationSeconds!.value - 1.0 / 440.0) < 1e-10)
        }
    }

    @Suite("Comparison Extensions")
    struct ComparisonExtensionTests {

        @Test("isLessThanOrEqual - same dimensions")
        func lessThanOrEqualSameDimensions() {
            let a = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))
            let b = DimensionalMeasurement(value: 20.0, dimensions: DimensionalExponents(length: 1))
            let c = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))

            #expect(a.isLessThanOrEqual(to: b) == true)
            #expect(b.isLessThanOrEqual(to: a) == false)
            #expect(a.isLessThanOrEqual(to: c) == true)
        }

        @Test("isGreaterThanOrEqual - same dimensions")
        func greaterThanOrEqualSameDimensions() {
            let a = DimensionalMeasurement(value: 20.0, dimensions: DimensionalExponents(length: 1))
            let b = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))
            let c = DimensionalMeasurement(value: 20.0, dimensions: DimensionalExponents(length: 1))

            #expect(a.isGreaterThanOrEqual(to: b) == true)
            #expect(b.isGreaterThanOrEqual(to: a) == false)
            #expect(a.isGreaterThanOrEqual(to: c) == true)
        }

        @Test("isLessThanOrEqual - different dimensions returns nil")
        func lessThanOrEqualDifferentDimensions() {
            let length = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))
            let time = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(time: 1))

            #expect(length.isLessThanOrEqual(to: time) == nil)
        }

        @Test("isGreaterThanOrEqual - different dimensions returns nil")
        func greaterThanOrEqualDifferentDimensions() {
            let length = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))
            let time = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(time: 1))

            #expect(length.isGreaterThanOrEqual(to: time) == nil)
        }
    }

    @Suite("Magnitude")
    struct MagnitudeTests {

        @Test("Magnitude of positive value")
        func magnitudePositive() {
            let length = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))
            #expect(length.magnitude.value == 10.0)
            #expect(length.magnitude.dimensions == DimensionalExponents(length: 1))
        }

        @Test("Magnitude of negative value")
        func magnitudeNegative() {
            let length = DimensionalMeasurement(value: -10.0, dimensions: DimensionalExponents(length: 1))
            #expect(length.magnitude.value == 10.0)
            #expect(length.magnitude.dimensions == DimensionalExponents(length: 1))
        }

        @Test("Magnitude of zero")
        func magnitudeZero() {
            let zero = DimensionalMeasurement(value: 0.0, dimensions: DimensionalExponents(length: 1))
            #expect(zero.magnitude.value == 0.0)
        }
    }

    @Suite("Compound Assignment")
    struct CompoundAssignmentTests {

        @Test("Multiply-assign by scalar")
        func multiplyAssign() {
            var length = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))
            length *= 3.0
            #expect(length.value == 30.0)
            #expect(length.dimensions == DimensionalExponents(length: 1))
        }

        @Test("Divide-assign by scalar")
        func divideAssign() {
            var length = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))
            length /= 2.0
            #expect(length.value == 5.0)
            #expect(length.dimensions == DimensionalExponents(length: 1))
        }

        @Test("Add-assign same dimensions")
        func addAssign() {
            var length = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))
            let extra = DimensionalMeasurement(value: 5.0, dimensions: DimensionalExponents(length: 1))
            length += extra
            #expect(length.value == 15.0)
            #expect(length.dimensions == DimensionalExponents(length: 1))
        }

        @Test("Subtract-assign same dimensions")
        func subtractAssign() {
            var length = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))
            let sub = DimensionalMeasurement(value: 3.0, dimensions: DimensionalExponents(length: 1))
            length -= sub
            #expect(length.value == 7.0)
            #expect(length.dimensions == DimensionalExponents(length: 1))
        }
    }

    @Suite("Convert to Unit")
    struct ConvertToUnitTests {

        @Test("Convert to specific unit")
        func convertToSpecificUnit() {
            let distance = DimensionalMeasurement(value: 1000.0, dimensions: DimensionalExponents(length: 1))
            let km = distance.convert(to: UnitLength.kilometers)

            #expect(km != nil)
            #expect(abs(km!.value - 1.0) < 1e-10)
            #expect(km!.unit == UnitLength.kilometers)
        }

        @Test("Convert to incompatible unit returns nil")
        func convertToIncompatibleUnit() {
            let distance = DimensionalMeasurement(value: 1000.0, dimensions: DimensionalExponents(length: 1))
            let result = distance.convert(to: UnitMass.kilograms)

            #expect(result == nil)
        }

        @Test("Convert speed to km/h")
        func convertSpeedToKmh() {
            // 10 m/s
            let speed = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1, time: -1))
            let kmh = speed.convert(to: UnitSpeed.kilometersPerHour)

            #expect(kmh != nil)
            #expect(abs(kmh!.value - 36.0) < 0.01)
        }
    }

    @Suite("Debug Description")
    struct DebugDescriptionTests {

        @Test("DimensionalMeasurement debug description")
        func debugDescription() {
            let length = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))
            let debug = String(reflecting: length)
            #expect(debug.contains("DimensionalMeasurement"))
            #expect(debug.contains("10.0"))
            #expect(debug.contains("DimensionalExponents"))
        }
    }

    @Suite("Edge Cases")
    struct EdgeCaseTests {

        @Test("Division by zero produces infinity")
        func divisionByZero() {
            let length = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))
            let zero = DimensionalMeasurement(value: 0.0, dimensions: DimensionalExponents(time: 1))

            let result = length / zero
            #expect(result.value.isInfinite)
        }

        @Test("Very large values")
        func veryLargeValues() {
            let big = DimensionalMeasurement(value: 1e100, dimensions: DimensionalExponents(length: 1))
            let small = DimensionalMeasurement(value: 1e-100, dimensions: DimensionalExponents(length: 1))

            let product = big * small
            #expect(product.dimensions == DimensionalExponents(length: 2))
            #expect(product.value == 1.0)
        }

        @Test("Negative value square root returns NaN value")
        func negativeSquareRoot() {
            let area = DimensionalMeasurement(value: -4.0, dimensions: DimensionalExponents(length: 2))
            let result = area.squareRoot()
            // squareRoot of negative number: exponents are valid but value is NaN
            #expect(result != nil)
            #expect(result!.value.isNaN)
        }

        @Test("Power with zero exponent gives dimensionless")
        func powerZero() {
            let length = DimensionalMeasurement(value: 5.0, dimensions: DimensionalExponents(length: 1))
            let result = length.power(0)

            #expect(result.value == 1.0)
            #expect(result.dimensions.isDimensionless)
        }

        @Test("Measurement dimensionalMeasurement extension property")
        func dimensionalMeasurementExtension() {
            let speed = Measurement(value: 60.0, unit: UnitSpeed.kilometersPerHour)
            let dimensional = speed.dimensionalMeasurement

            #expect(dimensional.dimensions == UnitSpeed.dimensions)
            let expectedBaseValue = speed.converted(to: .metersPerSecond).value
            #expect(abs(dimensional.value - expectedBaseValue) < 1e-10)
        }

        @Test("Hashable contract: equal values produce equal hashes")
        func hashableContract() {
            let a = DimensionalMeasurement(value: 1.0, dimensions: DimensionalExponents(length: 1))
            let b = DimensionalMeasurement(value: 1.0 + 1e-12, dimensions: DimensionalExponents(length: 1))

            // These should be equal per epsilon comparison
            #expect(a == b)
            // And must produce the same hash
            #expect(a.hashValue == b.hashValue)
        }

        @Test("Sendable conformance")
        func sendable() {
            let measurement = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))
            let exponents = DimensionalExponents(length: 1)

            // Verify these can be sent across concurrency boundaries
            let _: any Sendable = measurement
            let _: any Sendable = exponents
        }

        @Test("UnitDispersion is dimensionless")
        func unitDispersionDimensionless() {
            let dispersion = DimensionalMeasurement(value: 1.0, dimensions: DimensionalExponents())
            #expect(dispersion.asDispersion != nil)

            // Dispersion should be dimensionless, not length^-1
            #expect(UnitDispersion.dimensions.isDimensionless)
        }
    }
}
