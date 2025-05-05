import Foundation
import Testing
@testable import SwiftMeasurement

@Test("All electriccharge units properties are properly mapped")
func testElectricChargeUnits() {
    let value = 1

    #expect(value.coulombs         == Measurement<UnitElectricCharge>(value: value, unit: .coulombs))
    #expect(value.megaampereHours  == Measurement<UnitElectricCharge>(value: value, unit: .megaampereHours))
    #expect(value.kiloampereHours  == Measurement<UnitElectricCharge>(value: value, unit: .kiloampereHours))
    #expect(value.ampereHours      == Measurement<UnitElectricCharge>(value: value, unit: .ampereHours))
    #expect(value.milliampereHours == Measurement<UnitElectricCharge>(value: value, unit: .milliampereHours))
    #expect(value.microampereHours == Measurement<UnitElectricCharge>(value: value, unit: .microampereHours))
}
