import Foundation
import Testing
@testable import SwiftMeasurement

// MARK: - Basic Conversion Tests

@Suite("Double Measurement Conversion Tests")
struct DoubleMeasurementTests {
    
    @Test("Basic measurement conversions with Double")
    func testBasicConversions() async throws {
        let a: Double = 3
        let b: Double = 4
        
        #expect(a.kilometers == Measurement<UnitLength>(value: a, unit: .kilometers))
        #expect(b.seconds == Measurement<UnitDuration>(value: b, unit: .seconds))
    }
    
    @Test("Addition with Double")
    func testAddition() async throws {
        let a: Double = 3
        let b: Double = 4
        let c: Double = 7
        
        #expect(c.grams == a.grams + b.grams)
    }
    
    @Test("Subtraction with Double")
    func testSubtraction() async throws {
        let a: Double = 3
        let b: Double = 4
        let c: Double = 7
        
        #expect(a.acres == c.acres - b.acres)
    }
    
    @Test("Multiplication with Double")
    func testMultiplication() async throws {
        let c: Double = 7
        
        #expect(c.liters * 8 == Measurement(value: 56, unit: UnitVolume.liters))
    }
    
    @Test("Division with Double")
    func testDivision() async throws {
        let c: Double = 7
        
        #expect(c.metersPerSecond / 7 == Measurement(value: 1, unit: UnitSpeed.metersPerSecond))
    }
}

@Suite("Float Measurement Conversion Tests")
struct FloatMeasurementTests {
    
    @Test("Basic measurement conversions with Float")
    func testBasicConversions() async throws {
        let a: Float = 3
        let b: Float = 4
        
        #expect(a.kilometers == Measurement<UnitLength>(value: a, unit: .kilometers))
        #expect(b.seconds == Measurement<UnitDuration>(value: b, unit: .seconds))
    }
    
    @Test("Addition with Float")
    func testAddition() async throws {
        let a: Float = 3
        let b: Float = 4
        let c: Float = 7
        
        #expect(c.grams == a.grams + b.grams)
    }
    
    @Test("Subtraction with Float")
    func testSubtraction() async throws {
        let a: Float = 3
        let b: Float = 4
        let c: Float = 7
        
        #expect(a.acres == c.acres - b.acres)
    }
    
    @Test("Multiplication with Float")
    func testMultiplication() async throws {
        let c: Float = 7
        
        #expect(c.liters * 8 == Measurement(value: 56, unit: UnitVolume.liters))
    }
    
    @Test("Division with Float")
    func testDivision() async throws {
        let c: Float = 7
        
        #expect(c.metersPerSecond / 7 == Measurement(value: 1, unit: UnitSpeed.metersPerSecond))
    }
}

@Suite("Int Measurement Conversion Tests")
struct IntMeasurementTests {
    
    @Test("Basic measurement conversions with Int")
    func testBasicConversions() async throws {
        let a: Int = 3
        let b: Int = 4
        
        #expect(a.kilometers == Measurement<UnitLength>(value: a, unit: .kilometers))
        #expect(b.seconds == Measurement<UnitDuration>(value: b, unit: .seconds))
    }
    
    @Test("Addition with Int")
    func testAddition() async throws {
        let a: Int = 3
        let b: Int = 4
        let c: Int = 7
        
        #expect(c.grams == a.grams + b.grams)
    }
    
    @Test("Subtraction with Int")
    func testSubtraction() async throws {
        let a: Int = 3
        let b: Int = 4
        let c: Int = 7
        
        #expect(a.acres == c.acres - b.acres)
    }
    
    @Test("Multiplication with Int")
    func testMultiplication() async throws {
        let c: Int = 7
        
        #expect(c.liters * 8 == Measurement(value: 56, unit: UnitVolume.liters))
    }
    
    @Test("Division with Int")
    func testDivision() async throws {
        let c: Int = 7
        
        #expect(c.metersPerSecond / 7 == Measurement(value: 1, unit: UnitSpeed.metersPerSecond))
    }
}

// MARK: - Advanced Tests

@Suite("Mixed Type Operations")
struct MixedTypeMeasurementTests {
    
    @Test("Mixed type arithmetic operations")
    func testMixedTypeArithmetic() async throws {
        let a: Double = 3
        let b: Float = 4
        let c: Int = 7
        
        // Addition across types
        #expect(a.meters + b.meters == Measurement(value: 7, unit: UnitLength.meters))
        #expect(b.liters + c.liters == Measurement(value: 11, unit: UnitVolume.liters))
        #expect(c.seconds + a.seconds == Measurement(value: 10, unit: UnitDuration.seconds))
    }
    
    @Test("Temperature conversion across types")
    func testTemperatureConversion() async throws {
        let doubleTemp = 32.0.fahrenheit
        let floatTemp: Float = 0
        let intTemp: Int = 0
        
        // Use a small epsilon for floating-point comparisons
        let epsilon = 0.0001
        
        #expect(abs(doubleTemp.value - floatTemp.celsius.converted(to: .fahrenheit).value) < epsilon)
        #expect(abs(doubleTemp.value - intTemp.celsius.converted(to: .fahrenheit).value) < epsilon)
    }
}

@Suite("Type Inference Tests")
struct TypeInferenceTests {
    
    @Test("Type inference for measurement creation")
    func testMeasurementTypeInference() async throws {
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
}
