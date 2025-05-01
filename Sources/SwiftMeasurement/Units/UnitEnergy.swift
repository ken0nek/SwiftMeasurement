import Foundation

public extension MeasurementConvertible {

    var kilojoules: Measurement<UnitEnergy> {
        return measurement(as: UnitEnergy.kilojoules)
    }

    var joules: Measurement<UnitEnergy> {
        return measurement(as: UnitEnergy.joules)
    }

    var kilocalories: Measurement<UnitEnergy> {
        return measurement(as: UnitEnergy.kilocalories)
    }

    var calories: Measurement<UnitEnergy> {
        return measurement(as: UnitEnergy.calories)
    }

    var kilowattHours: Measurement<UnitEnergy> {
        return measurement(as: UnitEnergy.kilowattHours)
    }
}
