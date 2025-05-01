import Foundation
import Testing
@testable import SwiftMeasurement

@Test func testUnitDuration() {
    let value = 1.0

    #expect(value.seconds == Measurement<UnitDuration>(value: value, unit: .seconds))
    #expect(value.minutes == Measurement<UnitDuration>(value: value, unit: .minutes))
    #expect(value.hours == Measurement<UnitDuration>(value: value, unit: .hours))
    #expect(value.milliseconds == Measurement<UnitDuration>(value: value, unit: .milliseconds))
    #expect(value.microseconds == Measurement<UnitDuration>(value: value, unit: .microseconds))
    #expect(value.nanoseconds == Measurement<UnitDuration>(value: value, unit: .nanoseconds))
    #expect(value.picoseconds == Measurement<UnitDuration>(value: value, unit: .picoseconds))
}
