import Foundation
import Testing
@testable import SwiftMeasurement

@Test func testUnitFuelEfficiency() {
    let value = 1

    #expect(value.litersPer100Kilometers == Measurement<UnitFuelEfficiency>(value: value, unit: .litersPer100Kilometers))
    #expect(value.milesPerImperialGallon == Measurement<UnitFuelEfficiency>(value: value, unit: .milesPerImperialGallon))
    #expect(value.milesPerGallon == Measurement<UnitFuelEfficiency>(value: value, unit: .milesPerGallon))
}
