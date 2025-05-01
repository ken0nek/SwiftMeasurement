import Foundation

public extension MeasurementConvertible {

    var metersPerSecond: Measurement<UnitSpeed> {
        return measurement(as: UnitSpeed.metersPerSecond)
    }

    var kilometersPerHour: Measurement<UnitSpeed> {
        return measurement(as: UnitSpeed.kilometersPerHour)
    }

    var milesPerHour: Measurement<UnitSpeed> {
        return measurement(as: UnitSpeed.milesPerHour)
    }

    var knots: Measurement<UnitSpeed> {
        return measurement(as: UnitSpeed.knots)
    }
}
