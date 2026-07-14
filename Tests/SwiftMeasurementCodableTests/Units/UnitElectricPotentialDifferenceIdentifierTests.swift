import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("UnitElectricPotentialDifference identifiers")
struct UnitElectricPotentialDifferenceIdentifierTests {
    static var expected: [(identifier: String, unit: UnitElectricPotentialDifference)] {
        [
            ("volt", .volts),
        ]
    }

    @Test func identifiersRoundTrip() {
        for (identifier, unit) in Self.expected {
            #expect(unit.unitIdentifier == identifier)
            #expect(UnitElectricPotentialDifference.unit(forIdentifier: identifier) == unit)
        }
    }

    @Test func identifiersMatchGrammar() {
        for (identifier, _) in Self.expected {
            #expect(identifier.wholeMatch(of: /[a-z0-9-]+/) != nil)
        }
    }

    @Test func unknownIdentifierReturnsNil() {
        #expect(UnitElectricPotentialDifference.unit(forIdentifier: "no-such-unit") == nil)
        #expect(UnitElectricPotentialDifference(symbol: "??", converter: UnitConverterLinear(coefficient: 1)).unitIdentifier == nil)
    }
}
