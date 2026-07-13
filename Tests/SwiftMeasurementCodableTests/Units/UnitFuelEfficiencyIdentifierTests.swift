import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("UnitFuelEfficiency identifiers")
struct UnitFuelEfficiencyIdentifierTests {
    static var expected: [(identifier: String, unit: UnitFuelEfficiency)] {
        [
            ("liter-per-100-kilometer", .litersPer100Kilometers),
            ("mile-per-gallon", .milesPerGallon),
            ("mile-per-gallon-imperial", .milesPerImperialGallon),
        ]
    }

    @Test func identifiersRoundTrip() {
        for (identifier, unit) in Self.expected {
            #expect(unit.unitIdentifier == identifier)
            #expect(UnitFuelEfficiency.unit(forIdentifier: identifier) == unit)
        }
    }

    @Test func identifiersMatchGrammar() {
        for (identifier, _) in Self.expected {
            #expect(identifier.wholeMatch(of: /[a-z0-9-]+/) != nil)
        }
    }

    @Test func unknownIdentifierReturnsNil() {
        #expect(UnitFuelEfficiency.unit(forIdentifier: "no-such-unit") == nil)
        #expect(UnitFuelEfficiency(symbol: "??", converter: UnitConverterLinear(coefficient: 1)).unitIdentifier == nil)
    }
}
