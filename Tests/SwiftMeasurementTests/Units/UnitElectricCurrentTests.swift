import Foundation
import Testing
@testable import SwiftMeasurement

@Test("All electriccurrent units properties are properly mapped")
func testElectricCurrentUnits() {
    let value = 1

    #expect(value.megaamperes  == Measurement<UnitElectricCurrent>(value: value, unit: .megaamperes))
    #expect(value.kiloamperes  == Measurement<UnitElectricCurrent>(value: value, unit: .kiloamperes))
    #expect(value.amperes      == Measurement<UnitElectricCurrent>(value: value, unit: .amperes))
    #expect(value.milliamperes == Measurement<UnitElectricCurrent>(value: value, unit: .milliamperes))
    #expect(value.microamperes == Measurement<UnitElectricCurrent>(value: value, unit: .microamperes))
}
