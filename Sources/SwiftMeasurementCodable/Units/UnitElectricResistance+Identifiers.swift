import Foundation

/// CLDR 48.2 identifiers for `UnitElectricResistance`. Unmapped constants (no
/// regular CLDR id): `megaohms`, `kiloohms`, `milliohms`, `microohms`.
extension UnitElectricResistance: UnitIdentifierRepresentable {
    public var unitIdentifier: String? {
        switch self {
        case .ohms: "ohm"
        default:    nil
        }
    }

    public static func unit(forIdentifier identifier: String) -> Self? {
        let unit: UnitElectricResistance?
        switch identifier {
        case "ohm": unit = .ohms
        default:    unit = nil
        }
        guard let unit else { return nil }
        return unit as? Self
    }
}
