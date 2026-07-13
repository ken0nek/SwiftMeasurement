import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("UnitVolume identifiers")
struct UnitVolumeIdentifierTests {
    static var expected: [(identifier: String, unit: UnitVolume)] {
        [
            ("megaliter", .megaliters),
            ("liter", .liters),
            ("deciliter", .deciliters),
            ("centiliter", .centiliters),
            ("milliliter", .milliliters),
            ("cubic-kilometer", .cubicKilometers),
            ("cubic-meter", .cubicMeters),
            ("cubic-centimeter", .cubicCentimeters),
            ("cubic-inch", .cubicInches),
            ("cubic-foot", .cubicFeet),
            ("cubic-yard", .cubicYards),
            ("cubic-mile", .cubicMiles),
            ("acre-foot", .acreFeet),
            ("bushel", .bushels),
            ("teaspoon", .teaspoons),
            ("tablespoon", .tablespoons),
            ("fluid-ounce", .fluidOunces),
            ("pint", .pints),
            ("quart", .quarts),
            ("gallon", .gallons),
            ("fluid-ounce-imperial", .imperialFluidOunces),
            ("pint-imperial", .imperialPints),
            ("quart-imperial", .imperialQuarts),
            ("gallon-imperial", .imperialGallons),
            ("cup-metric", .metricCups),
        ]
    }

    @Test func identifiersRoundTrip() {
        for (identifier, unit) in Self.expected {
            #expect(unit.unitIdentifier == identifier)
            #expect(UnitVolume.unit(forIdentifier: identifier) == unit)
        }
    }

    @Test func identifiersMatchGrammar() {
        for (identifier, _) in Self.expected {
            #expect(identifier.wholeMatch(of: /[a-z0-9-]+/) != nil)
        }
    }

    @Test func unknownIdentifierReturnsNil() {
        #expect(UnitVolume.unit(forIdentifier: "no-such-unit") == nil)
        #expect(UnitVolume(symbol: "??", converter: UnitConverterLinear(coefficient: 1)).unitIdentifier == nil)
    }
}
