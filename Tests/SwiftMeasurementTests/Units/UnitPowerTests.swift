import Foundation
import Testing
@testable import SwiftMeasurement

@Test func testUnitPower() {
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
