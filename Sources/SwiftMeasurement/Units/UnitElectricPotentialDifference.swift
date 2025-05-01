import Foundation

public extension MeasurementConvertible {

    var megavolts: Measurement<UnitElectricPotentialDifference> {
        return measurement(as: UnitElectricPotentialDifference.megavolts)
    }

    var kilovolts: Measurement<UnitElectricPotentialDifference> {
        return measurement(as: UnitElectricPotentialDifference.kilovolts)
    }

    var volts: Measurement<UnitElectricPotentialDifference> {
        return measurement(as: UnitElectricPotentialDifference.volts)
    }

    var millivolts: Measurement<UnitElectricPotentialDifference> {
        return measurement(as: UnitElectricPotentialDifference.millivolts)
    }

    var microvolts: Measurement<UnitElectricPotentialDifference> {
        return measurement(as: UnitElectricPotentialDifference.microvolts)
    }
}
