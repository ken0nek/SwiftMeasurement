import Foundation
import Testing
@testable import SwiftMeasurement

struct CoherenceCase: Sendable, CustomTestStringConvertible {
    let label: String
    let measured: DimensionalMeasurement
    let expectedSI: Double

    var testDescription: String { label }
}

private func isClose(_ actual: Double, _ expected: Double) -> Bool {
    // Relative: Foundation's own coefficients are rounded (km/h is 0.277778)
    abs(actual - expected) <= 1e-5 * abs(expected)
}

private final class UnitWidgetCount: Dimension, DimensionalUnit, @unchecked Sendable {
    static let widgets = UnitWidgetCount(symbol: "widget", converter: UnitConverterLinear(coefficient: 1))
    static let crates = UnitWidgetCount(symbol: "crate", converter: UnitConverterLinear(coefficient: 12))

    override class func baseUnit() -> Self {
        widgets as! Self
    }

    static var dimensions: DimensionalExponents { DimensionalExponents(amount: 1) }
    static var coherentScale: Double { 1e-3 }
}

@Suite("SI Coherence")
struct CoherenceTests {

    // Expected values are SI facts, written independently of each type's coherentScale.
    static let cases: [CoherenceCase] = [
        CoherenceCase(label: "1 g-force", measured: DimensionalMeasurement(1.gravity), expectedSI: 9.81), // Foundation's constant, not 9.80665
        CoherenceCase(label: "1°", measured: DimensionalMeasurement(1.degrees), expectedSI: .pi / 180),
        CoherenceCase(label: "1 hectare", measured: DimensionalMeasurement(1.hectares), expectedSI: 1e4),
        CoherenceCase(label: "1 mg/dL", measured: DimensionalMeasurement(1.milligramsPerDeciliter), expectedSI: 0.01),
        CoherenceCase(label: "1 ppm", measured: DimensionalMeasurement(1.partsPerMillion), expectedSI: 1e-6),
        CoherenceCase(label: "1 h", measured: DimensionalMeasurement(1.hours), expectedSI: 3600),
        CoherenceCase(label: "1 Ah", measured: DimensionalMeasurement(1.ampereHours), expectedSI: 3600),
        CoherenceCase(label: "1 mA", measured: DimensionalMeasurement(1.milliamperes), expectedSI: 1e-3),
        CoherenceCase(label: "1 kV", measured: DimensionalMeasurement(1.kilovolts), expectedSI: 1e3),
        CoherenceCase(label: "1 kΩ", measured: DimensionalMeasurement(1.kiloohms), expectedSI: 1e3),
        CoherenceCase(label: "1 kWh", measured: DimensionalMeasurement(1.kilowattHours), expectedSI: 3.6e6),
        CoherenceCase(label: "1 kHz", measured: DimensionalMeasurement(1.kilohertz), expectedSI: 1e3),
        CoherenceCase(label: "1 L/100km", measured: DimensionalMeasurement(1.litersPer100Kilometers), expectedSI: 1e-8),
        CoherenceCase(label: "1 mpg", measured: DimensionalMeasurement(1.milesPerGallon), expectedSI: 2.35215e-6),
        CoherenceCase(label: "1 lx", measured: DimensionalMeasurement(1.lux), expectedSI: 1),
        CoherenceCase(label: "1 byte", measured: DimensionalMeasurement(1.bytes), expectedSI: 8),
        CoherenceCase(label: "1 bit", measured: DimensionalMeasurement(1.bits), expectedSI: 1),
        CoherenceCase(label: "1 kbit", measured: DimensionalMeasurement(1.kilobits), expectedSI: 1e3),
        CoherenceCase(label: "1 km", measured: DimensionalMeasurement(1.kilometers), expectedSI: 1e3),
        CoherenceCase(label: "1 g", measured: DimensionalMeasurement(1.grams), expectedSI: 1e-3),
        CoherenceCase(label: "1 kW", measured: DimensionalMeasurement(1.kilowatts), expectedSI: 1e3),
        CoherenceCase(label: "1 bar", measured: DimensionalMeasurement(1.bars), expectedSI: 1e5),
        CoherenceCase(label: "1 km/h", measured: DimensionalMeasurement(1.kilometersPerHour), expectedSI: 1 / 3.6),
        CoherenceCase(label: "0 °C", measured: DimensionalMeasurement(0.celsius), expectedSI: 273.15),
        CoherenceCase(label: "1 L", measured: DimensionalMeasurement(1.liters), expectedSI: 1e-3),
        CoherenceCase(label: "1 m³", measured: DimensionalMeasurement(1.cubicMeters), expectedSI: 1),
    ]

