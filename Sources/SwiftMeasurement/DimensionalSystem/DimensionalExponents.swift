import Foundation

/// Represents dimensional exponents for physical quantities based on SI units
public struct DimensionalExponents: Equatable, Hashable, CustomStringConvertible, Sendable {
    // Base SI dimensions
    public var length: Int       // L (meter)
    public var time: Int         // T (second)
    public var mass: Int         // M (kilogram)
    public var current: Int      // I (ampere)
    public var temperature: Int  // Θ (kelvin)
    public var amount: Int       // N (mole)
    public var luminosity: Int   // J (candela)

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
}
