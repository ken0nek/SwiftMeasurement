import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("UnitArea identifiers")
struct UnitAreaIdentifierTests {
    static var expected: [(identifier: String, unit: UnitArea)] {
        [
            ("square-kilometer", .squareKilometers),
            ("square-meter", .squareMeters),
            ("square-centimeter", .squareCentimeters),
            ("square-inch", .squareInches),
            ("square-foot", .squareFeet),
            ("square-yard", .squareYards),
            ("square-mile", .squareMiles),
            ("acre", .acres),
            ("hectare", .hectares),
        ]
    }

    @Test func identifiersRoundTrip() {
        for (identifier, unit) in Self.expected {
            #expect(unit.unitIdentifier == identifier)
            #expect(UnitArea.unit(forIdentifier: identifier) == unit)
        }
    }

    @Test func identifiersMatchGrammar() {
        for (identifier, _) in Self.expected {
            #expect(identifier.wholeMatch(of: /[a-z0-9-]+/) != nil)
        }
    }

    @Test func unknownIdentifierReturnsNil() {
        #expect(UnitArea.unit(forIdentifier: "no-such-unit") == nil)
        #expect(UnitArea(symbol: "??", converter: UnitConverterLinear(coefficient: 1)).unitIdentifier == nil)
    }
}
