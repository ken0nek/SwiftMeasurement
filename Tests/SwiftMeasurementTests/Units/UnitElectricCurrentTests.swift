import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Electric Current")
struct UnitElectricCurrentTests {

    @Test("All Electric Current unit properties are properly mapped")
    func allProperties() {
        let value = 1

        #expect(value.megaamperes  == Measurement<UnitElectricCurrent>(value: value, unit: .megaamperes))
        #expect(value.kiloamperes  == Measurement<UnitElectricCurrent>(value: value, unit: .kiloamperes))
        #expect(value.amperes      == Measurement<UnitElectricCurrent>(value: value, unit: .amperes))
        #expect(value.milliamperes == Measurement<UnitElectricCurrent>(value: value, unit: .milliamperes))
        #expect(value.microamperes == Measurement<UnitElectricCurrent>(value: value, unit: .microamperes))
    }

    @Test("Double values produce correct measurements")
    func doubleValues() {
        let value: Double = 3.14
        #expect(value.amperes == Measurement<UnitElectricCurrent>(value: value, unit: .amperes))
        #expect(value.milliamperes == Measurement<UnitElectricCurrent>(value: value, unit: .milliamperes))
    }

    @Test("Float values produce correct measurements")
    func floatValues() {
        let value: Float = 2.5
        #expect(value.amperes == Measurement<UnitElectricCurrent>(value: value, unit: .amperes))
        #expect(value.milliamperes == Measurement<UnitElectricCurrent>(value: value, unit: .milliamperes))
    }

    @Test("Zero and negative values")
    func edgeCases() {
        #expect(0.amperes == Measurement<UnitElectricCurrent>(value: 0, unit: .amperes))
        #expect((-5.0).amperes == Measurement<UnitElectricCurrent>(value: -5.0, unit: .amperes))
    }
}
