import Foundation
import SwiftMeasurement

// MARK: - Codable Conformance

// `Codable` support for the dimensional system types, kept in a dedicated
// module so the core `SwiftMeasurement` library stays independent of
// serialization. Consumers opt in by depending on the `SwiftMeasurementCodable`
// product.
//
// Because these conformances live outside the module that declares the types,
// they cannot be synthesized and are marked `@retroactive`. Each conformance
// encodes only the type's stored properties, mirroring the memberwise
// initializers so payloads stay stable and human-readable.

extension DimensionalExponents: @retroactive Encodable, @retroactive Decodable {
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

extension DimensionalMeasurement: @retroactive Encodable, @retroactive Decodable {
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
