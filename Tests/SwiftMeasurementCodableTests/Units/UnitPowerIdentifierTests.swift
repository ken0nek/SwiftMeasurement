import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("UnitPower identifiers")
struct UnitPowerIdentifierTests {
    static var expected: [(identifier: String, unit: UnitPower)] {
        [
            ("gigawatt", .gigawatts),
            ("megawatt", .megawatts),
            ("kilowatt", .kilowatts),
            ("watt", .watts),
            ("milliwatt", .milliwatts),
            ("horsepower", .horsepower),
        ]
    }

    @Test func identifiersRoundTrip() {
        for (identifier, unit) in Self.expected {
            #expect(unit.unitIdentifier == identifier)
            #expect(UnitPower.unit(forIdentifier: identifier) == unit)
        }
    }

    @Test func identifiersMatchGrammar() {
        for (identifier, _) in Self.expected {
            #expect(identifier.wholeMatch(of: /[a-z0-9-]+/) != nil)
        }
    }

    @Test func unknownIdentifierReturnsNil() {
        #expect(UnitPower.unit(forIdentifier: "no-such-unit") == nil)
        #expect(UnitPower(symbol: "??").unitIdentifier == nil)
    }
}
