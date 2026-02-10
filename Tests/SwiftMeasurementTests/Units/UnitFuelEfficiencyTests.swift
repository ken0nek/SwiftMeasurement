import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Fuel Efficiency")
struct UnitFuelEfficiencyTests {

    @Test("All Fuel Efficiency unit properties are properly mapped")
    func allProperties() {
        let value = 1

        #expect(value.litersPer100Kilometers == Measurement<UnitFuelEfficiency>(value: value, unit: .litersPer100Kilometers))
        #expect(value.milesPerImperialGallon == Measurement<UnitFuelEfficiency>(value: value, unit: .milesPerImperialGallon))
        #expect(value.milesPerGallon         == Measurement<UnitFuelEfficiency>(value: value, unit: .milesPerGallon))
    }

    @Test("Double values produce correct measurements")
    func doubleValues() {
        let value: Double = 3.14
        #expect(value.litersPer100Kilometers == Measurement<UnitFuelEfficiency>(value: value, unit: .litersPer100Kilometers))
        #expect(value.milesPerGallon == Measurement<UnitFuelEfficiency>(value: value, unit: .milesPerGallon))
    }

    @Test("Float values produce correct measurements")
    func floatValues() {
        let value: Float = 2.5
        #expect(value.litersPer100Kilometers == Measurement<UnitFuelEfficiency>(value: value, unit: .litersPer100Kilometers))
        #expect(value.milesPerGallon == Measurement<UnitFuelEfficiency>(value: value, unit: .milesPerGallon))
    }

    @Test("Zero and negative values")
    func edgeCases() {
        #expect(0.litersPer100Kilometers == Measurement<UnitFuelEfficiency>(value: 0, unit: .litersPer100Kilometers))
        #expect((-5.0).litersPer100Kilometers == Measurement<UnitFuelEfficiency>(value: -5.0, unit: .litersPer100Kilometers))
    }
}
