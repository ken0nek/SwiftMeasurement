import Foundation
import Testing
@testable import SwiftMeasurement

@Test func testUnitEnergy() {
    let value = 1.0
    
    #expect(value.kilojoules == Measurement<UnitEnergy>(value: value, unit: .kilojoules))
    #expect(value.joules == Measurement<UnitEnergy>(value: value, unit: .joules))
    #expect(value.kilocalories == Measurement<UnitEnergy>(value: value, unit: .kilocalories))
    #expect(value.calories == Measurement<UnitEnergy>(value: value, unit: .calories))
    #expect(value.kilowattHours == Measurement<UnitEnergy>(value: value, unit: .kilowattHours))
}
