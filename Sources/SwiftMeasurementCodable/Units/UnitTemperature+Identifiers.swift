import Foundation

/// CLDR 48.2 identifiers for `UnitTemperature`. All constants are mapped.
extension UnitTemperature: UnitIdentifierRepresentable {
    public var unitIdentifier: String? {
        switch self {
        case .kelvin:     "kelvin"
        case .celsius:    "celsius"
        case .fahrenheit: "fahrenheit"
        default:          nil
        }
    }

    public static func unit(forIdentifier identifier: String) -> Self? {
        let unit: UnitTemperature?
        switch identifier {
        case "kelvin":     unit = .kelvin
        case "celsius":    unit = .celsius
        case "fahrenheit": unit = .fahrenheit
        default:           unit = nil
        }
        guard let unit else { return nil }
        return unit as? Self
    }
}
