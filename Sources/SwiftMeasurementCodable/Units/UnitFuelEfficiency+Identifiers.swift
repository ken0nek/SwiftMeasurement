import Foundation

/// CLDR 48.2 identifiers for `UnitFuelEfficiency`. All constants are mapped.
extension UnitFuelEfficiency: UnitIdentifierRepresentable {
    public var unitIdentifier: String? {
        switch self {
        case .litersPer100Kilometers: "liter-per-100-kilometer"
        case .milesPerGallon:         "mile-per-gallon"
        case .milesPerImperialGallon: "mile-per-gallon-imperial"
        default:                      nil
        }
    }

    public static func unit(forIdentifier identifier: String) -> Self? {
        let unit: UnitFuelEfficiency?
        switch identifier {
        case "liter-per-100-kilometer":  unit = .litersPer100Kilometers
        case "mile-per-gallon":          unit = .milesPerGallon
        case "mile-per-gallon-imperial": unit = .milesPerImperialGallon
        default:                         unit = nil
        }
        guard let unit else { return nil }
        return unit as? Self
    }
}
