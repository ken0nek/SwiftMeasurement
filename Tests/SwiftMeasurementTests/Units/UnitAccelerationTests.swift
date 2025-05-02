import Foundation
import Testing
@testable import SwiftMeasurement

@Test func testUnitAcceleration() {
    let value = 1

    #expect(value.metersPerSecondSquared == Measurement<UnitAcceleration>(value: value, unit: .metersPerSecondSquared))
    #expect(value.gravity == Measurement<UnitAcceleration>(value: value, unit: .gravity))
}
