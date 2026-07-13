import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("UnitDispersion identifiers")
struct UnitDispersionIdentifierTests {
    static var expected: [(identifier: String, unit: UnitDispersion)] {
        [
            ("part-per-1e6", .partsPerMillion),
        ]
    }

    @Test func identifiersRoundTrip() {
        for (identifier, unit) in Self.expected {
            #expect(unit.unitIdentifier == identifier)
            #expect(UnitDispersion.unit(forIdentifier: identifier) == unit)
        }
    }

    @Test func identifiersMatchGrammar() {
        for (identifier, _) in Self.expected {
            #expect(identifier.wholeMatch(of: /[a-z0-9-]+/) != nil)
        }
    }

    @Test func unknownIdentifierReturnsNil() {
        #expect(UnitDispersion.unit(forIdentifier: "no-such-unit") == nil)
        #expect(UnitDispersion(symbol: "??").unitIdentifier == nil)
    }
}
