import Foundation
import Testing
@testable import SwiftMeasurement

@Test func testUnitVolume() {
    let value = 1

    #expect(value.megaliters          == Measurement<UnitVolume>(value: value, unit: .megaliters))
    #expect(value.kiloliters          == Measurement<UnitVolume>(value: value, unit: .kiloliters))
    #expect(value.liters              == Measurement<UnitVolume>(value: value, unit: .liters))
    #expect(value.deciliters          == Measurement<UnitVolume>(value: value, unit: .deciliters))
    #expect(value.centiliters         == Measurement<UnitVolume>(value: value, unit: .centiliters))
    #expect(value.milliliters         == Measurement<UnitVolume>(value: value, unit: .milliliters))
    #expect(value.cubicKilometers     == Measurement<UnitVolume>(value: value, unit: .cubicKilometers))
    #expect(value.cubicMeters         == Measurement<UnitVolume>(value: value, unit: .cubicMeters))
    #expect(value.cubicDecimeters     == Measurement<UnitVolume>(value: value, unit: .cubicDecimeters))
    #expect(value.cubicCentimeters    == Measurement<UnitVolume>(value: value, unit: .cubicCentimeters))
    #expect(value.cubicMillimeters    == Measurement<UnitVolume>(value: value, unit: .cubicMillimeters))
    #expect(value.cubicInches         == Measurement<UnitVolume>(value: value, unit: .cubicInches))
    #expect(value.cubicFeet           == Measurement<UnitVolume>(value: value, unit: .cubicFeet))
    #expect(value.cubicYards          == Measurement<UnitVolume>(value: value, unit: .cubicYards))
    #expect(value.cubicMiles          == Measurement<UnitVolume>(value: value, unit: .cubicMiles))
    #expect(value.acreFeet            == Measurement<UnitVolume>(value: value, unit: .acreFeet))
    #expect(value.bushels             == Measurement<UnitVolume>(value: value, unit: .bushels))
    #expect(value.teaspoons           == Measurement<UnitVolume>(value: value, unit: .teaspoons))
    #expect(value.tablespoons         == Measurement<UnitVolume>(value: value, unit: .tablespoons))
    #expect(value.fluidOunces         == Measurement<UnitVolume>(value: value, unit: .fluidOunces))
    #expect(value.cups                == Measurement<UnitVolume>(value: value, unit: .cups))
    #expect(value.pints               == Measurement<UnitVolume>(value: value, unit: .pints))
    #expect(value.quarts              == Measurement<UnitVolume>(value: value, unit: .quarts))
    #expect(value.gallons             == Measurement<UnitVolume>(value: value, unit: .gallons))
    #expect(value.imperialTeaspoons   == Measurement<UnitVolume>(value: value, unit: .imperialTeaspoons))
    #expect(value.imperialTablespoons == Measurement<UnitVolume>(value: value, unit: .imperialTablespoons))
    #expect(value.imperialFluidOunces == Measurement<UnitVolume>(value: value, unit: .imperialFluidOunces))
    #expect(value.imperialPints       == Measurement<UnitVolume>(value: value, unit: .imperialPints))
    #expect(value.imperialQuarts      == Measurement<UnitVolume>(value: value, unit: .imperialQuarts))
    #expect(value.imperialGallons     == Measurement<UnitVolume>(value: value, unit: .imperialGallons))
    #expect(value.metricCups          == Measurement<UnitVolume>(value: value, unit: .metricCups))
}
