import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Dimensional System")
struct DimensionalSystemTests {

    @Suite("DimensionalExponents")
    struct DimensionalExponentsTests {

        @Test("Initialization")
        func initialization() {
            let length = DimensionalExponents(length: 1)
            #expect(length.length == 1)
            #expect(length.time == 0)
            #expect(length.mass == 0)

            let velocity = DimensionalExponents(length: 1, time: -1)
            #expect(velocity.length == 1)
            #expect(velocity.time == -1)
            #expect(velocity.mass == 0)

            let energy = DimensionalExponents(length: 2, time: -2, mass: 1)
            #expect(energy.length == 2)
            #expect(energy.time == -2)
            #expect(energy.mass == 1)
        }

        @Test("Addition")
        func addition() {
            let length = DimensionalExponents(length: 1)
            let time = DimensionalExponents(time: 1)

            let result = length + time
            #expect(result.length == 1)
            #expect(result.time == 1)
            #expect(result.mass == 0)
        }

        @Test("Subtraction")
        func subtraction() {
            let energy = DimensionalExponents(length: 2, time: -2, mass: 1)
            let mass = DimensionalExponents(mass: 1)

            let result = energy - mass
            #expect(result.length == 2)
            #expect(result.time == -2)
            #expect(result.mass == 0)
        }

        @Test("Multiplication")
        func multiplication() {
            let length = DimensionalExponents(length: 1)
            let result = length * 2

            #expect(result.length == 2)
            #expect(result.time == 0)
            #expect(result.mass == 0)
        }

        @Test("Dimensionless Check")
        func isDimensionless() {
            let dimensionless = DimensionalExponents()
            #expect(dimensionless.isDimensionless)

            let length = DimensionalExponents(length: 1)
            #expect(!length.isDimensionless)
        }

        @Test("String Representation")
        func description() {
            let length = DimensionalExponents(length: 1)
            #expect(length.description == "L^1")

            let velocity = DimensionalExponents(length: 1, time: -1)
            #expect(velocity.description == "L^1·T^-1")

            let dimensionless = DimensionalExponents()
            #expect(dimensionless.description == "dimensionless")
        }
    }

    @Suite("DimensionalUnit")
    struct DimensionalUnitTests {

        @Test("Unit Type Dimensional Exponents")
        func unitDimensions() {
            // Length
            #expect(UnitLength.dimensions == DimensionalExponents(length: 1))

            // Area
            #expect(UnitArea.dimensions == DimensionalExponents(length: 2))

            // Speed
            #expect(UnitSpeed.dimensions == DimensionalExponents(length: 1, time: -1))

            // Energy
            #expect(UnitEnergy.dimensions == DimensionalExponents(length: 2, time: -2, mass: 1))
        }
    }

    @Suite("DimensionalMeasurement")
    struct DimensionalMeasurementTests {

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

        @Test("Comparable Implementation")
        func comparable() {
            // Create measurements
            let length1 = DimensionalMeasurement(value: 10.0, dimensions: DimensionalExponents(length: 1))
            let length2 = DimensionalMeasurement(value: 20.0, dimensions: DimensionalExponents(length: 1))

            // Test comparison
            #expect(length1 < length2)
            #expect(length2 > length1)

            // Sort array
            let unsorted = [length2, length1]
            let sorted = unsorted.sorted()
            #expect(sorted == [length1, length2])
        }
    }
}
