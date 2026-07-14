import Foundation

/// Wraps a `Measurement` in the stable wire shape `{"value": <number>, "unit": "<cldr-id>"}`.
///
/// Encoding emits the measurement's *current* unit's identifier — no conversion or
/// canonicalization. Convert first (`measurement.converted(to:)`) to control the unit
/// on the wire. Decoding an identifier the unit type does not recognize throws
/// `DecodingError`; for a lenient alternative see `RawMeasurement`.
///
/// `Equatable` compares the wrapped `Measurement` *dimensionally* (as `Measurement`
/// does), so two wrappers with equal magnitude but different units — e.g. 1 kg and
/// 1000 g — are `==` even though they encode to different JSON. If you need equality
/// that mirrors the wire bytes, compare `measurement.value` and `measurement.unit`.
public struct CodableMeasurement<UnitType: UnitIdentifierRepresentable>: Equatable, Sendable {
    /// The wrapped measurement.
    public var measurement: Measurement<UnitType>

    /// Wraps a measurement for encoding and decoding.
    public init(_ measurement: Measurement<UnitType>) {
        self.measurement = measurement
    }
}

extension CodableMeasurement: Codable {
    private enum CodingKeys: String, CodingKey {
        case value
        case unit
    }

    /// Decodes `{"value", "unit"}`; throws `DecodingError` if the identifier is unrecognized.
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let value = try container.decode(Double.self, forKey: .value)
        let identifier = try container.decode(String.self, forKey: .unit)
        guard let unit = UnitType.unit(forIdentifier: identifier) else {
            throw DecodingError.dataCorruptedError(
                forKey: .unit,
                in: container,
                debugDescription: "Unrecognized unit identifier \"\(identifier)\" for \(UnitType.self)"
            )
        }
        self.init(Measurement(value: value, unit: unit))
    }

    /// Encodes `{"value", "unit"}`. Throws `EncodingError` if the current unit has no
    /// identifier, or — under `JSONEncoder`'s default non-conforming-float strategy — if
    /// the value is non-finite (NaN or infinity).
    public func encode(to encoder: any Encoder) throws {
        guard let identifier = measurement.unit.unitIdentifier else {
            throw EncodingError.invalidValue(
                measurement,
                EncodingError.Context(
                    codingPath: encoder.codingPath,
                    debugDescription: """
                    Unit "\(measurement.unit.symbol)" of \(UnitType.self) has no unit identifier. \
                    Convert to a mapped unit with converted(to:), or conform your custom unit type.
                    """
                )
            )
        }
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(measurement.value, forKey: .value)
        try container.encode(identifier, forKey: .unit)
    }
}

extension Measurement where UnitType: UnitIdentifierRepresentable {
    /// The measurement wrapped for `{"value", "unit"}` encoding:
    /// `Measurement(value: 21.5, unit: UnitMass.grams).codable`.
    public var codable: CodableMeasurement<UnitType> { .init(self) }
}
