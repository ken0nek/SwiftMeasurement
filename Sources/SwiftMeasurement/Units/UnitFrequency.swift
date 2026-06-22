import Foundation

// `UnitFrequency.framesPerSecond` was added to swift-corelibs-foundation in
// Swift 6.4 (swiftlang/swift-corelibs-foundation#5414). This shim provides it on
// non-Darwin platforms for older toolchains. Remove once the minimum supported
// toolchain is Swift 6.4+.
#if !canImport(Darwin) && compiler(<6.4)
extension UnitFrequency {
    public static let framesPerSecond = UnitFrequency(symbol: "fps", converter: UnitConverterLinear(coefficient: 1.0))
}
#endif

public extension MeasurementConvertible {

    var terahertz: Measurement<UnitFrequency> {
        return measurement(as: UnitFrequency.terahertz)
    }

    var gigahertz: Measurement<UnitFrequency> {
        return measurement(as: UnitFrequency.gigahertz)
    }

    var megahertz: Measurement<UnitFrequency> {
        return measurement(as: UnitFrequency.megahertz)
    }

    var kilohertz: Measurement<UnitFrequency> {
        return measurement(as: UnitFrequency.kilohertz)
    }

    var hertz: Measurement<UnitFrequency> {
        return measurement(as: UnitFrequency.hertz)
    }

    var millihertz: Measurement<UnitFrequency> {
        return measurement(as: UnitFrequency.millihertz)
    }

    var microhertz: Measurement<UnitFrequency> {
        return measurement(as: UnitFrequency.microhertz)
    }

    var nanohertz: Measurement<UnitFrequency> {
        return measurement(as: UnitFrequency.nanohertz)
    }

    var framesPerSecond: Measurement<UnitFrequency> {
        return measurement(as: UnitFrequency.framesPerSecond)
    }
}
