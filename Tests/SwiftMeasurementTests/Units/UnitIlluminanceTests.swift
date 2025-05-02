import Foundation
import Testing
@testable import SwiftMeasurement

@Test func testUnitIlluminance() {
    let value = 1

    #expect(value.lux == Measurement<UnitIlluminance>(value: value, unit: .lux))
}
