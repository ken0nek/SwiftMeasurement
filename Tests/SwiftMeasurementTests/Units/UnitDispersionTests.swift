import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Dispersion")
struct UnitDispersionTests {

    @Test("All Dispersion unit properties are properly mapped")
    func allProperties() {
        let value = 1

        #expect(value.partsPerMillion == Measurement<UnitDispersion>(value: value, unit: .partsPerMillion))
    }

    @Test("Double values produce correct measurements")
    func doubleValues() {
        let value: Double = 3.14
        #expect(value.partsPerMillion == Measurement<UnitDispersion>(value: value, unit: .partsPerMillion))
    }

    @Test("Float values produce correct measurements")
    func floatValues() {
        let value: Float = 2.5
        #expect(value.partsPerMillion == Measurement<UnitDispersion>(value: value, unit: .partsPerMillion))
    }

    @Test("Zero and negative values")
    func edgeCases() {
        #expect(0.partsPerMillion == Measurement<UnitDispersion>(value: 0, unit: .partsPerMillion))
        #expect((-5.0).partsPerMillion == Measurement<UnitDispersion>(value: -5.0, unit: .partsPerMillion))
    }
}
