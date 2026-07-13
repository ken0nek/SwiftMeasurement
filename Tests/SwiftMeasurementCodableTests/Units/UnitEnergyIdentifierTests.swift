import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("UnitEnergy identifiers")
struct UnitEnergyIdentifierTests {
    static var expected: [(identifier: String, unit: UnitEnergy)] {
        [
            ("kilojoule", .kilojoules),
            ("joule", .joules),
            ("kilocalorie", .kilocalories),
            ("calorie", .calories),
            ("kilowatt-hour", .kilowattHours),
        ]
    }

    @Test func identifiersRoundTrip() {
        for (identifier, unit) in Self.expected {
            #expect(unit.unitIdentifier == identifier)
            #expect(UnitEnergy.unit(forIdentifier: identifier) == unit)
        }
    }

    @Test func identifiersMatchGrammar() {
        for (identifier, _) in Self.expected {
            #expect(identifier.wholeMatch(of: /[a-z0-9-]+/) != nil)
        }
    }

    @Test func unknownIdentifierReturnsNil() {
        #expect(UnitEnergy.unit(forIdentifier: "no-such-unit") == nil)
        #expect(UnitEnergy(symbol: "??").unitIdentifier == nil)
    }
}
