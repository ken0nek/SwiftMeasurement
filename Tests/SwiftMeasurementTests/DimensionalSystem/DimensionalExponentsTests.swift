import Foundation
import Testing
@testable import SwiftMeasurement

@Suite("DimensionalExponents")
struct DimensionalExponentsTests {

    @Test("Initialization")
    func initialization() {
        let length = DimensionalExponents(length: 1)
        #expect(length.length == 1)
        #expect(length.time == 0)
        #expect(length.mass == 0)

        let velocity = DimensionalExponents(length: 1, time: -1)
        #expect(velocity.length == 1)
        #expect(velocity.time == -1)
        #expect(velocity.mass == 0)

        let energy = DimensionalExponents(length: 2, time: -2, mass: 1)
        #expect(energy.length == 2)
        #expect(energy.time == -2)
        #expect(energy.mass == 1)
    }

    @Test("Addition")
    func addition() {
        let length = DimensionalExponents(length: 1)
        let time = DimensionalExponents(time: 1)

        let result = length + time
        #expect(result.length == 1)
        #expect(result.time == 1)
        #expect(result.mass == 0)
    }

    @Test("Subtraction")
    func subtraction() {
        let energy = DimensionalExponents(length: 2, time: -2, mass: 1)
        let mass = DimensionalExponents(mass: 1)

        let result = energy - mass
        #expect(result.length == 2)
        #expect(result.time == -2)
        #expect(result.mass == 0)
    }

    @Test("Multiplication")
    func multiplication() {
        let length = DimensionalExponents(length: 1)
        let result = length * 2

        #expect(result.length == 2)
        #expect(result.time == 0)
        #expect(result.mass == 0)
    }

    @Test("Dimensionless Check")
    func isDimensionless() {
        let dimensionless = DimensionalExponents()
        #expect(dimensionless.isDimensionless)

        let length = DimensionalExponents(length: 1)
        #expect(!length.isDimensionless)
    }

    @Test("String Representation")
    func description() {
        let length = DimensionalExponents(length: 1)
        #expect(length.description == "L^1")

        let velocity = DimensionalExponents(length: 1, time: -1)
        #expect(velocity.description == "L^1·T^-1")

        let dimensionless = DimensionalExponents()
        #expect(dimensionless.description == "dimensionless")
    }
}
