import Foundation

/// CLDR 48.2 identifiers for `UnitIlluminance`. All constants are mapped.
extension UnitIlluminance: UnitIdentifierRepresentable {
    public var unitIdentifier: String? {
        switch self {
        case .lux: "lux"
        default:   nil
        }
    }

    public static func unit(forIdentifier identifier: String) -> Self? {
        let unit: UnitIlluminance?
        switch identifier {
        case "lux": unit = .lux
        default:    unit = nil
        }
        guard let unit else { return nil }
        return unit as? Self
    }
}
