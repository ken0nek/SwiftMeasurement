import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("UnitMass identifiers")
struct UnitMassIdentifierTests {
    /// Independent statement of the expected mapping — deliberately duplicates the
    /// implementation's table so a transcription slip in either place fails the suite.
    /// Computed (not stored) so the non-Sendable `Unit` values are never static state.
    static var expected: [(identifier: String, unit: UnitMass)] {
        [
            ("kilogram", .kilograms),
            ("gram", .grams),
            ("milligram", .milligrams),
            ("microgram", .micrograms),
            ("ounce", .ounces),
            ("pound", .pounds),
            ("stone", .stones),
            ("tonne", .metricTons),
            ("ton", .shortTons),
            ("carat", .carats),
            ("ounce-troy", .ouncesTroy),
            ("slug", .slugs),
        ]
    }

    @Test func identifiersRoundTrip() {
        for (identifier, unit) in Self.expected {
            #expect(unit.unitIdentifier == identifier)
            #expect(UnitMass.unit(forIdentifier: identifier) == unit)
        }
    }

    @Test func identifiersMatchGrammar() {
        for (identifier, _) in Self.expected {
            #expect(identifier.wholeMatch(of: /[a-z0-9-]+/) != nil)
        }
    }

    @Test func unknownIdentifierReturnsNil() {
        #expect(UnitMass.unit(forIdentifier: "parsec") == nil)
        #expect(UnitMass.unit(forIdentifier: "") == nil)
        #expect(UnitMass(symbol: "zz").unitIdentifier == nil)
    }
}
