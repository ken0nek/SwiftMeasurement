import Foundation
import Testing
@testable import SwiftMeasurement

@Test func testUnitSpeed() {
    let value = 1.0
    
    #expect(value.metersPerSecond == Measurement<UnitSpeed>(value: value, unit: .metersPerSecond))
    #expect(value.kilometersPerHour == Measurement<UnitSpeed>(value: value, unit: .kilometersPerHour))
    #expect(value.milesPerHour == Measurement<UnitSpeed>(value: value, unit: .milesPerHour))
    #expect(value.knots == Measurement<UnitSpeed>(value: value, unit: .knots))
}
