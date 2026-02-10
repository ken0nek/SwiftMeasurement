import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Electric Charge")
struct UnitElectricChargeTests {

    @Test("All Electric Charge unit properties are properly mapped")
    func allProperties() {
        let value = 1

        #expect(value.coulombs         == Measurement<UnitElectricCharge>(value: value, unit: .coulombs))
        #expect(value.megaampereHours  == Measurement<UnitElectricCharge>(value: value, unit: .megaampereHours))
        #expect(value.kiloampereHours  == Measurement<UnitElectricCharge>(value: value, unit: .kiloampereHours))
        #expect(value.ampereHours      == Measurement<UnitElectricCharge>(value: value, unit: .ampereHours))
        #expect(value.milliampereHours == Measurement<UnitElectricCharge>(value: value, unit: .milliampereHours))
        #expect(value.microampereHours == Measurement<UnitElectricCharge>(value: value, unit: .microampereHours))
    }

    @Test("Double values produce correct measurements")
    func doubleValues() {
        let value: Double = 3.14
        #expect(value.coulombs == Measurement<UnitElectricCharge>(value: value, unit: .coulombs))
        #expect(value.ampereHours == Measurement<UnitElectricCharge>(value: value, unit: .ampereHours))
    }

    @Test("Float values produce correct measurements")
    func floatValues() {
        let value: Float = 2.5
        #expect(value.coulombs == Measurement<UnitElectricCharge>(value: value, unit: .coulombs))
        #expect(value.ampereHours == Measurement<UnitElectricCharge>(value: value, unit: .ampereHours))
    }

    @Test("Zero and negative values")
    func edgeCases() {
        #expect(0.coulombs == Measurement<UnitElectricCharge>(value: 0, unit: .coulombs))
        #expect((-5.0).coulombs == Measurement<UnitElectricCharge>(value: -5.0, unit: .coulombs))
    }
}
