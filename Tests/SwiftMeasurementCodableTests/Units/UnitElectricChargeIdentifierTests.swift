import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("UnitElectricCharge identifiers")
struct UnitElectricChargeIdentifierTests {
    static var expected: [(identifier: String, unit: UnitElectricCharge)] {
        [
            ("coulomb", .coulombs),
        ]
    }

    @Test func identifiersRoundTrip() {
        for (identifier, unit) in Self.expected {
            #expect(unit.unitIdentifier == identifier)
            #expect(UnitElectricCharge.unit(forIdentifier: identifier) == unit)
        }
    }

    @Test func identifiersMatchGrammar() {
        for (identifier, _) in Self.expected {
            #expect(identifier.wholeMatch(of: /[a-z0-9-]+/) != nil)
        }
    }

    @Test func unknownIdentifierReturnsNil() {
        #expect(UnitElectricCharge.unit(forIdentifier: "no-such-unit") == nil)
        #expect(UnitElectricCharge(symbol: "??").unitIdentifier == nil)
    }
}
