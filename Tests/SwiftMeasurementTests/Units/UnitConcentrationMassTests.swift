import Foundation
import Testing
@testable import SwiftMeasurement

@Test func testUnitConcentrationMass() {
    let value = 1

    #expect(value.gramsPerLiter          == Measurement<UnitConcentrationMass>(value: value, unit: .gramsPerLiter))
    #expect(value.milligramsPerDeciliter == Measurement<UnitConcentrationMass>(value: value, unit: .milligramsPerDeciliter))
}
