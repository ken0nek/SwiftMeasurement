import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("UnitPressure identifiers")
struct UnitPressureIdentifierTests {
    static var expected: [(identifier: String, unit: UnitPressure)] {
        [
            ("pascal", .newtonsPerMetersSquared),
            ("megapascal", .megapascals),
            ("kilopascal", .kilopascals),
            ("hectopascal", .hectopascals),
            ("inch-ofhg", .inchesOfMercury),
            ("bar", .bars),
            ("millibar", .millibars),
            ("millimeter-ofhg", .millimetersOfMercury),
            ("pound-force-per-square-inch", .poundsForcePerSquareInch),
        ]
    }

    @Test func identifiersRoundTrip() {
        for (identifier, unit) in Self.expected {
            #expect(unit.unitIdentifier == identifier)
            #expect(UnitPressure.unit(forIdentifier: identifier) == unit)
        }
    }

    @Test func identifiersMatchGrammar() {
        for (identifier, _) in Self.expected {
            #expect(identifier.wholeMatch(of: /[a-z0-9-]+/) != nil)
        }
    }

    @Test func unknownIdentifierReturnsNil() {
        #expect(UnitPressure.unit(forIdentifier: "no-such-unit") == nil)
        #expect(UnitPressure(symbol: "??").unitIdentifier == nil)
    }
}
