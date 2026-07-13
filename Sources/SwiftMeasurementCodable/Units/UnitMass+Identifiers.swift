import Foundation

/// CLDR 48.2 identifiers for `UnitMass`. Unmapped constants (no regular CLDR id):
/// `decigrams`, `centigrams`, `nanograms`, `picograms`.
extension UnitMass: UnitIdentifierRepresentable {
    public var unitIdentifier: String? {
        switch self {
        case .kilograms:  "kilogram"
        case .grams:      "gram"
        case .milligrams: "milligram"
        case .micrograms: "microgram"
        case .ounces:     "ounce"
        case .pounds:     "pound"
        case .stones:     "stone"
        case .metricTons: "tonne"
        case .shortTons:  "ton"
        case .carats:     "carat"
        case .ouncesTroy: "ounce-troy"
        case .slugs:      "slug"
        default:          nil
        }
    }

    public static func unit(forIdentifier identifier: String) -> Self? {
        let unit: UnitMass?
        switch identifier {
        case "kilogram":   unit = .kilograms
        case "gram":       unit = .grams
        case "milligram":  unit = .milligrams
        case "microgram":  unit = .micrograms
        case "ounce":      unit = .ounces
        case "pound":      unit = .pounds
        case "stone":      unit = .stones
        case "tonne":      unit = .metricTons
        case "ton":        unit = .shortTons
        case "carat":      unit = .carats
        case "ounce-troy": unit = .ouncesTroy
        case "slug":       unit = .slugs
        default:           unit = nil
        }
        guard let unit else { return nil }
        return unit as? Self
    }
}
