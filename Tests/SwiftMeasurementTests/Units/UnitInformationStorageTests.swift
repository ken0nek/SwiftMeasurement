import Foundation
import Testing
@testable import SwiftMeasurement

@Test func testUnitInformationStorage() {
    let value = 1

    #expect(value.bytes      == Measurement<UnitInformationStorage>(value: value, unit: .bytes))
    #expect(value.bits       == Measurement<UnitInformationStorage>(value: value, unit: .bits))
    #expect(value.nibbles    == Measurement<UnitInformationStorage>(value: value, unit: .nibbles))
    #expect(value.yottabytes == Measurement<UnitInformationStorage>(value: value, unit: .yottabytes))
    #expect(value.zettabytes == Measurement<UnitInformationStorage>(value: value, unit: .zettabytes))
    #expect(value.exabytes   == Measurement<UnitInformationStorage>(value: value, unit: .exabytes))
    #expect(value.petabytes  == Measurement<UnitInformationStorage>(value: value, unit: .petabytes))
    #expect(value.terabytes  == Measurement<UnitInformationStorage>(value: value, unit: .terabytes))
    #expect(value.gigabytes  == Measurement<UnitInformationStorage>(value: value, unit: .gigabytes))
    #expect(value.megabytes  == Measurement<UnitInformationStorage>(value: value, unit: .megabytes))
    #expect(value.kilobytes  == Measurement<UnitInformationStorage>(value: value, unit: .kilobytes))
    #expect(value.yottabits  == Measurement<UnitInformationStorage>(value: value, unit: .yottabits))
    #expect(value.zettabits  == Measurement<UnitInformationStorage>(value: value, unit: .zettabits))
    #expect(value.exabits    == Measurement<UnitInformationStorage>(value: value, unit: .exabits))
    #expect(value.petabits   == Measurement<UnitInformationStorage>(value: value, unit: .petabits))
    #expect(value.terabits   == Measurement<UnitInformationStorage>(value: value, unit: .terabits))
    #expect(value.gigabits   == Measurement<UnitInformationStorage>(value: value, unit: .gigabits))
    #expect(value.megabits   == Measurement<UnitInformationStorage>(value: value, unit: .megabits))
    #expect(value.kilobits   == Measurement<UnitInformationStorage>(value: value, unit: .kilobits))
    #expect(value.yobibytes  == Measurement<UnitInformationStorage>(value: value, unit: .yobibytes))
    #expect(value.zebibytes  == Measurement<UnitInformationStorage>(value: value, unit: .zebibytes))
    #expect(value.exbibytes  == Measurement<UnitInformationStorage>(value: value, unit: .exbibytes))
    #expect(value.pebibytes  == Measurement<UnitInformationStorage>(value: value, unit: .pebibytes))
    #expect(value.tebibytes  == Measurement<UnitInformationStorage>(value: value, unit: .tebibytes))
    #expect(value.gibibytes  == Measurement<UnitInformationStorage>(value: value, unit: .gibibytes))
    #expect(value.mebibytes  == Measurement<UnitInformationStorage>(value: value, unit: .mebibytes))
    #expect(value.kibibytes  == Measurement<UnitInformationStorage>(value: value, unit: .kibibytes))
    #expect(value.yobibits   == Measurement<UnitInformationStorage>(value: value, unit: .yobibits))
    #expect(value.zebibits   == Measurement<UnitInformationStorage>(value: value, unit: .zebibits))
    #expect(value.exbibits   == Measurement<UnitInformationStorage>(value: value, unit: .exbibits))
    #expect(value.pebibits   == Measurement<UnitInformationStorage>(value: value, unit: .pebibits))
    #expect(value.tebibits   == Measurement<UnitInformationStorage>(value: value, unit: .tebibits))
    #expect(value.gibibits   == Measurement<UnitInformationStorage>(value: value, unit: .gibibits))
    #expect(value.mebibits   == Measurement<UnitInformationStorage>(value: value, unit: .mebibits))
    #expect(value.kibibits   == Measurement<UnitInformationStorage>(value: value, unit: .kibibits))
}
