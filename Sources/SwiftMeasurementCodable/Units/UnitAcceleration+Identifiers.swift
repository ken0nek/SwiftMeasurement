import Foundation

/// CLDR 48.2 identifiers for `UnitAcceleration`. All constants are mapped.
extension UnitAcceleration: UnitIdentifierRepresentable {
    public var unitIdentifier: String? {
        switch self {
        case .metersPerSecondSquared: "meter-per-square-second"
        case .gravity:                "g-force"
        default:                      nil
        }
    }

    public static func unit(forIdentifier identifier: String) -> Self? {
        let unit: UnitAcceleration?
        switch identifier {
        case "meter-per-square-second": unit = .metersPerSecondSquared
        case "g-force":                 unit = .gravity
        default:                        unit = nil
        }
        guard let unit else { return nil }
        return unit as? Self
    }
}
