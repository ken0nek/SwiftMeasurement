import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Frequency")
struct UnitFrequencyTests {

    @Test("All Frequency unit properties are properly mapped")
    func allProperties() {
        let value = 1

        #expect(value.terahertz       == Measurement<UnitFrequency>(value: value, unit: .terahertz))
        #expect(value.gigahertz       == Measurement<UnitFrequency>(value: value, unit: .gigahertz))
        #expect(value.megahertz       == Measurement<UnitFrequency>(value: value, unit: .megahertz))
        #expect(value.kilohertz       == Measurement<UnitFrequency>(value: value, unit: .kilohertz))
        #expect(value.hertz           == Measurement<UnitFrequency>(value: value, unit: .hertz))
        #expect(value.millihertz      == Measurement<UnitFrequency>(value: value, unit: .millihertz))
        #expect(value.microhertz      == Measurement<UnitFrequency>(value: value, unit: .microhertz))
        #expect(value.nanohertz       == Measurement<UnitFrequency>(value: value, unit: .nanohertz))
        #expect(value.framesPerSecond == Measurement<UnitFrequency>(value: value, unit: .framesPerSecond))
    }

    @Test("Double values produce correct measurements")
    func doubleValues() {
        let value: Double = 3.14
        #expect(value.hertz == Measurement<UnitFrequency>(value: value, unit: .hertz))
        #expect(value.gigahertz == Measurement<UnitFrequency>(value: value, unit: .gigahertz))
    }

    @Test("Float values produce correct measurements")
    func floatValues() {
        let value: Float = 2.5
        #expect(value.hertz == Measurement<UnitFrequency>(value: value, unit: .hertz))
        #expect(value.gigahertz == Measurement<UnitFrequency>(value: value, unit: .gigahertz))
    }

    @Test("Zero and negative values")
    func edgeCases() {
        #expect(0.hertz == Measurement<UnitFrequency>(value: 0, unit: .hertz))
        #expect((-5.0).hertz == Measurement<UnitFrequency>(value: -5.0, unit: .hertz))
    }
}
