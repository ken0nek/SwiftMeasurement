import Foundation

extension Measurement where UnitType: Unit {

    public init(value: Int, unit: UnitType) {
        self.init(value: Double(value), unit: unit)
    }

    public init(value: Float, unit: UnitType) {
        self.init(value: Double(value), unit: unit)
    }
}
