import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("RawMeasurement")
struct RawMeasurementTests {
    @Test func decodesUnknownIdentifier() throws {
        let json = Data(#"{"value":9.5,"unit":"smidgen"}"#.utf8)
        let raw = try JSONDecoder().decode(RawMeasurement.self, from: json)
        #expect(raw == RawMeasurement(value: 9.5, unitIdentifier: "smidgen"))
    }

    @Test func typedAccessorReturnsNilForUnknown() {
        let raw = RawMeasurement(value: 9.5, unitIdentifier: "smidgen")
        #expect(raw.measurement(as: UnitMass.self) == nil)
    }

    @Test func typedAccessorBuildsMeasurement() {
        let raw = RawMeasurement(value: 21.5, unitIdentifier: "gram")
        #expect(raw.measurement(as: UnitMass.self) == Measurement(value: 21.5, unit: UnitMass.grams))
    }

    @Test func encodesUnderUnitKey() throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys]
        let data = try encoder.encode(RawMeasurement(value: 9.5, unitIdentifier: "smidgen"))
        #expect(String(decoding: data, as: UTF8.self) == #"{"unit":"smidgen","value":9.5}"#)
    }
}
