import Foundation

/// Represents dimensional exponents for physical quantities based on SI units
public struct DimensionalExponents: Equatable, Hashable, CustomStringConvertible, CustomDebugStringConvertible, Sendable {
    // Base SI dimensions
    public let length: Int       // L (meter)
    public let time: Int         // T (second)
    public let mass: Int         // M (kilogram)
    public let current: Int      // I (ampere)
    public let temperature: Int  // Θ (kelvin)
    public let amount: Int       // N (mole)
    public let luminosity: Int   // J (candela)

    public init(
        length: Int = 0,
        time: Int = 0,
        mass: Int = 0,
        current: Int = 0,
        temperature: Int = 0,
        amount: Int = 0,
        luminosity: Int = 0
    ) {
        self.length = length
        self.time = time
        self.mass = mass
        self.current = current
        self.temperature = temperature
        self.amount = amount
        self.luminosity = luminosity
    }

    // Add dimensions
    public static func + (lhs: DimensionalExponents, rhs: DimensionalExponents) -> DimensionalExponents {
        return DimensionalExponents(
            length: lhs.length + rhs.length,
            time: lhs.time + rhs.time,
            mass: lhs.mass + rhs.mass,
            current: lhs.current + rhs.current,
            temperature: lhs.temperature + rhs.temperature,
            amount: lhs.amount + rhs.amount,
            luminosity: lhs.luminosity + rhs.luminosity
        )
    }

    // Subtract dimensions
    public static func - (lhs: DimensionalExponents, rhs: DimensionalExponents) -> DimensionalExponents {
        return DimensionalExponents(
            length: lhs.length - rhs.length,
            time: lhs.time - rhs.time,
            mass: lhs.mass - rhs.mass,
            current: lhs.current - rhs.current,
            temperature: lhs.temperature - rhs.temperature,
            amount: lhs.amount - rhs.amount,
            luminosity: lhs.luminosity - rhs.luminosity
        )
    }

    // Multiply by scalar
    public static func * (lhs: DimensionalExponents, rhs: Int) -> DimensionalExponents {
        return DimensionalExponents(
            length: lhs.length * rhs,
            time: lhs.time * rhs,
            mass: lhs.mass * rhs,
            current: lhs.current * rhs,
            temperature: lhs.temperature * rhs,
            amount: lhs.amount * rhs,
            luminosity: lhs.luminosity * rhs
        )
    }

    // Check if dimensions are dimensionless
    public var isDimensionless: Bool {
        return length == 0 && time == 0 && mass == 0 && current == 0 &&
               temperature == 0 && amount == 0 && luminosity == 0
    }

    // String representation
    public var description: String {
        var components: [String] = []

        if length != 0 { components.append("L^\(length)") }
        if time != 0 { components.append("T^\(time)") }
        if mass != 0 { components.append("M^\(mass)") }
        if current != 0 { components.append("I^\(current)") }
        if temperature != 0 { components.append("Θ^\(temperature)") }
        if amount != 0 { components.append("N^\(amount)") }
        if luminosity != 0 { components.append("J^\(luminosity)") }

        return components.isEmpty ? "dimensionless" : components.joined(separator: "·")
    }

    // Debug representation
    public var debugDescription: String {
        return "DimensionalExponents(length: \(length), time: \(time), mass: \(mass), current: \(current), temperature: \(temperature), amount: \(amount), luminosity: \(luminosity))"
    }

    // MARK: - Named Dimension Presets

    public static let dimensionless = DimensionalExponents()
    public static let length = DimensionalExponents(length: 1)
    public static let area = DimensionalExponents(length: 2)
    public static let volume = DimensionalExponents(length: 3)
    public static let time = DimensionalExponents(time: 1)
    public static let frequency = DimensionalExponents(time: -1)
    public static let mass = DimensionalExponents(mass: 1)
    public static let speed = DimensionalExponents(length: 1, time: -1)
    public static let acceleration = DimensionalExponents(length: 1, time: -2)
    public static let force = DimensionalExponents(length: 1, time: -2, mass: 1)
    public static let energy = DimensionalExponents(length: 2, time: -2, mass: 1)
    public static let power = DimensionalExponents(length: 2, time: -3, mass: 1)
    public static let pressure = DimensionalExponents(length: -1, time: -2, mass: 1)
    public static let electricCurrent = DimensionalExponents(current: 1)
    public static let electricCharge = DimensionalExponents(time: 1, current: 1)
    public static let voltage = DimensionalExponents(length: 2, time: -3, mass: 1, current: -1)
    public static let electricResistance = DimensionalExponents(length: 2, time: -3, mass: 1, current: -2)
    public static let temperature = DimensionalExponents(temperature: 1)
    public static let concentrationMass = DimensionalExponents(length: -3, mass: 1)
}
