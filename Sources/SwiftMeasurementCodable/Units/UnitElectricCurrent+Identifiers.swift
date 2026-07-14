import Foundation

/// CLDR 48.2 identifiers for `UnitElectricCurrent`. Unmapped constants (no regular
/// CLDR id): `megaamperes`, `kiloamperes`, `microamperes`.
extension UnitElectricCurrent: UnitIdentifierRepresentable {
    public var unitIdentifier: String? {
        switch self {
        case .amperes:      "ampere"
        case .milliamperes: "milliampere"
        default:            nil
        }
    }

    public static func unit(forIdentifier identifier: String) -> Self? {
        let unit: UnitElectricCurrent?
        switch identifier {
        case "ampere":      unit = .amperes
        case "milliampere": unit = .milliamperes
        default:            unit = nil
        }
        guard let unit else { return nil }
        return unit as? Self
    }
}
