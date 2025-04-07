import Foundation
import Testing
@testable import SwiftMeasurement

// Basic usage tests
@Test func testBasicMeasurementConversions() async throws {
    let a: Double = 3
    let b: Double = 4

    #expect(a.kilometers == Measurement<UnitLength>(value: a, unit: .kilometers))
    #expect(b.seconds == Measurement<UnitDuration>(value: b, unit: .seconds))
}

// Addition tests
@Test func testMeasurementAddition() async throws {
    let a: Double = 3
    let b: Double = 4
    let c: Double = 7

    #expect(c.grams == a.grams + b.grams)
}

// Subtraction tests
@Test func testMeasurementSubtraction() async throws {
    let a: Double = 3
    let b: Double = 4
    let c: Double = 7

    #expect(a.acres == c.acres - b.acres)
}

// Multiplication tests
@Test func testMeasurementMultiplication() async throws {
    let c: Double = 7

    #expect(c.liters * 8 == Measurement(value: 56, unit: UnitVolume.liters))
}

// Division tests
@Test func testMeasurementDivision() async throws {
    let c: Double = 7

    #expect(c.metersPerSecond / 7 == Measurement(value: 1, unit: UnitSpeed.metersPerSecond))
}
