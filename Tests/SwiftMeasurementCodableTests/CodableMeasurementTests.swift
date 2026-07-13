import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("CodableMeasurement")
struct CodableMeasurementTests {
    private var sortedKeysEncoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys]
        return encoder
    }

    @Test func encodesExactWireBytes() throws {
        let wrapped = Measurement(value: 21.5, unit: UnitMass.grams).codable
        let data = try sortedKeysEncoder.encode(wrapped)
        #expect(String(decoding: data, as: UTF8.self) == #"{"unit":"gram","value":21.5}"#)
    }

    @Test func encodesCurrentUnitWithoutCanonicalizing() throws {
        let wrapped = Measurement(value: 1, unit: UnitMass.ounces).codable
        let data = try sortedKeysEncoder.encode(wrapped)
        #expect(String(decoding: data, as: UTF8.self) == #"{"unit":"ounce","value":1}"#)
    }

    @Test func decodesKnownIdentifier() throws {
        let json = Data(#"{"value":21.5,"unit":"gram"}"#.utf8)
        let wrapped = try JSONDecoder().decode(CodableMeasurement<UnitMass>.self, from: json)
        #expect(wrapped.measurement == Measurement(value: 21.5, unit: UnitMass.grams))
    }

    @Test func decodedUnitConverts() throws {
        let json = Data(#"{"value":1,"unit":"ounce"}"#.utf8)
        let wrapped = try JSONDecoder().decode(CodableMeasurement<UnitMass>.self, from: json)
        let grams = wrapped.measurement.converted(to: .grams).value
        #expect(abs(grams - 28.3495) < 0.001)
    }

    @Test func unknownIdentifierThrowsDecodingError() {
        let json = Data(#"{"value":1,"unit":"parsec"}"#.utf8)
        #expect(throws: DecodingError.self) {
            _ = try JSONDecoder().decode(CodableMeasurement<UnitMass>.self, from: json)
        }
    }

    @Test func missingUnitKeyThrows() {
        let json = Data(#"{"value":1}"#.utf8)
        #expect(throws: DecodingError.self) {
            _ = try JSONDecoder().decode(CodableMeasurement<UnitMass>.self, from: json)
        }
    }

    @Test func mistypedValueThrows() {
        let json = Data(#"{"value":"heavy","unit":"gram"}"#.utf8)
        #expect(throws: DecodingError.self) {
            _ = try JSONDecoder().decode(CodableMeasurement<UnitMass>.self, from: json)
        }
    }

    @Test func extraKeysAreIgnored() throws {
        let json = Data(#"{"value":2,"unit":"gram","note":"extra"}"#.utf8)
        let wrapped = try JSONDecoder().decode(CodableMeasurement<UnitMass>.self, from: json)
        #expect(wrapped.measurement.value == 2)
    }

    @Test func unmappedUnitThrowsEncodingError() {
        let custom = Measurement(value: 1, unit: UnitMass(symbol: "scoop"))
        #expect(throws: EncodingError.self) {
            _ = try sortedKeysEncoder.encode(CodableMeasurement(custom))
        }
    }

    @Test func roundTripsInsideParentType() throws {
        struct Payload: Codable, Equatable {
            var mass: CodableMeasurement<UnitMass>
            var tare: CodableMeasurement<UnitMass>
        }
        let payload = Payload(
            mass: Measurement(value: 21.5, unit: UnitMass.grams).codable,
            tare: Measurement(value: 2, unit: UnitMass.grams).codable
        )
        let data = try sortedKeysEncoder.encode(payload)
        #expect(String(decoding: data, as: UTF8.self)
            == #"{"mass":{"unit":"gram","value":21.5},"tare":{"unit":"gram","value":2}}"#)
        let decoded = try JSONDecoder().decode(Payload.self, from: data)
        #expect(decoded == payload)
    }

    @Test func equatableComparesAcrossUnits() {
        let kilo = Measurement(value: 1, unit: UnitMass.kilograms).codable
        let grams = Measurement(value: 1000, unit: UnitMass.grams).codable
        #expect(kilo == grams)
    }
}
