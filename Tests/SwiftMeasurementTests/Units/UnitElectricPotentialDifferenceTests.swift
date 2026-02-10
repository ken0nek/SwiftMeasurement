import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Electric Potential Difference")
struct UnitElectricPotentialDifferenceTests {

    @Test("All Electric Potential Difference unit properties are properly mapped")
    func allProperties() {
        let value = 1

        #expect(value.megavolts  == Measurement<UnitElectricPotentialDifference>(value: value, unit: .megavolts))
        #expect(value.kilovolts  == Measurement<UnitElectricPotentialDifference>(value: value, unit: .kilovolts))
        #expect(value.volts      == Measurement<UnitElectricPotentialDifference>(value: value, unit: .volts))
        #expect(value.millivolts == Measurement<UnitElectricPotentialDifference>(value: value, unit: .millivolts))
        #expect(value.microvolts == Measurement<UnitElectricPotentialDifference>(value: value, unit: .microvolts))
    }

    @Test("Double values produce correct measurements")
    func doubleValues() {
        let value: Double = 3.14
        #expect(value.volts == Measurement<UnitElectricPotentialDifference>(value: value, unit: .volts))
        #expect(value.kilovolts == Measurement<UnitElectricPotentialDifference>(value: value, unit: .kilovolts))
    }

    @Test("Float values produce correct measurements")
    func floatValues() {
        let value: Float = 2.5
        #expect(value.volts == Measurement<UnitElectricPotentialDifference>(value: value, unit: .volts))
        #expect(value.kilovolts == Measurement<UnitElectricPotentialDifference>(value: value, unit: .kilovolts))
    }

    @Test("Zero and negative values")
    func edgeCases() {
        #expect(0.volts == Measurement<UnitElectricPotentialDifference>(value: 0, unit: .volts))
        #expect((-5.0).volts == Measurement<UnitElectricPotentialDifference>(value: -5.0, unit: .volts))
    }
}
