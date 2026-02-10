import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Duration")
struct UnitDurationTests {

    @Test("All Duration unit properties are properly mapped")
    func allProperties() {
        let value = 1

        #expect(value.seconds      == Measurement<UnitDuration>(value: value, unit: .seconds))
        #expect(value.minutes      == Measurement<UnitDuration>(value: value, unit: .minutes))
        #expect(value.hours        == Measurement<UnitDuration>(value: value, unit: .hours))
        #expect(value.milliseconds == Measurement<UnitDuration>(value: value, unit: .milliseconds))
        #expect(value.microseconds == Measurement<UnitDuration>(value: value, unit: .microseconds))
        #expect(value.nanoseconds  == Measurement<UnitDuration>(value: value, unit: .nanoseconds))
        #expect(value.picoseconds  == Measurement<UnitDuration>(value: value, unit: .picoseconds))
    }

    @Test("Double values produce correct measurements")
    func doubleValues() {
        let value: Double = 3.14
        #expect(value.seconds == Measurement<UnitDuration>(value: value, unit: .seconds))
        #expect(value.hours == Measurement<UnitDuration>(value: value, unit: .hours))
    }

    @Test("Float values produce correct measurements")
    func floatValues() {
        let value: Float = 2.5
        #expect(value.seconds == Measurement<UnitDuration>(value: value, unit: .seconds))
        #expect(value.hours == Measurement<UnitDuration>(value: value, unit: .hours))
    }

    @Test("Zero and negative values")
    func edgeCases() {
        #expect(0.seconds == Measurement<UnitDuration>(value: 0, unit: .seconds))
        #expect((-5.0).seconds == Measurement<UnitDuration>(value: -5.0, unit: .seconds))
    }
}
