import Foundation

/// CLDR 48.2 identifiers for `UnitAngle`. Unmapped constants (no regular CLDR id):
/// `gradians`.
extension UnitAngle: UnitIdentifierRepresentable {
    public var unitIdentifier: String? {
        switch self {
        case .degrees:     "degree"
        case .arcMinutes:  "arc-minute"
        case .arcSeconds:  "arc-second"
        case .radians:     "radian"
        case .revolutions: "revolution"
        default:           nil
        }
    }

    public static func unit(forIdentifier identifier: String) -> Self? {
        let unit: UnitAngle?
        switch identifier {
        case "degree":     unit = .degrees
        case "arc-minute": unit = .arcMinutes
        case "arc-second": unit = .arcSeconds
        case "radian":     unit = .radians
        case "revolution": unit = .revolutions
        default:           unit = nil
        }
        guard let unit else { return nil }
        return unit as? Self
    }
}
