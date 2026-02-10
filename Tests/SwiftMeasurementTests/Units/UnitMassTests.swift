import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Mass")
struct UnitMassTests {

    @Test("All Mass unit properties are properly mapped")
    func allProperties() {
        let value = 1

        #expect(value.kilograms  == Measurement<UnitMass>(value: value, unit: .kilograms))
        #expect(value.grams      == Measurement<UnitMass>(value: value, unit: .grams))
        #expect(value.decigrams  == Measurement<UnitMass>(value: value, unit: .decigrams))
        #expect(value.centigrams == Measurement<UnitMass>(value: value, unit: .centigrams))
        #expect(value.milligrams == Measurement<UnitMass>(value: value, unit: .milligrams))
        #expect(value.micrograms == Measurement<UnitMass>(value: value, unit: .micrograms))
        #expect(value.nanograms  == Measurement<UnitMass>(value: value, unit: .nanograms))
        #expect(value.picograms  == Measurement<UnitMass>(value: value, unit: .picograms))
        #expect(value.ounces     == Measurement<UnitMass>(value: value, unit: .ounces))
        #expect(value.pounds     == Measurement<UnitMass>(value: value, unit: .pounds))
        #expect(value.stones     == Measurement<UnitMass>(value: value, unit: .stones))
        #expect(value.metricTons == Measurement<UnitMass>(value: value, unit: .metricTons))
        #expect(value.shortTons  == Measurement<UnitMass>(value: value, unit: .shortTons))
        #expect(value.carats     == Measurement<UnitMass>(value: value, unit: .carats))
        #expect(value.ouncesTroy == Measurement<UnitMass>(value: value, unit: .ouncesTroy))
        #expect(value.slugs      == Measurement<UnitMass>(value: value, unit: .slugs))
    }

    @Test("Double values produce correct measurements")
    func doubleValues() {
        let value: Double = 3.14
        #expect(value.kilograms == Measurement<UnitMass>(value: value, unit: .kilograms))
        #expect(value.grams == Measurement<UnitMass>(value: value, unit: .grams))
    }

    @Test("Float values produce correct measurements")
    func floatValues() {
        let value: Float = 2.5
        #expect(value.kilograms == Measurement<UnitMass>(value: value, unit: .kilograms))
        #expect(value.grams == Measurement<UnitMass>(value: value, unit: .grams))
    }

    @Test("Zero and negative values")
    func edgeCases() {
        #expect(0.kilograms == Measurement<UnitMass>(value: 0, unit: .kilograms))
        #expect((-5.0).kilograms == Measurement<UnitMass>(value: -5.0, unit: .kilograms))
    }
}
