import Foundation
import Testing
@testable import SwiftMeasurement

@Test func testUnitMass() {
    let value = 1

    #expect(value.kilograms == Measurement<UnitMass>(value: value, unit: .kilograms))
    #expect(value.grams == Measurement<UnitMass>(value: value, unit: .grams))
    #expect(value.decigrams == Measurement<UnitMass>(value: value, unit: .decigrams))
    #expect(value.centigrams == Measurement<UnitMass>(value: value, unit: .centigrams))
    #expect(value.milligrams == Measurement<UnitMass>(value: value, unit: .milligrams))
    #expect(value.micrograms == Measurement<UnitMass>(value: value, unit: .micrograms))
    #expect(value.nanograms == Measurement<UnitMass>(value: value, unit: .nanograms))
    #expect(value.picograms == Measurement<UnitMass>(value: value, unit: .picograms))
    #expect(value.ounces == Measurement<UnitMass>(value: value, unit: .ounces))
    #expect(value.pounds == Measurement<UnitMass>(value: value, unit: .pounds))
    #expect(value.stones == Measurement<UnitMass>(value: value, unit: .stones))
    #expect(value.metricTons == Measurement<UnitMass>(value: value, unit: .metricTons))
    #expect(value.shortTons == Measurement<UnitMass>(value: value, unit: .shortTons))
    #expect(value.carats == Measurement<UnitMass>(value: value, unit: .carats))
    #expect(value.ouncesTroy == Measurement<UnitMass>(value: value, unit: .ouncesTroy))
    #expect(value.slugs == Measurement<UnitMass>(value: value, unit: .slugs))
}
