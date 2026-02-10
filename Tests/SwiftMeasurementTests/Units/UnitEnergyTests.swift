import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Energy")
struct UnitEnergyTests {

    @Test("All Energy unit properties are properly mapped")
    func allProperties() {
        let value = 1

        #expect(value.kilojoules    == Measurement<UnitEnergy>(value: value, unit: .kilojoules))
        #expect(value.joules        == Measurement<UnitEnergy>(value: value, unit: .joules))
        #expect(value.kilocalories  == Measurement<UnitEnergy>(value: value, unit: .kilocalories))
        #expect(value.calories      == Measurement<UnitEnergy>(value: value, unit: .calories))
        #expect(value.kilowattHours == Measurement<UnitEnergy>(value: value, unit: .kilowattHours))
    }

    @Test("Double values produce correct measurements")
    func doubleValues() {
        let value: Double = 3.14
        #expect(value.joules == Measurement<UnitEnergy>(value: value, unit: .joules))
        #expect(value.kilocalories == Measurement<UnitEnergy>(value: value, unit: .kilocalories))
    }

    @Test("Float values produce correct measurements")
    func floatValues() {
        let value: Float = 2.5
        #expect(value.joules == Measurement<UnitEnergy>(value: value, unit: .joules))
        #expect(value.kilocalories == Measurement<UnitEnergy>(value: value, unit: .kilocalories))
    }

    @Test("Zero and negative values")
    func edgeCases() {
        #expect(0.joules == Measurement<UnitEnergy>(value: 0, unit: .joules))
        #expect((-5.0).joules == Measurement<UnitEnergy>(value: -5.0, unit: .joules))
    }
}
