import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Concentration Mass")
struct UnitConcentrationMassTests {

    @Test("All Concentration Mass unit properties are properly mapped")
    func allProperties() {
        let value = 1

        #expect(value.gramsPerLiter          == Measurement<UnitConcentrationMass>(value: value, unit: .gramsPerLiter))
        #expect(value.milligramsPerDeciliter == Measurement<UnitConcentrationMass>(value: value, unit: .milligramsPerDeciliter))
    }

    @Test("Double values produce correct measurements")
    func doubleValues() {
        let value: Double = 3.14
        #expect(value.gramsPerLiter == Measurement<UnitConcentrationMass>(value: value, unit: .gramsPerLiter))
        #expect(value.milligramsPerDeciliter == Measurement<UnitConcentrationMass>(value: value, unit: .milligramsPerDeciliter))
    }

    @Test("Float values produce correct measurements")
    func floatValues() {
        let value: Float = 2.5
        #expect(value.gramsPerLiter == Measurement<UnitConcentrationMass>(value: value, unit: .gramsPerLiter))
        #expect(value.milligramsPerDeciliter == Measurement<UnitConcentrationMass>(value: value, unit: .milligramsPerDeciliter))
    }

    @Test("Zero and negative values")
    func edgeCases() {
        #expect(0.gramsPerLiter == Measurement<UnitConcentrationMass>(value: 0, unit: .gramsPerLiter))
        #expect((-5.0).gramsPerLiter == Measurement<UnitConcentrationMass>(value: -5.0, unit: .gramsPerLiter))
    }
}
