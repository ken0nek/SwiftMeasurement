import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("UnitDuration identifiers")
struct UnitDurationIdentifierTests {
    static var expected: [(identifier: String, unit: UnitDuration)] {
        [
            ("hour", .hours),
            ("minute", .minutes),
            ("second", .seconds),
            ("millisecond", .milliseconds),
            ("microsecond", .microseconds),
            ("nanosecond", .nanoseconds),
        ]
    }

    @Test func identifiersRoundTrip() {
        for (identifier, unit) in Self.expected {
            #expect(unit.unitIdentifier == identifier)
            #expect(UnitDuration.unit(forIdentifier: identifier) == unit)
        }
    }

    @Test func identifiersMatchGrammar() {
        for (identifier, _) in Self.expected {
            #expect(identifier.wholeMatch(of: /[a-z0-9-]+/) != nil)
        }
    }

    @Test func unknownIdentifierReturnsNil() {
        #expect(UnitDuration.unit(forIdentifier: "no-such-unit") == nil)
        #expect(UnitDuration(symbol: "??").unitIdentifier == nil)
    }
}
