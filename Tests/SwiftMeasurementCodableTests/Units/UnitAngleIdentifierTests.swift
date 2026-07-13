import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("UnitAngle identifiers")
struct UnitAngleIdentifierTests {
    static var expected: [(identifier: String, unit: UnitAngle)] {
        [
            ("degree", .degrees),
            ("arc-minute", .arcMinutes),
            ("arc-second", .arcSeconds),
            ("radian", .radians),
            ("revolution", .revolutions),
        ]
    }

    @Test func identifiersRoundTrip() {
        for (identifier, unit) in Self.expected {
            #expect(unit.unitIdentifier == identifier)
            #expect(UnitAngle.unit(forIdentifier: identifier) == unit)
        }
    }

    @Test func identifiersMatchGrammar() {
        for (identifier, _) in Self.expected {
            #expect(identifier.wholeMatch(of: /[a-z0-9-]+/) != nil)
        }
    }

    @Test func unknownIdentifierReturnsNil() {
        #expect(UnitAngle.unit(forIdentifier: "no-such-unit") == nil)
        #expect(UnitAngle(symbol: "??", converter: UnitConverterLinear(coefficient: 1)).unitIdentifier == nil)
    }
}
