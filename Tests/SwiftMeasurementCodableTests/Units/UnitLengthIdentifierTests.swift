import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("UnitLength identifiers")
struct UnitLengthIdentifierTests {
    static var expected: [(identifier: String, unit: UnitLength)] {
        [
            ("kilometer", .kilometers),
            ("meter", .meters),
            ("decimeter", .decimeters),
            ("centimeter", .centimeters),
            ("millimeter", .millimeters),
            ("micrometer", .micrometers),
            ("nanometer", .nanometers),
            ("picometer", .picometers),
            ("inch", .inches),
            ("foot", .feet),
            ("yard", .yards),
            ("mile", .miles),
            ("mile-scandinavian", .scandinavianMiles),
            ("light-year", .lightyears),
            ("nautical-mile", .nauticalMiles),
            ("fathom", .fathoms),
            ("furlong", .furlongs),
            ("astronomical-unit", .astronomicalUnits),
            ("parsec", .parsecs),
        ]
    }

    @Test func identifiersRoundTrip() {
        for (identifier, unit) in Self.expected {
            #expect(unit.unitIdentifier == identifier)
            #expect(UnitLength.unit(forIdentifier: identifier) == unit)
        }
    }

    @Test func identifiersMatchGrammar() {
        for (identifier, _) in Self.expected {
            #expect(identifier.wholeMatch(of: /[a-z0-9-]+/) != nil)
        }
    }

    @Test func unknownIdentifierReturnsNil() {
        #expect(UnitLength.unit(forIdentifier: "no-such-unit") == nil)
        #expect(UnitLength(symbol: "??").unitIdentifier == nil)
    }
}
