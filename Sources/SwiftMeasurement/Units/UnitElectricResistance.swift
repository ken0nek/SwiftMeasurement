import Foundation

public extension MeasurementConvertible {

    var megaohms: Measurement<UnitElectricResistance> {
        return measurement(as: UnitElectricResistance.megaohms)
    }

    var kiloohms: Measurement<UnitElectricResistance> {
        return measurement(as: UnitElectricResistance.kiloohms)
    }

    var ohms: Measurement<UnitElectricResistance> {
        return measurement(as: UnitElectricResistance.ohms)
    }

    var milliohms: Measurement<UnitElectricResistance> {
        return measurement(as: UnitElectricResistance.milliohms)
    }

    var microohms: Measurement<UnitElectricResistance> {
        return measurement(as: UnitElectricResistance.microohms)
    }
}
