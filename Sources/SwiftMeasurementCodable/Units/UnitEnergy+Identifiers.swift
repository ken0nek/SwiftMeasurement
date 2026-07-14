import Foundation

/// CLDR 48.2 identifiers for `UnitEnergy`. All constants are mapped.
extension UnitEnergy: UnitIdentifierRepresentable {
    public var unitIdentifier: String? {
        switch self {
        case .kilojoules:    "kilojoule"
        case .joules:        "joule"
        case .kilocalories:  "kilocalorie"
        case .calories:      "calorie"
        case .kilowattHours: "kilowatt-hour"
        default:             nil
        }
    }

    public static func unit(forIdentifier identifier: String) -> Self? {
        let unit: UnitEnergy?
        switch identifier {
        case "kilojoule":     unit = .kilojoules
        case "joule":         unit = .joules
        case "kilocalorie":   unit = .kilocalories
        case "calorie":       unit = .calories
        case "kilowatt-hour": unit = .kilowattHours
        default:              unit = nil
        }
        guard let unit else { return nil }
        return unit as? Self
    }
}
