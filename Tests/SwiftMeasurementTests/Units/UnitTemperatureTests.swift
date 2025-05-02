import Foundation
import Testing
@testable import SwiftMeasurement

@Test func testUnitTemperature() {
    let value = 1

    #expect(value.kelvin     == Measurement<UnitTemperature>(value: value, unit: .kelvin))
    #expect(value.celsius    == Measurement<UnitTemperature>(value: value, unit: .celsius))
    #expect(value.fahrenheit == Measurement<UnitTemperature>(value: value, unit: .fahrenheit))
}