    @Test("Every unit type lands on its coherent SI value", arguments: cases)
    func coherentValue(_ testCase: CoherenceCase) {
        #expect(isClose(testCase.measured.value, testCase.expectedSI))
    }

    @Test("Scaled types round-trip through convert(to:)")
    func roundTrips() {
        #expect(isClose(DimensionalMeasurement(3.liters).asVolume!.converted(to: .liters).value, 3))
        #expect(isClose(DimensionalMeasurement(30.degrees).asAngle!.converted(to: .degrees).value, 30))
        #expect(isClose(DimensionalMeasurement(5.bytes).asInformationStorage!.converted(to: .bytes).value, 5))
        #expect(isClose(DimensionalMeasurement(7.partsPerMillion).asDispersion!.converted(to: .partsPerMillion).value, 7))
        #expect(isClose(DimensionalMeasurement(30.milesPerGallon).convert(to: UnitFuelEfficiency.milesPerGallon)!.value, 30))
        #expect(isClose(DimensionalMeasurement(1.cubicMeters).convert(to: UnitVolume.liters)!.value, 1000))
    }

    @Test("Cross-type products land on the right unit")
    func crossTypeIdentities() {
        let meter = DimensionalMeasurement(1.meters)
        #expect(isClose((meter * meter * meter).asVolume!.converted(to: .cubicMeters).value, 1))
        #expect(isClose((DimensionalMeasurement(1.kilowatts) * DimensionalMeasurement(1.hours)).asEnergy!.converted(to: .kilowattHours).value, 1))
        #expect(isClose((DimensionalMeasurement(2.volts) * DimensionalMeasurement(3.amperes)).asPower!.converted(to: .watts).value, 6))
        #expect(isClose((DimensionalMeasurement(10.liters) / DimensionalMeasurement(100.kilometers)).asFuelEfficiency!.converted(to: .litersPer100Kilometers).value, 10))
    }

    @Test("Angles and information no longer mix with other dimensionless values")
    func pseudoDimensionsDoNotMix() {
        let product = DimensionalMeasurement(90.degrees) * DimensionalMeasurement(2.partsPerMillion)
        #expect(product.asInformationStorage == nil)
        #expect(product.asDispersion == nil)
        #expect(product.asAngle != nil)
        #expect((DimensionalMeasurement(1.radians) / DimensionalMeasurement(1.seconds)).asFrequency == nil)
        #expect((DimensionalMeasurement(1.bytes) / DimensionalMeasurement(1.seconds)).asFrequency == nil)
    }

    @Test("A custom DimensionalUnit's coherentScale is honored")
    func customUnitScaleIsHonored() {
        let crate = DimensionalMeasurement(Measurement(value: 1, unit: UnitWidgetCount.crates))
        #expect(isClose(crate.value, 12e-3))
        #expect(isClose(crate.convert(to: UnitWidgetCount.self)!.converted(to: .crates).value, 1))
    }

    @Test("Equality is relative, so small coherent values stay distinguishable")
    func equalityIsRelative() {
        #expect(DimensionalMeasurement(5.litersPer100Kilometers) != DimensionalMeasurement(5.009.litersPer100Kilometers))
        #expect(DimensionalMeasurement(1.milliliters) != DimensionalMeasurement(1.0001.milliliters))
        #expect(DimensionalMeasurement(1.kilometers) == DimensionalMeasurement(1000.meters))

        let a = DimensionalMeasurement(value: 1e-8, dimensions: .length)
        let b = DimensionalMeasurement(value: 1e-8 * (1 + 1e-12), dimensions: .length)
        #expect(a == b)
        #expect(a.hashValue == b.hashValue)
    }
}
