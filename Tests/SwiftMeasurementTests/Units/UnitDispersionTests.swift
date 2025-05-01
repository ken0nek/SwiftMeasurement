import Foundation
import Testing
@testable import SwiftMeasurement

@Test func testUnitDispersion() {
    let value = 1.0
    
    #expect(value.partsPerMillion == Measurement<UnitDispersion>(value: value, unit: .partsPerMillion))
}
