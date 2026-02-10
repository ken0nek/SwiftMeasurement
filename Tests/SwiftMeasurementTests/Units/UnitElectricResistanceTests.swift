import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Electric Resistance")
struct UnitElectricResistanceTests {

    @Test("All Electric Resistance unit properties are properly mapped")
    func allProperties() {
        let value = 1

        #expect(value.megaohms  == Measurement<UnitElectricResistance>(value: value, unit: .megaohms))
        #expect(value.kiloohms  == Measurement<UnitElectricResistance>(value: value, unit: .kiloohms))
        #expect(value.ohms      == Measurement<UnitElectricResistance>(value: value, unit: .ohms))
        #expect(value.milliohms == Measurement<UnitElectricResistance>(value: value, unit: .milliohms))
        #expect(value.microohms == Measurement<UnitElectricResistance>(value: value, unit: .microohms))
    }

    @Test("Double values produce correct measurements")
    func doubleValues() {
        let value: Double = 3.14
        #expect(value.ohms == Measurement<UnitElectricResistance>(value: value, unit: .ohms))
        #expect(value.kiloohms == Measurement<UnitElectricResistance>(value: value, unit: .kiloohms))
    }

    @Test("Float values produce correct measurements")
    func floatValues() {
        let value: Float = 2.5
        #expect(value.ohms == Measurement<UnitElectricResistance>(value: value, unit: .ohms))
        #expect(value.kiloohms == Measurement<UnitElectricResistance>(value: value, unit: .kiloohms))
    }

    @Test("Zero and negative values")
    func edgeCases() {
        #expect(0.ohms == Measurement<UnitElectricResistance>(value: 0, unit: .ohms))
        #expect((-5.0).ohms == Measurement<UnitElectricResistance>(value: -5.0, unit: .ohms))
    }
}
