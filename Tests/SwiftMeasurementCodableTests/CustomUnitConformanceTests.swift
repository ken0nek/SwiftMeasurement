import Foundation
import Testing
import SwiftMeasurementCodable

/// A consumer-defined Dimension subclass, proving the public extension point.
private final class UnitCrateCount: Dimension, @unchecked Sendable {
    static let crates = UnitCrateCount(symbol: "crate", converter: UnitConverterLinear(coefficient: 1))
    static let pallets = UnitCrateCount(symbol: "pallet", converter: UnitConverterLinear(coefficient: 48))

    override class func baseUnit() -> Self {
        crates as! Self
    }
}

extension UnitCrateCount: UnitIdentifierRepresentable {
    var unitIdentifier: String? {
        switch self {
        case .crates:  "crate"
        case .pallets: "pallet"
        default:       nil
        }
    }

    static func unit(forIdentifier identifier: String) -> Self? {
        let unit: UnitCrateCount?
        switch identifier {
        case "crate":  unit = .crates
        case "pallet": unit = .pallets
        default:       unit = nil
        }
        guard let unit else { return nil }
        return unit as? Self
    }
}

@Suite("Custom unit conformance")
struct CustomUnitConformanceTests {
    @Test func customUnitRoundTripsIdentifiers() {
        #expect(UnitCrateCount.crates.unitIdentifier == "crate")
        #expect(UnitCrateCount.unit(forIdentifier: "pallet") == .pallets)
        #expect(UnitCrateCount.unit(forIdentifier: "container") == nil)
    }

    @Test func customUnitEncodesViaWrapper() throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys]
        let data = try encoder.encode(Measurement(value: 3, unit: UnitCrateCount.pallets).codable)
        #expect(String(decoding: data, as: UTF8.self) == #"{"unit":"pallet","value":3}"#)
    }

    @Test func customUnitDecodesAndConverts() throws {
        let json = Data(#"{"value":2,"unit":"pallet"}"#.utf8)
        let decoded = try JSONDecoder().decode(CodableMeasurement<UnitCrateCount>.self, from: json)
        #expect(decoded.measurement.converted(to: .crates).value == 96)
    }
}
