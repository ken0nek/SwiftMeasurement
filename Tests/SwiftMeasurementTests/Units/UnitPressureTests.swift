import Foundation
import Testing
@testable import SwiftMeasurement

@Test func testUnitPressure() {
    let value = 1.0

    #expect(value.newtonsPerMetersSquared == Measurement<UnitPressure>(value: value, unit: .newtonsPerMetersSquared))
    #expect(value.gigapascals == Measurement<UnitPressure>(value: value, unit: .gigapascals))
    #expect(value.megapascals == Measurement<UnitPressure>(value: value, unit: .megapascals))
    #expect(value.kilopascals == Measurement<UnitPressure>(value: value, unit: .kilopascals))
    #expect(value.hectopascals == Measurement<UnitPressure>(value: value, unit: .hectopascals))
    #expect(value.inchesOfMercury == Measurement<UnitPressure>(value: value, unit: .inchesOfMercury))
    #expect(value.bars == Measurement<UnitPressure>(value: value, unit: .bars))
    #expect(value.millibars == Measurement<UnitPressure>(value: value, unit: .millibars))
    #expect(value.millimetersOfMercury == Measurement<UnitPressure>(value: value, unit: .millimetersOfMercury))
    #expect(value.poundsForcePerSquareInch == Measurement<UnitPressure>(value: value, unit: .poundsForcePerSquareInch))
}
