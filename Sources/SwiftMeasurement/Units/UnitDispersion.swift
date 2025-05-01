import Foundation

public extension MeasurementConvertible {

    var partsPerMillion: Measurement<UnitDispersion> {
        return measurement(as: UnitDispersion.partsPerMillion)
    }
}
