import Foundation
import Testing
@testable import SwiftMeasurement

@Test func testUnitFrequency() {
    let value = 1.0
    
    #expect(value.terahertz == Measurement<UnitFrequency>(value: value, unit: .terahertz))
    #expect(value.gigahertz == Measurement<UnitFrequency>(value: value, unit: .gigahertz))
    #expect(value.megahertz == Measurement<UnitFrequency>(value: value, unit: .megahertz))
    #expect(value.kilohertz == Measurement<UnitFrequency>(value: value, unit: .kilohertz))
    #expect(value.hertz == Measurement<UnitFrequency>(value: value, unit: .hertz))
    #expect(value.millihertz == Measurement<UnitFrequency>(value: value, unit: .millihertz))
    #expect(value.microhertz == Measurement<UnitFrequency>(value: value, unit: .microhertz))
    #expect(value.nanohertz == Measurement<UnitFrequency>(value: value, unit: .nanohertz))
    #expect(value.framesPerSecond == Measurement<UnitFrequency>(value: value, unit: .framesPerSecond))
}
