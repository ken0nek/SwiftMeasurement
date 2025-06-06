import Foundation
import Testing
@testable import SwiftMeasurement

@Test("All electricpotentialdifference units properties are properly mapped")
func testElectricPotentialDifferenceUnits() {
    let value = 1

    #expect(value.megavolts  == Measurement<UnitElectricPotentialDifference>(value: value, unit: .megavolts))
    #expect(value.kilovolts  == Measurement<UnitElectricPotentialDifference>(value: value, unit: .kilovolts))
    #expect(value.volts      == Measurement<UnitElectricPotentialDifference>(value: value, unit: .volts))
    #expect(value.millivolts == Measurement<UnitElectricPotentialDifference>(value: value, unit: .millivolts))
    #expect(value.microvolts == Measurement<UnitElectricPotentialDifference>(value: value, unit: .microvolts))
}
