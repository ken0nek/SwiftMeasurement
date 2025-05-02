import Foundation
import Testing
@testable import SwiftMeasurement

@Test func testUnitElectricCurrent() {
    let value = 1

    #expect(value.megaamperes  == Measurement<UnitElectricCurrent>(value: value, unit: .megaamperes))
    #expect(value.kiloamperes  == Measurement<UnitElectricCurrent>(value: value, unit: .kiloamperes))
    #expect(value.amperes      == Measurement<UnitElectricCurrent>(value: value, unit: .amperes))
    #expect(value.milliamperes == Measurement<UnitElectricCurrent>(value: value, unit: .milliamperes))
    #expect(value.microamperes == Measurement<UnitElectricCurrent>(value: value, unit: .microamperes))
}
