import Foundation
import Testing
@testable import SwiftMeasurement

@Test("All dispersion units properties are properly mapped")
func testDispersionUnits() {
    let value = 1

    #expect(value.partsPerMillion == Measurement<UnitDispersion>(value: value, unit: .partsPerMillion))
}
