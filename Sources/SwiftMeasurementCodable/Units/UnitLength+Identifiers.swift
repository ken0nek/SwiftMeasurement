import Foundation

/// CLDR 48.2 identifiers for `UnitLength`. Unmapped constants (no regular CLDR id):
/// `megameters`, `hectometers`, `decameters`.
extension UnitLength: UnitIdentifierRepresentable {
    public var unitIdentifier: String? {
        switch self {
        case .kilometers:        "kilometer"
        case .meters:            "meter"
        case .decimeters:        "decimeter"
        case .centimeters:       "centimeter"
        case .millimeters:       "millimeter"
        case .micrometers:       "micrometer"
        case .nanometers:        "nanometer"
        case .picometers:        "picometer"
        case .inches:            "inch"
        case .feet:              "foot"
        case .yards:             "yard"
        case .miles:             "mile"
        case .scandinavianMiles: "mile-scandinavian"
        case .lightyears:        "light-year"
        case .nauticalMiles:     "nautical-mile"
        case .fathoms:           "fathom"
        case .furlongs:          "furlong"
        case .astronomicalUnits: "astronomical-unit"
        case .parsecs:           "parsec"
        default:                 nil
        }
    }

    public static func unit(forIdentifier identifier: String) -> Self? {
        let unit: UnitLength?
        switch identifier {
        case "kilometer":         unit = .kilometers
        case "meter":             unit = .meters
        case "decimeter":         unit = .decimeters
        case "centimeter":        unit = .centimeters
        case "millimeter":        unit = .millimeters
        case "micrometer":        unit = .micrometers
        case "nanometer":         unit = .nanometers
        case "picometer":         unit = .picometers
        case "inch":              unit = .inches
        case "foot":              unit = .feet
        case "yard":              unit = .yards
        case "mile":              unit = .miles
        case "mile-scandinavian": unit = .scandinavianMiles
        case "light-year":        unit = .lightyears
        case "nautical-mile":     unit = .nauticalMiles
        case "fathom":            unit = .fathoms
        case "furlong":           unit = .furlongs
        case "astronomical-unit": unit = .astronomicalUnits
        case "parsec":            unit = .parsecs
        default:                  unit = nil
        }
        guard let unit else { return nil }
        return unit as? Self
    }
}
