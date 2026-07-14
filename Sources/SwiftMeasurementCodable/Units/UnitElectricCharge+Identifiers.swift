import Foundation

/// CLDR 48.2 identifiers for `UnitElectricCharge`. Unmapped constants (no regular
/// CLDR id): `megaampereHours`, `kiloampereHours`, `ampereHours`,
/// `milliampereHours`, `microampereHours`.
extension UnitElectricCharge: UnitIdentifierRepresentable {
    public var unitIdentifier: String? {
        switch self {
        case .coulombs: "coulomb"
        default:        nil
        }
    }

    public static func unit(forIdentifier identifier: String) -> Self? {
        let unit: UnitElectricCharge?
        switch identifier {
        case "coulomb": unit = .coulombs
        default:        unit = nil
        }
        guard let unit else { return nil }
        return unit as? Self
    }
}
