import Foundation
import Testing
@testable import SwiftMeasurement

@Test("All acceleration units properties are properly mapped")
func testAccelerationUnits() {
    let value = 1

    #expect(value.metersPerSecondSquared == Measurement<UnitAcceleration>(value: value, unit: .metersPerSecondSquared))
    #expect(value.gravity                == Measurement<UnitAcceleration>(value: value, unit: .gravity))
}
