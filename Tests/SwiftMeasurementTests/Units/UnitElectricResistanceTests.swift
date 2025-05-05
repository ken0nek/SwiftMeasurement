import Foundation
import Testing
@testable import SwiftMeasurement

@Test("All electricresistance units properties are properly mapped")
func testElectricResistanceUnits() {
    let value = 1

    #expect(value.megaohms  == Measurement<UnitElectricResistance>(value: value, unit: .megaohms))
    #expect(value.kiloohms  == Measurement<UnitElectricResistance>(value: value, unit: .kiloohms))
    #expect(value.ohms      == Measurement<UnitElectricResistance>(value: value, unit: .ohms))
    #expect(value.milliohms == Measurement<UnitElectricResistance>(value: value, unit: .milliohms))
    #expect(value.microohms == Measurement<UnitElectricResistance>(value: value, unit: .microohms))
}
