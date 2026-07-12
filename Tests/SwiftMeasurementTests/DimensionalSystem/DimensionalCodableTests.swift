import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Dimensional Codable")
struct DimensionalCodableTests {

    @Suite("DimensionalExponents")
    struct DimensionalExponentsCodableTests {

        @Test("Round-trips through JSON")
        func roundTrip() throws {
            let original = DimensionalExponents(
                length: 2,
                time: -3,
                mass: 1,
                current: -2,
                temperature: 0,
                amount: 0,
                luminosity: 0
            )

            let data = try JSONEncoder().encode(original)
            let decoded = try JSONDecoder().decode(DimensionalExponents.self, from: data)

            #expect(decoded == original)
        }

        @Test("Encodes each stored property")
        func encodesAllKeys() throws {
            let exponents = DimensionalExponents(
                length: 1,
                time: 2,
                mass: 3,
                current: 4,
                temperature: 5,
                amount: 6,
                luminosity: 7
            )

            let data = try JSONEncoder().encode(exponents)
            let json = try #require(
                try JSONSerialization.jsonObject(with: data) as? [String: Any]
            )

            #expect(json["length"] as? Int == 1)
            #expect(json["time"] as? Int == 2)
            #expect(json["mass"] as? Int == 3)
            #expect(json["current"] as? Int == 4)
            #expect(json["temperature"] as? Int == 5)
            #expect(json["amount"] as? Int == 6)
            #expect(json["luminosity"] as? Int == 7)
        }

        @Test("Decodes from an explicit JSON payload")
        func decodesFromJSON() throws {
            let payload = """
            {
                "length": -1,
                "time": -2,
                "mass": 1,
                "current": 0,
                "temperature": 0,
                "amount": 0,
                "luminosity": 0
            }
            """.data(using: .utf8)!

            let decoded = try JSONDecoder().decode(DimensionalExponents.self, from: payload)

            #expect(decoded == DimensionalExponents.pressure)
        }
    }

    @Suite("DimensionalMeasurement")
    struct DimensionalMeasurementCodableTests {

        @Test("Round-trips through JSON")
        func roundTrip() throws {
            let original = DimensionalMeasurement(
                value: 120.0,
                dimensions: DimensionalExponents(length: 1)
            )

            let data = try JSONEncoder().encode(original)
            let decoded = try JSONDecoder().decode(DimensionalMeasurement.self, from: data)

            #expect(decoded == original)
            #expect(decoded.value == 120.0)
            #expect(decoded.dimensions == DimensionalExponents(length: 1))
        }

        @Test("Round-trips a value derived from Foundation measurements")
        func roundTripDerivedValue() throws {
            let speed = Measurement(value: 60.0, unit: UnitSpeed.kilometersPerHour)
            let time = Measurement(value: 2.0, unit: UnitDuration.hours)
            let distance = speed * time

            let data = try JSONEncoder().encode(distance)
            let decoded = try JSONDecoder().decode(DimensionalMeasurement.self, from: data)

            #expect(decoded == distance)
            #expect(decoded.asLength?.converted(to: .kilometers).value == distance.asLength?.converted(to: .kilometers).value)
        }

        @Test("Encodes the expected top-level keys")
        func encodesExpectedKeys() throws {
            let measurement = DimensionalMeasurement(
                value: 42.0,
                dimensions: DimensionalExponents(mass: 1)
            )

            let data = try JSONEncoder().encode(measurement)
            let json = try #require(
                try JSONSerialization.jsonObject(with: data) as? [String: Any]
            )

            #expect(json["value"] as? Double == 42.0)
            #expect(json["dimensions"] is [String: Any])
        }
    }
}
