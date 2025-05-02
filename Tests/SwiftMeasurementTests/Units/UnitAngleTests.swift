import Foundation
import Testing
@testable import SwiftMeasurement

@Test func testUnitAngle() {
    let value = 1

    #expect(value.degrees == Measurement<UnitAngle>(value: value, unit: .degrees))
    #expect(value.arcMinutes == Measurement<UnitAngle>(value: value, unit: .arcMinutes))
    #expect(value.arcSeconds == Measurement<UnitAngle>(value: value, unit: .arcSeconds))
    #expect(value.radians == Measurement<UnitAngle>(value: value, unit: .radians))
    #expect(value.gradians == Measurement<UnitAngle>(value: value, unit: .gradians))
    #expect(value.revolutions == Measurement<UnitAngle>(value: value, unit: .revolutions))
}
