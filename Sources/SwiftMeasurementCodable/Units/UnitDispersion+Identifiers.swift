import Foundation

/// CLDR 48.2 identifiers for `UnitDispersion`. All constants are mapped.
extension UnitDispersion: UnitIdentifierRepresentable {
    public var unitIdentifier: String? {
        switch self {
        case .partsPerMillion: "part-per-1e6"
        default:               nil
        }
    }

    public static func unit(forIdentifier identifier: String) -> Self? {
        let unit: UnitDispersion?
        switch identifier {
        case "part-per-1e6": unit = .partsPerMillion
        default:             unit = nil
        }
        guard let unit else { return nil }
        return unit as? Self
    }
}
