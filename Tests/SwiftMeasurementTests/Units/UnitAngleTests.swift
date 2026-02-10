import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Angle")
struct UnitAngleTests {

    @Test("All Angle unit properties are properly mapped")
    func allProperties() {
        let value = 1

        #expect(value.degrees     == Measurement<UnitAngle>(value: value, unit: .degrees))
        #expect(value.arcMinutes  == Measurement<UnitAngle>(value: value, unit: .arcMinutes))
        #expect(value.arcSeconds  == Measurement<UnitAngle>(value: value, unit: .arcSeconds))
        #expect(value.radians     == Measurement<UnitAngle>(value: value, unit: .radians))
        #expect(value.gradians    == Measurement<UnitAngle>(value: value, unit: .gradians))
        #expect(value.revolutions == Measurement<UnitAngle>(value: value, unit: .revolutions))
    }

    @Test("Double values produce correct measurements")
    func doubleValues() {
        let value: Double = 3.14
        #expect(value.degrees == Measurement<UnitAngle>(value: value, unit: .degrees))
        #expect(value.radians == Measurement<UnitAngle>(value: value, unit: .radians))
    }

    @Test("Float values produce correct measurements")
    func floatValues() {
        let value: Float = 2.5
        #expect(value.degrees == Measurement<UnitAngle>(value: value, unit: .degrees))
        #expect(value.radians == Measurement<UnitAngle>(value: value, unit: .radians))
    }

    @Test("Zero and negative values")
    func edgeCases() {
        #expect(0.degrees == Measurement<UnitAngle>(value: 0, unit: .degrees))
        #expect((-5.0).degrees == Measurement<UnitAngle>(value: -5.0, unit: .degrees))
    }
}
