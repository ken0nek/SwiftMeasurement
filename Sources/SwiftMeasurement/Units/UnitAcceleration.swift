import Foundation

public extension MeasurementConvertible {

    var metersPerSecondSquared: Measurement<UnitAcceleration> {
        return measurement(as: UnitAcceleration.metersPerSecondSquared)
    }

    var gravity: Measurement<UnitAcceleration> {
        return measurement(as: UnitAcceleration.gravity)
    }
}
