import Foundation

/// CLDR 48.2 identifiers for `UnitPressure`. Unmapped constants (no regular CLDR
/// id): `gigapascals`.
extension UnitPressure: UnitIdentifierRepresentable {
    public var unitIdentifier: String? {
        switch self {
        case .newtonsPerMetersSquared:  "pascal"
        case .megapascals:              "megapascal"
        case .kilopascals:              "kilopascal"
        case .hectopascals:             "hectopascal"
        case .inchesOfMercury:          "inch-ofhg"
        case .bars:                     "bar"
        case .millibars:                "millibar"
        case .millimetersOfMercury:     "millimeter-ofhg"
        case .poundsForcePerSquareInch: "pound-force-per-square-inch"
        default:                        nil
        }
    }

    public static func unit(forIdentifier identifier: String) -> Self? {
        let unit: UnitPressure?
        switch identifier {
        case "pascal":                      unit = .newtonsPerMetersSquared
        case "megapascal":                  unit = .megapascals
        case "kilopascal":                  unit = .kilopascals
        case "hectopascal":                 unit = .hectopascals
        case "inch-ofhg":                   unit = .inchesOfMercury
        case "bar":                         unit = .bars
        case "millibar":                    unit = .millibars
        case "millimeter-ofhg":             unit = .millimetersOfMercury
        case "pound-force-per-square-inch": unit = .poundsForcePerSquareInch
        default:                            unit = nil
        }
        guard let unit else { return nil }
        return unit as? Self
    }
}
