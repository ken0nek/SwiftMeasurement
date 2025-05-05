import Foundation
import Testing
@testable import SwiftMeasurement

@Test("All illuminance units properties are properly mapped")
func testIlluminanceUnits() {
    let value = 1

    #expect(value.lux == Measurement<UnitIlluminance>(value: value, unit: .lux))
}
