import Foundation

public extension MeasurementConvertible {

    var megaamperes: Measurement<UnitElectricCurrent> {
        return measurement(as: UnitElectricCurrent.megaamperes)
    }

    var kiloamperes: Measurement<UnitElectricCurrent> {
        return measurement(as: UnitElectricCurrent.kiloamperes)
    }

    var amperes: Measurement<UnitElectricCurrent> {
        return measurement(as: UnitElectricCurrent.amperes)
    }

    var milliamperes: Measurement<UnitElectricCurrent> {
        return measurement(as: UnitElectricCurrent.milliamperes)
    }

    var microamperes: Measurement<UnitElectricCurrent> {
        return measurement(as: UnitElectricCurrent.microamperes)
    }
}
