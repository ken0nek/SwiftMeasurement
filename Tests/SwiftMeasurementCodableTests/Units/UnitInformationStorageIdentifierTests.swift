import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("UnitInformationStorage identifiers")
struct UnitInformationStorageIdentifierTests {
    static var expected: [(identifier: String, unit: UnitInformationStorage)] {
        [
            ("byte", .bytes),
            ("bit", .bits),
            ("petabyte", .petabytes),
            ("terabyte", .terabytes),
            ("gigabyte", .gigabytes),
            ("megabyte", .megabytes),
            ("kilobyte", .kilobytes),
            ("terabit", .terabits),
            ("gigabit", .gigabits),
            ("megabit", .megabits),
            ("kilobit", .kilobits),
        ]
    }

    @Test func identifiersRoundTrip() {
        for (identifier, unit) in Self.expected {
            #expect(unit.unitIdentifier == identifier)
            #expect(UnitInformationStorage.unit(forIdentifier: identifier) == unit)
        }
    }

    @Test func identifiersMatchGrammar() {
        for (identifier, _) in Self.expected {
            #expect(identifier.wholeMatch(of: /[a-z0-9-]+/) != nil)
        }
    }

    @Test func unknownIdentifierReturnsNil() {
        #expect(UnitInformationStorage.unit(forIdentifier: "no-such-unit") == nil)
        #expect(UnitInformationStorage(symbol: "??", converter: UnitConverterLinear(coefficient: 1)).unitIdentifier == nil)
    }
}
