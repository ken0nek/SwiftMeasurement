import Foundation

public extension MeasurementConvertible {

    var seconds: Measurement<UnitDuration> {
        return measurement(as: UnitDuration.seconds)
    }

    var minutes: Measurement<UnitDuration> {
        return measurement(as: UnitDuration.minutes)
    }

    var hours: Measurement<UnitDuration> {
        return measurement(as: UnitDuration.hours)
    }

    var milliseconds: Measurement<UnitDuration> {
        return measurement(as: UnitDuration.milliseconds)
    }

    var microseconds: Measurement<UnitDuration> {
        return measurement(as: UnitDuration.microseconds)
    }

    var nanoseconds: Measurement<UnitDuration> {
        return measurement(as: UnitDuration.nanoseconds)
    }

    var picoseconds: Measurement<UnitDuration> {
        return measurement(as: UnitDuration.picoseconds)
    }
}
