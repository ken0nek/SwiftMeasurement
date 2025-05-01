import Foundation

public extension MeasurementConvertible {

    var litersPer100Kilometers: Measurement<UnitFuelEfficiency> {
        return measurement(as: UnitFuelEfficiency.litersPer100Kilometers)
    }

    var milesPerImperialGallon: Measurement<UnitFuelEfficiency> {
        return measurement(as: UnitFuelEfficiency.milesPerImperialGallon)
    }

    var milesPerGallon: Measurement<UnitFuelEfficiency> {
        return measurement(as: UnitFuelEfficiency.milesPerGallon)
    }
}
