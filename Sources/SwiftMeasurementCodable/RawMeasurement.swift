import Foundation

/// The `{"value", "unit"}` wire pair with the unit identifier kept as a raw string.
///
/// Decoding never fails on an unrecognized identifier — use this instead of
/// `CodableMeasurement` when your policy is "an unrecognized unit means the
/// quantity is absent". Typed interpretation is a separate, failable step:
///
/// ```swift
/// let raw = try JSONDecoder().decode(RawMeasurement.self, from: json)
/// let mass = raw.measurement(as: UnitMass.self)   // nil if unrecognized
/// ```
public struct RawMeasurement: Codable, Equatable, Sendable {
    /// The numeric value as it appears on the wire.
    public var value: Double

    /// The unit identifier string as it appears on the wire (key: `unit`).
    public var unitIdentifier: String

    private enum CodingKeys: String, CodingKey {
        case value
        case unitIdentifier = "unit"
    }

    /// Creates a raw wire pair.
    public init(value: Double, unitIdentifier: String) {
        self.value = value
        self.unitIdentifier = unitIdentifier
    }

    /// The typed measurement, or `nil` when the identifier isn't recognized by that unit type.
    public func measurement<UnitType: UnitIdentifierRepresentable>(
        as unitType: UnitType.Type
    ) -> Measurement<UnitType>? {
        guard let unit = UnitType.unit(forIdentifier: unitIdentifier) else { return nil }
        return Measurement(value: value, unit: unit)
    }
}
