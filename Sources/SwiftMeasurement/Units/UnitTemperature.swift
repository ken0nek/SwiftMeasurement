import Foundation

public extension MeasurementConvertible {

    var kelvin: Measurement<UnitTemperature> {
        return measurement(as: UnitTemperature.kelvin)
    }

    var celsius: Measurement<UnitTemperature> {
        return measurement(as: UnitTemperature.celsius)
    }

    var fahrenheit: Measurement<UnitTemperature> {
        return measurement(as: UnitTemperature.fahrenheit)
    }
}
