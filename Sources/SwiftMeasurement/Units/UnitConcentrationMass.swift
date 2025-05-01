import Foundation

public extension MeasurementConvertible {

    var gramsPerLiter: Measurement<UnitConcentrationMass> {
        return measurement(as: UnitConcentrationMass.gramsPerLiter)
    }

    var milligramsPerDeciliter: Measurement<UnitConcentrationMass> {
        return measurement(as: UnitConcentrationMass.milligramsPerDeciliter)
    }
}
