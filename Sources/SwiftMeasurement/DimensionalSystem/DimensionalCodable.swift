import Foundation

// MARK: - Codable Conformance

// Plain, self-contained `Codable` conformance for the dimensional system types.
// These conformances are deliberately independent: they encode and decode only
// each type's stored properties, with no reliance on any other utilities in the
// package. The layout mirrors the memberwise initializers so encoded values are
// stable and human-readable.

extension DimensionalExponents: Codable {
    private enum CodingKeys: String, CodingKey {
        case length
        case time
        case mass
        case current
        case temperature
        case amount
        case luminosity
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            length: try container.decode(Int.self, forKey: .length),
            time: try container.decode(Int.self, forKey: .time),
            mass: try container.decode(Int.self, forKey: .mass),
            current: try container.decode(Int.self, forKey: .current),
            temperature: try container.decode(Int.self, forKey: .temperature),
            amount: try container.decode(Int.self, forKey: .amount),
            luminosity: try container.decode(Int.self, forKey: .luminosity)
        )
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(length, forKey: .length)
        try container.encode(time, forKey: .time)
        try container.encode(mass, forKey: .mass)
        try container.encode(current, forKey: .current)
        try container.encode(temperature, forKey: .temperature)
        try container.encode(amount, forKey: .amount)
        try container.encode(luminosity, forKey: .luminosity)
    }
}

extension DimensionalMeasurement: Codable {
    private enum CodingKeys: String, CodingKey {
        case value
        case dimensions
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: try container.decode(Double.self, forKey: .value),
            dimensions: try container.decode(DimensionalExponents.self, forKey: .dimensions)
        )
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try container.encode(dimensions, forKey: .dimensions)
    }
}
