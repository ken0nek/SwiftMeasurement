import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("DimensionalUnit")
struct DimensionalUnitTests {

    @Test("Unit Type Dimensional Exponents")
    func unitDimensions() {
        // Length-based
        #expect(UnitLength.dimensions == DimensionalExponents(length: 1))
        #expect(UnitArea.dimensions == DimensionalExponents(length: 2))
        #expect(UnitVolume.dimensions == DimensionalExponents(length: 3))
        #expect(UnitSpeed.dimensions == DimensionalExponents(length: 1, time: -1))
        #expect(UnitAcceleration.dimensions == DimensionalExponents(length: 1, time: -2))
        #expect(UnitDispersion.dimensions == DimensionalExponents())

        // Time-based
        #expect(UnitDuration.dimensions == DimensionalExponents(time: 1))
        #expect(UnitFrequency.dimensions == DimensionalExponents(time: -1))

        // Mass-based
        #expect(UnitMass.dimensions == DimensionalExponents(mass: 1))
        #expect(UnitConcentrationMass.dimensions == DimensionalExponents(length: -3, mass: 1))

        // Energy and power
        #expect(UnitEnergy.dimensions == DimensionalExponents(length: 2, time: -2, mass: 1))
        #expect(UnitPower.dimensions == DimensionalExponents(length: 2, time: -3, mass: 1))
        #expect(UnitPressure.dimensions == DimensionalExponents(length: -1, time: -2, mass: 1))

        // Electrical
        #expect(UnitElectricCurrent.dimensions == DimensionalExponents(current: 1))
        #expect(UnitElectricCharge.dimensions == DimensionalExponents(time: 1, current: 1))
        #expect(UnitElectricPotentialDifference.dimensions == DimensionalExponents(length: 2, time: -3, mass: 1, current: -1))
        #expect(UnitElectricResistance.dimensions == DimensionalExponents(length: 2, time: -3, mass: 1, current: -2))

        // Other SI base units
        #expect(UnitTemperature.dimensions == DimensionalExponents(temperature: 1))
        #expect(UnitIlluminance.dimensions == DimensionalExponents(length: -2, luminosity: 1))

        // Dimensionless and special
        #expect(UnitAngle.dimensions == DimensionalExponents())
        #expect(UnitInformationStorage.dimensions == DimensionalExponents())
        #expect(UnitFuelEfficiency.dimensions == DimensionalExponents(length: -2))
    }
}
