import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("UnitIlluminance identifiers")
struct UnitIlluminanceIdentifierTests {
    static var expected: [(identifier: String, unit: UnitIlluminance)] {
        [
            ("lux", .lux),
        ]
    }

    @Test func identifiersRoundTrip() {
        for (identifier, unit) in Self.expected {
            #expect(unit.unitIdentifier == identifier)
            #expect(UnitIlluminance.unit(forIdentifier: identifier) == unit)
        }
    }

    @Test func identifiersMatchGrammar() {
        for (identifier, _) in Self.expected {
            #expect(identifier.wholeMatch(of: /[a-z0-9-]+/) != nil)
        }
    }

    @Test func unknownIdentifierReturnsNil() {
        #expect(UnitIlluminance.unit(forIdentifier: "no-such-unit") == nil)
        #expect(UnitIlluminance(symbol: "??", converter: UnitConverterLinear(coefficient: 1)).unitIdentifier == nil)
    }
}
