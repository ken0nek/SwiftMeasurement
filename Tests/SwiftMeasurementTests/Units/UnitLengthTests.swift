import Foundation
import Testing
@testable import SwiftMeasurement

@Test func testUnitLength() {
    let value = 1

    #expect(value.megameters        == Measurement<UnitLength>(value: value, unit: .megameters))
    #expect(value.kilometers        == Measurement<UnitLength>(value: value, unit: .kilometers))
    #expect(value.hectometers       == Measurement<UnitLength>(value: value, unit: .hectometers))
    #expect(value.decameters        == Measurement<UnitLength>(value: value, unit: .decameters))
    #expect(value.meters            == Measurement<UnitLength>(value: value, unit: .meters))
    #expect(value.decimeters        == Measurement<UnitLength>(value: value, unit: .decimeters))
    #expect(value.centimeters       == Measurement<UnitLength>(value: value, unit: .centimeters))
    #expect(value.millimeters       == Measurement<UnitLength>(value: value, unit: .millimeters))
    #expect(value.micrometers       == Measurement<UnitLength>(value: value, unit: .micrometers))
    #expect(value.nanometers        == Measurement<UnitLength>(value: value, unit: .nanometers))
    #expect(value.picometers        == Measurement<UnitLength>(value: value, unit: .picometers))
    #expect(value.inches            == Measurement<UnitLength>(value: value, unit: .inches))
    #expect(value.feet              == Measurement<UnitLength>(value: value, unit: .feet))
    #expect(value.yards             == Measurement<UnitLength>(value: value, unit: .yards))
    #expect(value.miles             == Measurement<UnitLength>(value: value, unit: .miles))
    #expect(value.scandinavianMiles == Measurement<UnitLength>(value: value, unit: .scandinavianMiles))
    #expect(value.lightyears        == Measurement<UnitLength>(value: value, unit: .lightyears))
    #expect(value.nauticalMiles     == Measurement<UnitLength>(value: value, unit: .nauticalMiles))
    #expect(value.fathoms           == Measurement<UnitLength>(value: value, unit: .fathoms))
    #expect(value.furlongs          == Measurement<UnitLength>(value: value, unit: .furlongs))
    #expect(value.astronomicalUnits == Measurement<UnitLength>(value: value, unit: .astronomicalUnits))
    #expect(value.parsecs           == Measurement<UnitLength>(value: value, unit: .parsecs))
}
