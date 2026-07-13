import Foundation

/// CLDR 48.2 identifiers for `UnitElectricPotentialDifference`. Unmapped constants
/// (no regular CLDR id): `megavolts`, `kilovolts`, `millivolts`, `microvolts`.
extension UnitElectricPotentialDifference: UnitIdentifierRepresentable {
    public var unitIdentifier: String? {
        switch self {
        case .volts: "volt"
        default:     nil
        }
    }

    public static func unit(forIdentifier identifier: String) -> Self? {
        let unit: UnitElectricPotentialDifference?
        switch identifier {
        case "volt": unit = .volts
        default:     unit = nil
        }
        guard let unit else { return nil }
        return unit as? Self
    }
}
