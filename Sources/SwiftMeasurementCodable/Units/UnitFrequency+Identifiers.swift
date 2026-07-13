import Foundation

/// CLDR 48.2 identifiers for `UnitFrequency`. Unmapped constants (no regular CLDR
/// id): `terahertz`, `millihertz`, `microhertz`, `nanohertz`, `framesPerSecond`.
/// `framesPerSecond`'s availability is platform-gated, so it is never referenced in
/// this file's switch cases.
extension UnitFrequency: UnitIdentifierRepresentable {
    public var unitIdentifier: String? {
        switch self {
        case .gigahertz: "gigahertz"
        case .megahertz: "megahertz"
        case .kilohertz: "kilohertz"
        case .hertz:     "hertz"
        default:         nil
        }
    }

    public static func unit(forIdentifier identifier: String) -> Self? {
        let unit: UnitFrequency?
        switch identifier {
        case "gigahertz": unit = .gigahertz
        case "megahertz": unit = .megahertz
        case "kilohertz": unit = .kilohertz
        case "hertz":     unit = .hertz
        default:          unit = nil
        }
        guard let unit else { return nil }
        return unit as? Self
    }
}
