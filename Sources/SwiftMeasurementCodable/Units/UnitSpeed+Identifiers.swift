import Foundation

/// CLDR 48.2 identifiers for `UnitSpeed`. All constants are mapped.
extension UnitSpeed: UnitIdentifierRepresentable {
    public var unitIdentifier: String? {
        switch self {
        case .metersPerSecond:   "meter-per-second"
        case .kilometersPerHour: "kilometer-per-hour"
        case .milesPerHour:      "mile-per-hour"
        case .knots:             "knot"
        default:                 nil
        }
    }

    public static func unit(forIdentifier identifier: String) -> Self? {
        let unit: UnitSpeed?
        switch identifier {
        case "meter-per-second":   unit = .metersPerSecond
        case "kilometer-per-hour": unit = .kilometersPerHour
        case "mile-per-hour":      unit = .milesPerHour
        case "knot":               unit = .knots
        default:                   unit = nil
        }
        guard let unit else { return nil }
        return unit as? Self
    }
}
