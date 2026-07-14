import Foundation

/// CLDR 48.2 identifiers for `UnitArea`. Unmapped constants (no regular CLDR id):
/// `squareMegameters`, `squareMillimeters`, `squareMicrometers`,
/// `squareNanometers`, `ares`.
extension UnitArea: UnitIdentifierRepresentable {
    public var unitIdentifier: String? {
        switch self {
        case .squareKilometers:  "square-kilometer"
        case .squareMeters:      "square-meter"
        case .squareCentimeters: "square-centimeter"
        case .squareInches:      "square-inch"
        case .squareFeet:        "square-foot"
        case .squareYards:       "square-yard"
        case .squareMiles:       "square-mile"
        case .acres:             "acre"
        case .hectares:          "hectare"
        default:                 nil
        }
    }

    public static func unit(forIdentifier identifier: String) -> Self? {
        let unit: UnitArea?
        switch identifier {
        case "square-kilometer":  unit = .squareKilometers
        case "square-meter":      unit = .squareMeters
        case "square-centimeter": unit = .squareCentimeters
        case "square-inch":       unit = .squareInches
        case "square-foot":       unit = .squareFeet
        case "square-yard":       unit = .squareYards
        case "square-mile":       unit = .squareMiles
        case "acre":              unit = .acres
        case "hectare":           unit = .hectares
        default:                  unit = nil
        }
        guard let unit else { return nil }
        return unit as? Self
    }
}
