import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Power")
struct UnitPowerTests {

    @Test("All Power unit properties are properly mapped")
    func allProperties() {
        let value = 1

        #expect(value.terawatts  == Measurement<UnitPower>(value: value, unit: .terawatts))
        #expect(value.gigawatts  == Measurement<UnitPower>(value: value, unit: .gigawatts))
        #expect(value.megawatts  == Measurement<UnitPower>(value: value, unit: .megawatts))
        #expect(value.kilowatts  == Measurement<UnitPower>(value: value, unit: .kilowatts))
        #expect(value.watts      == Measurement<UnitPower>(value: value, unit: .watts))
        #expect(value.milliwatts == Measurement<UnitPower>(value: value, unit: .milliwatts))
        #expect(value.microwatts == Measurement<UnitPower>(value: value, unit: .microwatts))
        #expect(value.nanowatts  == Measurement<UnitPower>(value: value, unit: .nanowatts))
        #expect(value.picowatts  == Measurement<UnitPower>(value: value, unit: .picowatts))
        #expect(value.femtowatts == Measurement<UnitPower>(value: value, unit: .femtowatts))
        #expect(value.horsepower == Measurement<UnitPower>(value: value, unit: .horsepower))
    }

    @Test("Double values produce correct measurements")
    func doubleValues() {
        let value: Double = 3.14
        #expect(value.watts == Measurement<UnitPower>(value: value, unit: .watts))
        #expect(value.kilowatts == Measurement<UnitPower>(value: value, unit: .kilowatts))
    }

    @Test("Float values produce correct measurements")
    func floatValues() {
        let value: Float = 2.5
        #expect(value.watts == Measurement<UnitPower>(value: value, unit: .watts))
        #expect(value.kilowatts == Measurement<UnitPower>(value: value, unit: .kilowatts))
    }

    @Test("Zero and negative values")
    func edgeCases() {
        #expect(0.watts == Measurement<UnitPower>(value: 0, unit: .watts))
        #expect((-5.0).watts == Measurement<UnitPower>(value: -5.0, unit: .watts))
    }
}
