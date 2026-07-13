import Foundation

/// CLDR 48.2 identifiers for `UnitPower`. Unmapped constants (no regular CLDR id):
/// `terawatts`, `microwatts`, `nanowatts`, `picowatts`, `femtowatts`.
extension UnitPower: UnitIdentifierRepresentable {
    public var unitIdentifier: String? {
        switch self {
        case .gigawatts:  "gigawatt"
        case .megawatts:  "megawatt"
        case .kilowatts:  "kilowatt"
        case .watts:      "watt"
        case .milliwatts: "milliwatt"
        case .horsepower: "horsepower"
        default:          nil
        }
    }

    public static func unit(forIdentifier identifier: String) -> Self? {
        let unit: UnitPower?
        switch identifier {
        case "gigawatt":   unit = .gigawatts
        case "megawatt":   unit = .megawatts
        case "kilowatt":   unit = .kilowatts
        case "watt":       unit = .watts
        case "milliwatt":  unit = .milliwatts
        case "horsepower": unit = .horsepower
        default:           unit = nil
        }
        guard let unit else { return nil }
        return unit as? Self
    }
}
