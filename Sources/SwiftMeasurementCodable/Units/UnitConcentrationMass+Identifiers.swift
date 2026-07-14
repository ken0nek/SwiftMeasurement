import Foundation

/// CLDR 48.2 identifiers for `UnitConcentrationMass`: none exist.
/// `gramsPerLiter` has no regular CLDR id; `milligramsPerDeciliter` is deliberately
/// unmapped because CLDR's only candidate (`milligram-ofglucose-per-deciliter`) is
/// glucose-specific while Foundation's unit is a generic mass concentration.
extension UnitConcentrationMass: UnitIdentifierRepresentable {
    public var unitIdentifier: String? {
        nil
    }

    public static func unit(forIdentifier identifier: String) -> Self? {
        nil
    }
}
