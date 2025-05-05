import Foundation

// MARK: - Initializers

extension Measurement where UnitType: Unit {

    public init(value: Int, unit: UnitType) {
        self.init(value: Double(value), unit: unit)
    }

    public init(value: Float, unit: UnitType) {
        self.init(value: Double(value), unit: unit)
    }
}

// MARK: - ExpressibleByFloatLiteral

extension Measurement: @retroactive ExpressibleByFloatLiteral where UnitType: Dimension {

    public init(floatLiteral value: Double) {
        self.init(value: value, unit: UnitType.baseUnit())
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension Measurement: @retroactive ExpressibleByIntegerLiteral where UnitType: Dimension {
    public init(integerLiteral value: Int) {
        self.init(floatLiteral: Double(value))
    }
}
