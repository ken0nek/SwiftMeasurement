import Foundation

public protocol MeasurementConvertible {
    func measurement<UnitType: Dimension>(as unit: UnitType) -> Measurement<UnitType>
}

extension Double: MeasurementConvertible {
    public func measurement<UnitType: Dimension>(as unit: UnitType) -> Measurement<UnitType> {
        return Measurement(value: self, unit: unit)
    }
}

extension Float: MeasurementConvertible {
    public func measurement<UnitType: Dimension>(as unit: UnitType) -> Measurement<UnitType> {
        return Measurement(value: Double(self), unit: unit)
    }
}

extension Int: MeasurementConvertible {
    public func measurement<UnitType: Dimension>(as unit: UnitType) -> Measurement<UnitType> {
        return Measurement(value: Double(self), unit: unit)
    }
}
