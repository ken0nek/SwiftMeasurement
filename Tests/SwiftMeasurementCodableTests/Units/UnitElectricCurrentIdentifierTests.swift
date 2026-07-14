import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("UnitElectricCurrent identifiers")
struct UnitElectricCurrentIdentifierTests {
    static var expected: [(identifier: String, unit: UnitElectricCurrent)] {
        [
            ("ampere", .amperes),
            ("milliampere", .milliamperes),
        ]
    }

    @Test func identifiersRoundTrip() {
        for (identifier, unit) in Self.expected {
            #expect(unit.unitIdentifier == identifier)
            #expect(UnitElectricCurrent.unit(forIdentifier: identifier) == unit)
        }
    }

    @Test func identifiersMatchGrammar() {
        for (identifier, _) in Self.expected {
            #expect(identifier.wholeMatch(of: /[a-z0-9-]+/) != nil)
        }
    }

    @Test func unknownIdentifierReturnsNil() {
        #expect(UnitElectricCurrent.unit(forIdentifier: "no-such-unit") == nil)
        #expect(UnitElectricCurrent(symbol: "??", converter: UnitConverterLinear(coefficient: 1)).unitIdentifier == nil)
    }
}
