import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("UnitAcceleration identifiers")
struct UnitAccelerationIdentifierTests {
    static var expected: [(identifier: String, unit: UnitAcceleration)] {
        [
            ("meter-per-square-second", .metersPerSecondSquared),
            ("g-force", .gravity),
        ]
    }

    @Test func identifiersRoundTrip() {
        for (identifier, unit) in Self.expected {
            #expect(unit.unitIdentifier == identifier)
            #expect(UnitAcceleration.unit(forIdentifier: identifier) == unit)
        }
    }

    @Test func identifiersMatchGrammar() {
        for (identifier, _) in Self.expected {
            #expect(identifier.wholeMatch(of: /[a-z0-9-]+/) != nil)
        }
    }

    @Test func unknownIdentifierReturnsNil() {
        #expect(UnitAcceleration.unit(forIdentifier: "no-such-unit") == nil)
        #expect(UnitAcceleration(symbol: "??").unitIdentifier == nil)
    }
}
