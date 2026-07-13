import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("UnitElectricResistance identifiers")
struct UnitElectricResistanceIdentifierTests {
    static var expected: [(identifier: String, unit: UnitElectricResistance)] {
        [
            ("ohm", .ohms),
        ]
    }

    @Test func identifiersRoundTrip() {
        for (identifier, unit) in Self.expected {
            #expect(unit.unitIdentifier == identifier)
            #expect(UnitElectricResistance.unit(forIdentifier: identifier) == unit)
        }
    }

    @Test func identifiersMatchGrammar() {
        for (identifier, _) in Self.expected {
            #expect(identifier.wholeMatch(of: /[a-z0-9-]+/) != nil)
        }
    }

    @Test func unknownIdentifierReturnsNil() {
        #expect(UnitElectricResistance.unit(forIdentifier: "no-such-unit") == nil)
        #expect(UnitElectricResistance(symbol: "??").unitIdentifier == nil)
    }
}
