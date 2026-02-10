import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Pressure")
struct UnitPressureTests {

    @Test("All Pressure unit properties are properly mapped")
    func allProperties() {
        let value = 1

        #expect(value.newtonsPerMetersSquared  == Measurement<UnitPressure>(value: value, unit: .newtonsPerMetersSquared))
        #expect(value.gigapascals              == Measurement<UnitPressure>(value: value, unit: .gigapascals))
        #expect(value.megapascals              == Measurement<UnitPressure>(value: value, unit: .megapascals))
        #expect(value.kilopascals              == Measurement<UnitPressure>(value: value, unit: .kilopascals))
        #expect(value.hectopascals             == Measurement<UnitPressure>(value: value, unit: .hectopascals))
        #expect(value.inchesOfMercury          == Measurement<UnitPressure>(value: value, unit: .inchesOfMercury))
        #expect(value.bars                     == Measurement<UnitPressure>(value: value, unit: .bars))
        #expect(value.millibars                == Measurement<UnitPressure>(value: value, unit: .millibars))
        #expect(value.millimetersOfMercury     == Measurement<UnitPressure>(value: value, unit: .millimetersOfMercury))
        #expect(value.poundsForcePerSquareInch == Measurement<UnitPressure>(value: value, unit: .poundsForcePerSquareInch))
    }

    @Test("Double values produce correct measurements")
    func doubleValues() {
        let value: Double = 3.14
        #expect(value.newtonsPerMetersSquared == Measurement<UnitPressure>(value: value, unit: .newtonsPerMetersSquared))
        #expect(value.bars == Measurement<UnitPressure>(value: value, unit: .bars))
    }

    @Test("Float values produce correct measurements")
    func floatValues() {
        let value: Float = 2.5
        #expect(value.newtonsPerMetersSquared == Measurement<UnitPressure>(value: value, unit: .newtonsPerMetersSquared))
        #expect(value.bars == Measurement<UnitPressure>(value: value, unit: .bars))
    }

    @Test("Zero and negative values")
    func edgeCases() {
        #expect(0.newtonsPerMetersSquared == Measurement<UnitPressure>(value: 0, unit: .newtonsPerMetersSquared))
        #expect((-5.0).newtonsPerMetersSquared == Measurement<UnitPressure>(value: -5.0, unit: .newtonsPerMetersSquared))
    }
}
