import Foundation

public extension MeasurementConvertible {

    var degrees: Measurement<UnitAngle> {
        return measurement(as: UnitAngle.degrees)
    }

    var arcMinutes: Measurement<UnitAngle> {
        return measurement(as: UnitAngle.arcMinutes)
    }

    var arcSeconds: Measurement<UnitAngle> {
        return measurement(as: UnitAngle.arcSeconds)
    }

    var radians: Measurement<UnitAngle> {
        return measurement(as: UnitAngle.radians)
    }

    var gradians: Measurement<UnitAngle> {
        return measurement(as: UnitAngle.gradians)
    }

    var revolutions: Measurement<UnitAngle> {
        return measurement(as: UnitAngle.revolutions)
    }
}
