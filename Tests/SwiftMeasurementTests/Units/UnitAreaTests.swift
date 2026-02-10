import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Area")
struct UnitAreaTests {

    @Test("All Area unit properties are properly mapped")
    func allProperties() {
        let value = 1

        #expect(value.squareMegameters  == Measurement<UnitArea>(value: value, unit: .squareMegameters))
        #expect(value.squareKilometers  == Measurement<UnitArea>(value: value, unit: .squareKilometers))
        #expect(value.squareMeters      == Measurement<UnitArea>(value: value, unit: .squareMeters))
        #expect(value.squareCentimeters == Measurement<UnitArea>(value: value, unit: .squareCentimeters))
        #expect(value.squareMillimeters == Measurement<UnitArea>(value: value, unit: .squareMillimeters))
        #expect(value.squareMicrometers == Measurement<UnitArea>(value: value, unit: .squareMicrometers))
        #expect(value.squareNanometers  == Measurement<UnitArea>(value: value, unit: .squareNanometers))
        #expect(value.squareInches      == Measurement<UnitArea>(value: value, unit: .squareInches))
        #expect(value.squareFeet        == Measurement<UnitArea>(value: value, unit: .squareFeet))
        #expect(value.squareYards       == Measurement<UnitArea>(value: value, unit: .squareYards))
        #expect(value.squareMiles       == Measurement<UnitArea>(value: value, unit: .squareMiles))
        #expect(value.acres             == Measurement<UnitArea>(value: value, unit: .acres))
        #expect(value.ares              == Measurement<UnitArea>(value: value, unit: .ares))
        #expect(value.hectares          == Measurement<UnitArea>(value: value, unit: .hectares))
    }

    @Test("Double values produce correct measurements")
    func doubleValues() {
        let value: Double = 3.14
        #expect(value.squareMeters == Measurement<UnitArea>(value: value, unit: .squareMeters))
        #expect(value.squareKilometers == Measurement<UnitArea>(value: value, unit: .squareKilometers))
    }

    @Test("Float values produce correct measurements")
    func floatValues() {
        let value: Float = 2.5
        #expect(value.squareMeters == Measurement<UnitArea>(value: value, unit: .squareMeters))
        #expect(value.squareKilometers == Measurement<UnitArea>(value: value, unit: .squareKilometers))
    }

    @Test("Zero and negative values")
    func edgeCases() {
        #expect(0.squareMeters == Measurement<UnitArea>(value: 0, unit: .squareMeters))
        #expect((-5.0).squareMeters == Measurement<UnitArea>(value: -5.0, unit: .squareMeters))
    }
}
