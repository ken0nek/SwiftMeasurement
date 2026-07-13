import Foundation

/// CLDR 48.2 identifiers for `UnitVolume`. Unmapped constants (no regular CLDR id):
/// `kiloliters`, `cubicDecimeters`, `cubicMillimeters`, `imperialTeaspoons`,
/// `imperialTablespoons`. `cups` is also deliberately unmapped: Foundation's `cups`
/// is the 240 mL US legal cup, while CLDR's `cup` is the 236.588 mL customary cup —
/// the conversion factors disagree, so mapping them would be wrong.
extension UnitVolume: UnitIdentifierRepresentable {
    public var unitIdentifier: String? {
        switch self {
        case .megaliters:          "megaliter"
        case .liters:              "liter"
        case .deciliters:          "deciliter"
        case .centiliters:         "centiliter"
        case .milliliters:         "milliliter"
        case .cubicKilometers:     "cubic-kilometer"
        case .cubicMeters:         "cubic-meter"
        case .cubicCentimeters:    "cubic-centimeter"
        case .cubicInches:         "cubic-inch"
        case .cubicFeet:           "cubic-foot"
        case .cubicYards:          "cubic-yard"
        case .cubicMiles:          "cubic-mile"
        case .acreFeet:            "acre-foot"
        case .bushels:             "bushel"
        case .teaspoons:           "teaspoon"
        case .tablespoons:         "tablespoon"
        case .fluidOunces:         "fluid-ounce"
        case .pints:               "pint"
        case .quarts:              "quart"
        case .gallons:             "gallon"
        case .imperialFluidOunces: "fluid-ounce-imperial"
        case .imperialPints:       "pint-imperial"
        case .imperialQuarts:      "quart-imperial"
        case .imperialGallons:     "gallon-imperial"
        case .metricCups:          "cup-metric"
        default:                   nil
        }
    }

    public static func unit(forIdentifier identifier: String) -> Self? {
        let unit: UnitVolume?
        switch identifier {
        case "megaliter":            unit = .megaliters
        case "liter":                unit = .liters
        case "deciliter":            unit = .deciliters
        case "centiliter":           unit = .centiliters
        case "milliliter":           unit = .milliliters
        case "cubic-kilometer":      unit = .cubicKilometers
        case "cubic-meter":          unit = .cubicMeters
        case "cubic-centimeter":     unit = .cubicCentimeters
        case "cubic-inch":           unit = .cubicInches
        case "cubic-foot":           unit = .cubicFeet
        case "cubic-yard":           unit = .cubicYards
        case "cubic-mile":           unit = .cubicMiles
        case "acre-foot":            unit = .acreFeet
        case "bushel":               unit = .bushels
        case "teaspoon":             unit = .teaspoons
        case "tablespoon":           unit = .tablespoons
        case "fluid-ounce":          unit = .fluidOunces
        case "pint":                 unit = .pints
        case "quart":                unit = .quarts
        case "gallon":               unit = .gallons
        case "fluid-ounce-imperial": unit = .imperialFluidOunces
        case "pint-imperial":        unit = .imperialPints
        case "quart-imperial":       unit = .imperialQuarts
        case "gallon-imperial":      unit = .imperialGallons
        case "cup-metric":           unit = .metricCups
        default:                     unit = nil
        }
        guard let unit else { return nil }
        return unit as? Self
    }
}
