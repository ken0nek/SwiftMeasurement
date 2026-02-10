import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Temperature")
struct UnitTemperatureTests {

    @Test("All Temperature unit properties are properly mapped")
    func allProperties() {
        let value = 1

        #expect(value.kelvin     == Measurement<UnitTemperature>(value: value, unit: .kelvin))
        #expect(value.celsius    == Measurement<UnitTemperature>(value: value, unit: .celsius))
        #expect(value.fahrenheit == Measurement<UnitTemperature>(value: value, unit: .fahrenheit))
    }

    @Test("Double values produce correct measurements")
    func doubleValues() {
        let value: Double = 3.14
        #expect(value.kelvin == Measurement<UnitTemperature>(value: value, unit: .kelvin))
        #expect(value.celsius == Measurement<UnitTemperature>(value: value, unit: .celsius))
    }

    @Test("Float values produce correct measurements")
    func floatValues() {
        let value: Float = 2.5
        #expect(value.kelvin == Measurement<UnitTemperature>(value: value, unit: .kelvin))
        #expect(value.celsius == Measurement<UnitTemperature>(value: value, unit: .celsius))
    }

    @Test("Zero and negative values")
    func edgeCases() {
        #expect(0.kelvin == Measurement<UnitTemperature>(value: 0, unit: .kelvin))
        #expect((-5.0).kelvin == Measurement<UnitTemperature>(value: -5.0, unit: .kelvin))
    }
}
