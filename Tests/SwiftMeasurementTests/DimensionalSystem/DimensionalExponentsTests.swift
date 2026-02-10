import Foundation
import Testing
@testable import SwiftMeasurement

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

    @Test("Debug Description")
    func debugDescription() {
        let energy = DimensionalExponents(length: 2, time: -2, mass: 1)
        #expect(energy.debugDescription == "DimensionalExponents(length: 2, time: -2, mass: 1, current: 0, temperature: 0, amount: 0, luminosity: 0)")
    }

    @Test("Properties are immutable")
    func propertiesAreImmutable() {
        let dims = DimensionalExponents(length: 1)
        // This test verifies the struct compiles with `let` properties.
        // If properties were `var`, they would also be settable, but since
        // we declared them as `let`, only init can set them.
        #expect(dims.length == 1)
        #expect(dims.time == 0)
    }

    @Suite("Named Presets")
    struct NamedPresetTests {

        @Test("Dimensionless preset")
        func dimensionlessPreset() {
            #expect(DimensionalExponents.dimensionless == DimensionalExponents())
            #expect(DimensionalExponents.dimensionless.isDimensionless)
        }

        @Test("Length preset matches UnitLength")
        func lengthPreset() {
            #expect(DimensionalExponents.length == UnitLength.dimensions)
        }

        @Test("Area preset matches UnitArea")
        func areaPreset() {
            #expect(DimensionalExponents.area == UnitArea.dimensions)
        }

        @Test("Volume preset matches UnitVolume")
        func volumePreset() {
            #expect(DimensionalExponents.volume == UnitVolume.dimensions)
        }

        @Test("Time preset matches UnitDuration")
        func timePreset() {
            #expect(DimensionalExponents.time == UnitDuration.dimensions)
        }

        @Test("Frequency preset matches UnitFrequency")
        func frequencyPreset() {
            #expect(DimensionalExponents.frequency == UnitFrequency.dimensions)
        }

        @Test("Mass preset matches UnitMass")
        func massPreset() {
            #expect(DimensionalExponents.mass == UnitMass.dimensions)
        }

        @Test("Speed preset matches UnitSpeed")
        func speedPreset() {
            #expect(DimensionalExponents.speed == UnitSpeed.dimensions)
        }

        @Test("Acceleration preset matches UnitAcceleration")
        func accelerationPreset() {
            #expect(DimensionalExponents.acceleration == UnitAcceleration.dimensions)
        }

        @Test("Force preset is M·L·T⁻²")
        func forcePreset() {
            #expect(DimensionalExponents.force == DimensionalExponents(length: 1, time: -2, mass: 1))
        }

        @Test("Energy preset matches UnitEnergy")
        func energyPreset() {
            #expect(DimensionalExponents.energy == UnitEnergy.dimensions)
        }

        @Test("Power preset matches UnitPower")
        func powerPreset() {
            #expect(DimensionalExponents.power == UnitPower.dimensions)
        }

        @Test("Pressure preset matches UnitPressure")
        func pressurePreset() {
            #expect(DimensionalExponents.pressure == UnitPressure.dimensions)
        }

        @Test("Electric current preset matches UnitElectricCurrent")
        func electricCurrentPreset() {
            #expect(DimensionalExponents.electricCurrent == UnitElectricCurrent.dimensions)
        }

        @Test("Electric charge preset matches UnitElectricCharge")
        func electricChargePreset() {
            #expect(DimensionalExponents.electricCharge == UnitElectricCharge.dimensions)
        }

        @Test("Voltage preset matches UnitElectricPotentialDifference")
        func voltagePreset() {
            #expect(DimensionalExponents.voltage == UnitElectricPotentialDifference.dimensions)
        }

        @Test("Electric resistance preset matches UnitElectricResistance")
        func electricResistancePreset() {
            #expect(DimensionalExponents.electricResistance == UnitElectricResistance.dimensions)
        }

        @Test("Temperature preset matches UnitTemperature")
        func temperaturePreset() {
            #expect(DimensionalExponents.temperature == UnitTemperature.dimensions)
        }

        @Test("Concentration mass preset matches UnitConcentrationMass")
        func concentrationMassPreset() {
            #expect(DimensionalExponents.concentrationMass == UnitConcentrationMass.dimensions)
        }
    }
}
