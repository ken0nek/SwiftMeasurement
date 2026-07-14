import Foundation
import Testing
import SwiftMeasurementCodable

@Suite("UnitConcentrationMass identifiers")
struct UnitConcentrationMassIdentifierTests {
    @Test func noIdentifiersAreMapped() {
        #expect(UnitConcentrationMass.unit(forIdentifier: "gram-per-liter") == nil)
        #expect(UnitConcentrationMass.gramsPerLiter.unitIdentifier == nil)
        #expect(UnitConcentrationMass.milligramsPerDeciliter.unitIdentifier == nil)
    }
}
