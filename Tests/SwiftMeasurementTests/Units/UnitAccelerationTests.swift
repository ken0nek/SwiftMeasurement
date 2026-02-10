import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Acceleration")
struct UnitAccelerationTests {

    @Test("All Acceleration unit properties are properly mapped")
    func allProperties() {
        let value = 1

        #expect(value.metersPerSecondSquared == Measurement<UnitAcceleration>(value: value, unit: .metersPerSecondSquared))
        #expect(value.gravity                == Measurement<UnitAcceleration>(value: value, unit: .gravity))
    }

    @Test("Double values produce correct measurements")
    func doubleValues() {
        let value: Double = 3.14
        #expect(value.metersPerSecondSquared == Measurement<UnitAcceleration>(value: value, unit: .metersPerSecondSquared))
        #expect(value.gravity == Measurement<UnitAcceleration>(value: value, unit: .gravity))
    }

    @Test("Float values produce correct measurements")
    func floatValues() {
        let value: Float = 2.5
        #expect(value.metersPerSecondSquared == Measurement<UnitAcceleration>(value: value, unit: .metersPerSecondSquared))
        #expect(value.gravity == Measurement<UnitAcceleration>(value: value, unit: .gravity))
    }

    @Test("Zero and negative values")
    func edgeCases() {
        #expect(0.metersPerSecondSquared == Measurement<UnitAcceleration>(value: 0, unit: .metersPerSecondSquared))
        #expect((-5.0).metersPerSecondSquared == Measurement<UnitAcceleration>(value: -5.0, unit: .metersPerSecondSquared))
    }
}
