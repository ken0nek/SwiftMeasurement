import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Measurement Initializers Tests")
struct MeasurementInitializersTests {

    @Test("Initialize with Int value")
    func testIntInitializer() {
        let lengthFromInt = Measurement(value: 5, unit: UnitLength.meters)
        #expect(lengthFromInt.value == 5.0)
        #expect(lengthFromInt.unit == UnitLength.meters)

        let massFromInt = Measurement(value: 10, unit: UnitMass.kilograms)
        #expect(massFromInt.value == 10.0)
        #expect(massFromInt.unit == UnitMass.kilograms)
    }

    @Test("Initialize with Float value")
    func testFloatInitializer() {
        let lengthFromFloat = Measurement(value: Float(3.14), unit: UnitLength.centimeters)
        #expect(lengthFromFloat.value == 3.140000104904175)  // Float precision
        #expect(lengthFromFloat.unit == UnitLength.centimeters)

        let massFromFloat = Measurement(value: Float(2.5), unit: UnitMass.grams)
        #expect(massFromFloat.value == 2.5)
        #expect(massFromFloat.unit == UnitMass.grams)
    }

    @Test("Initialize with large Int values")
    func testLargeIntInitializer() {
        let bigNumber = 1_000_000
        let distance = Measurement(value: bigNumber, unit: UnitLength.kilometers)
        #expect(distance.value == 1_000_000.0)
        #expect(distance.unit == UnitLength.kilometers)
    }

    @Test("Initialize with negative values")
    func testNegativeValueInitializers() {
        let negativeInt = Measurement(value: -5, unit: UnitLength.meters)
        #expect(negativeInt.value == -5.0)

        let negativeFloat = Measurement(value: Float(-3.14), unit: UnitMass.grams)
        #expect(negativeFloat.value < 0)
        #expect(negativeFloat.value == Double(Float(-3.14)))
    }
}
