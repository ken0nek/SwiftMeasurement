import Foundation
import Testing
@testable import SwiftMeasurement

// MARK: - Double Tests

// Basic usage tests with Double
@Test func testBasicMeasurementConversionsDouble() async throws {
    let a: Double = 3
    let b: Double = 4

    #expect(a.kilometers == Measurement<UnitLength>(value: a, unit: .kilometers))
    #expect(b.seconds == Measurement<UnitDuration>(value: b, unit: .seconds))
}

// Addition tests with Double
@Test func testMeasurementAdditionDouble() async throws {
    let a: Double = 3
    let b: Double = 4
    let c: Double = 7

    #expect(c.grams == a.grams + b.grams)
}

// Subtraction tests with Double
@Test func testMeasurementSubtractionDouble() async throws {
    let a: Double = 3
    let b: Double = 4
    let c: Double = 7

    #expect(a.acres == c.acres - b.acres)
}

// Multiplication tests with Double
@Test func testMeasurementMultiplicationDouble() async throws {
    let c: Double = 7

    #expect(c.liters * 8 == Measurement(value: 56, unit: UnitVolume.liters))
}

// Division tests with Double
@Test func testMeasurementDivisionDouble() async throws {
    let c: Double = 7

    #expect(c.metersPerSecond / 7 == Measurement(value: 1, unit: UnitSpeed.metersPerSecond))
}

// MARK: - Float Tests

// Basic usage tests with Float
@Test func testBasicMeasurementConversionsFloat() async throws {
    let a: Float = 3
    let b: Float = 4

    #expect(a.kilometers == Measurement<UnitLength>(value: Double(a), unit: .kilometers))
    #expect(b.seconds == Measurement<UnitDuration>(value: Double(b), unit: .seconds))
}

// Addition tests with Float
@Test func testMeasurementAdditionFloat() async throws {
    let a: Float = 3
    let b: Float = 4
    let c: Float = 7

    #expect(c.grams == a.grams + b.grams)
}

// Subtraction tests with Float
@Test func testMeasurementSubtractionFloat() async throws {
    let a: Float = 3
    let b: Float = 4
    let c: Float = 7

    #expect(a.acres == c.acres - b.acres)
}

// Multiplication tests with Float
@Test func testMeasurementMultiplicationFloat() async throws {
    let c: Float = 7

    #expect(c.liters * 8 == Measurement(value: 56, unit: UnitVolume.liters))
}

// Division tests with Float
@Test func testMeasurementDivisionFloat() async throws {
    let c: Float = 7

    #expect(c.metersPerSecond / 7 == Measurement(value: 1, unit: UnitSpeed.metersPerSecond))
}

// MARK: - Int Tests

// Basic usage tests with Int
@Test func testBasicMeasurementConversionsInt() async throws {
    let a: Int = 3
    let b: Int = 4

    #expect(a.kilometers == Measurement<UnitLength>(value: Double(a), unit: .kilometers))
    #expect(b.seconds == Measurement<UnitDuration>(value: Double(b), unit: .seconds))
}

// Addition tests with Int
@Test func testMeasurementAdditionInt() async throws {
    let a: Int = 3
    let b: Int = 4
    let c: Int = 7

    #expect(c.grams == a.grams + b.grams)
}

// Subtraction tests with Int
@Test func testMeasurementSubtractionInt() async throws {
    let a: Int = 3
    let b: Int = 4
    let c: Int = 7

    #expect(a.acres == c.acres - b.acres)
}

// Multiplication tests with Int
@Test func testMeasurementMultiplicationInt() async throws {
    let c: Int = 7

    #expect(c.liters * 8 == Measurement(value: 56, unit: UnitVolume.liters))
}

// Division tests with Int
@Test func testMeasurementDivisionInt() async throws {
    let c: Int = 7

    #expect(c.metersPerSecond / 7 == Measurement(value: 1, unit: UnitSpeed.metersPerSecond))
}

// MARK: - Mixed Type Tests

// Tests to verify mixed type operations work correctly
@Test func testMixedTypeOperations() async throws {
    let a: Double = 3
    let b: Float = 4
    let c: Int = 7

    // Addition across types
    #expect(a.meters + b.meters == Measurement(value: 7, unit: UnitLength.meters))
    #expect(b.liters + c.liters == Measurement(value: 11, unit: UnitVolume.liters))
    #expect(c.seconds + a.seconds == Measurement(value: 10, unit: UnitDuration.seconds))

    // Conversion between types
    let doubleTemp = 32.0.fahrenheit
    let floatTemp: Float = 0
    let intTemp: Int = 0

    // Use a small epsilon for floating-point comparisons
    let epsilon = 0.0001

    #expect(abs(doubleTemp.value - floatTemp.celsius.converted(to: .fahrenheit).value) < epsilon)
    #expect(abs(doubleTemp.value - intTemp.celsius.converted(to: .fahrenheit).value) < epsilon)
}

// MARK: - Type Inference Tests

// Tests to verify type inference works correctly with the MeasurementConvertible protocol
@Test func testTypeInference() async throws {
    // These should all compile and work without explicit type annotations
    let length1 = 10.meters
    let length2 = Float(5).kilometers
    let length3 = Int(2).miles

    let time1 = 60.seconds
    let time2 = Float(1.5).hours
    let time3 = Int(24).hours

    #expect(length1.unit == UnitLength.meters)
    #expect(length2.unit == UnitLength.kilometers)
    #expect(length3.unit == UnitLength.miles)

    #expect(time1.unit == UnitDuration.seconds)
    #expect(time2.unit == UnitDuration.hours)
    #expect(time3.unit == UnitDuration.hours)
}
