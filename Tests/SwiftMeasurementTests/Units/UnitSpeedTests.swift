import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Speed")
struct UnitSpeedTests {

    @Test("All Speed unit properties are properly mapped")
    func allProperties() {
        let value = 1

        #expect(value.metersPerSecond   == Measurement<UnitSpeed>(value: value, unit: .metersPerSecond))
        #expect(value.kilometersPerHour == Measurement<UnitSpeed>(value: value, unit: .kilometersPerHour))
        #expect(value.milesPerHour      == Measurement<UnitSpeed>(value: value, unit: .milesPerHour))
        #expect(value.knots             == Measurement<UnitSpeed>(value: value, unit: .knots))
    }

    @Test("Double values produce correct measurements")
    func doubleValues() {
        let value: Double = 3.14
        #expect(value.metersPerSecond == Measurement<UnitSpeed>(value: value, unit: .metersPerSecond))
        #expect(value.kilometersPerHour == Measurement<UnitSpeed>(value: value, unit: .kilometersPerHour))
    }

    @Test("Float values produce correct measurements")
    func floatValues() {
        let value: Float = 2.5
        #expect(value.metersPerSecond == Measurement<UnitSpeed>(value: value, unit: .metersPerSecond))
        #expect(value.kilometersPerHour == Measurement<UnitSpeed>(value: value, unit: .kilometersPerHour))
    }

    @Test("Zero and negative values")
    func edgeCases() {
        #expect(0.metersPerSecond == Measurement<UnitSpeed>(value: 0, unit: .metersPerSecond))
        #expect((-5.0).metersPerSecond == Measurement<UnitSpeed>(value: -5.0, unit: .metersPerSecond))
    }
}
