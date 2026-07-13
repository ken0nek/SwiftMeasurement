import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("UnitFrequency identifiers")
struct UnitFrequencyIdentifierTests {
    static var expected: [(identifier: String, unit: UnitFrequency)] {
        [
            ("gigahertz", .gigahertz),
            ("megahertz", .megahertz),
            ("kilohertz", .kilohertz),
            ("hertz", .hertz),
        ]
    }

    @Test func identifiersRoundTrip() {
        for (identifier, unit) in Self.expected {
            #expect(unit.unitIdentifier == identifier)
            #expect(UnitFrequency.unit(forIdentifier: identifier) == unit)
        }
    }

    @Test func identifiersMatchGrammar() {
        for (identifier, _) in Self.expected {
            #expect(identifier.wholeMatch(of: /[a-z0-9-]+/) != nil)
        }
    }

    @Test func unknownIdentifierReturnsNil() {
        #expect(UnitFrequency.unit(forIdentifier: "no-such-unit") == nil)
        #expect(UnitFrequency(symbol: "??").unitIdentifier == nil)
    }
}
