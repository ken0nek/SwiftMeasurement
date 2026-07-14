import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("UnitTemperature identifiers")
struct UnitTemperatureIdentifierTests {
    static var expected: [(identifier: String, unit: UnitTemperature)] {
        [
            ("kelvin", .kelvin),
            ("celsius", .celsius),
            ("fahrenheit", .fahrenheit),
        ]
    }

    @Test func identifiersRoundTrip() {
        for (identifier, unit) in Self.expected {
            #expect(unit.unitIdentifier == identifier)
            #expect(UnitTemperature.unit(forIdentifier: identifier) == unit)
        }
    }

    @Test func identifiersMatchGrammar() {
        for (identifier, _) in Self.expected {
            #expect(identifier.wholeMatch(of: /[a-z0-9-]+/) != nil)
        }
    }

    @Test func unknownIdentifierReturnsNil() {
        #expect(UnitTemperature.unit(forIdentifier: "no-such-unit") == nil)
        #expect(UnitTemperature(symbol: "??", converter: UnitConverterLinear(coefficient: 1)).unitIdentifier == nil)
    }
}
