import Foundation

public extension MeasurementConvertible {

    var lux: Measurement<UnitIlluminance> {
        return measurement(as: UnitIlluminance.lux)
    }
}
