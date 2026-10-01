import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("Typed Algebra")
struct TypedAlgebraTests {

    @Test("Speed × duration is a typed length")
    func speedTimesDuration() {
        let distance = 60.kilometersPerHour * 2.hours
        #expect(type(of: distance) == Measurement<UnitLength>.self)
        // Foundation's km/h coefficient is 0.277778, so 60 km/h × 2 h is 120.000096 km
        #expect(abs(distance.converted(to: .kilometers).value - 120) < 1e-3)
    }

    @Test("Power × duration is energy")
    func powerTimesDuration() {
        let energy = 1.kilowatts * 1.hours
        #expect(abs(energy.converted(to: .kilowattHours).value - 1) < 1e-9)
    }

    @Test("Voltage × current is power")
    func voltageTimesCurrent() {
        let power = 2.volts * 3.amperes
        #expect(abs(power.converted(to: .watts).value - 6) < 1e-9)
    }

    @Test("A dimensionless typed result is a Double")
    func frequencyTimesDuration() {
        let cycles = 5.hertz * 2.seconds
        #expect(type(of: cycles) == Double.self)
        #expect(abs(cycles - 10) < 1e-9)
    }

    @Test("Length³ through typed operators is one cubic meter")
    func cubeOfLength() {
        let volume = 1.meters * 1.meters * 1.meters
        #expect(type(of: volume) == Measurement<UnitVolume>.self)
        #expect(abs(volume.converted(to: .cubicMeters).value - 1) < 1e-12)
    }

    @Test("Literal scalars still resolve to Foundation's operators")
    func literalScalarsStillResolveToFoundation() {
        let half = 10.meters / 2
        let doubled = 2 * 10.meters
        let scaled = 10.meters * 2.0
        #expect(type(of: half) == Measurement<UnitLength>.self)
        #expect(half.value == 5)
        #expect(doubled.value == 20)
        #expect(scaled.value == 20)
    }

    @Test("Pairs without a typed result stay dimensional")
    func untypedPairsStayDimensional() {
        let product = 3.meters * 2.kilograms
        #expect(type(of: product) == DimensionalMeasurement.self)
        let ratio = 10.meters / 2.meters
        #expect(type(of: ratio) == DimensionalMeasurement.self)
    }

    @Test("Chained DimensionalMeasurement members still resolve")
    func chainedDimensionalMembersStillResolve() {
        #expect((10.meters * 5.meters).asArea != nil)
        #expect((60.kilometersPerHour * 2.hours).convert(to: UnitLength.kilometers) != nil)
        let annotated: DimensionalMeasurement = 60.kilometersPerHour * 2.hours
        #expect(annotated.dimensions == .length)
    }
}
