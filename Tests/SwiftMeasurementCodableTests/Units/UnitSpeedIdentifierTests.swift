import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("UnitSpeed identifiers")
struct UnitSpeedIdentifierTests {
    static var expected: [(identifier: String, unit: UnitSpeed)] {
        [
            ("meter-per-second", .metersPerSecond),
            ("kilometer-per-hour", .kilometersPerHour),
            ("mile-per-hour", .milesPerHour),
            ("knot", .knots),
        ]
    }

    @Test func identifiersRoundTrip() {
        for (identifier, unit) in Self.expected {
            #expect(unit.unitIdentifier == identifier)
            #expect(UnitSpeed.unit(forIdentifier: identifier) == unit)
        }
    }

    @Test func identifiersMatchGrammar() {
        for (identifier, _) in Self.expected {
            #expect(identifier.wholeMatch(of: /[a-z0-9-]+/) != nil)
        }
    }

    @Test func unknownIdentifierReturnsNil() {
        #expect(UnitSpeed.unit(forIdentifier: "no-such-unit") == nil)
        #expect(UnitSpeed(symbol: "??", converter: UnitConverterLinear(coefficient: 1)).unitIdentifier == nil)
    }
}
