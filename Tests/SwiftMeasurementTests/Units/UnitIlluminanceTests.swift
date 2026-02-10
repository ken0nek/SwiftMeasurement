import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Illuminance")
struct UnitIlluminanceTests {

    @Test("All Illuminance unit properties are properly mapped")
    func allProperties() {
        let value = 1

        #expect(value.lux == Measurement<UnitIlluminance>(value: value, unit: .lux))
    }

    @Test("Double values produce correct measurements")
    func doubleValues() {
        let value: Double = 3.14
        #expect(value.lux == Measurement<UnitIlluminance>(value: value, unit: .lux))
    }

    @Test("Float values produce correct measurements")
    func floatValues() {
        let value: Float = 2.5
        #expect(value.lux == Measurement<UnitIlluminance>(value: value, unit: .lux))
    }

    @Test("Zero and negative values")
    func edgeCases() {
        #expect(0.lux == Measurement<UnitIlluminance>(value: 0, unit: .lux))
        #expect((-5.0).lux == Measurement<UnitIlluminance>(value: -5.0, unit: .lux))
    }
}
