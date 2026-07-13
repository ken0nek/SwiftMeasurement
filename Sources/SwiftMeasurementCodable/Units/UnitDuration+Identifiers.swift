import Foundation

/// CLDR 48.2 identifiers for `UnitDuration`. Unmapped constants (no regular CLDR
/// id): `picoseconds`.
extension UnitDuration: UnitIdentifierRepresentable {
    public var unitIdentifier: String? {
        switch self {
        case .hours:        "hour"
        case .minutes:      "minute"
        case .seconds:      "second"
        case .milliseconds: "millisecond"
        case .microseconds: "microsecond"
        case .nanoseconds:  "nanosecond"
        default:            nil
        }
    }

    public static func unit(forIdentifier identifier: String) -> Self? {
        let unit: UnitDuration?
        switch identifier {
        case "hour":        unit = .hours
        case "minute":      unit = .minutes
        case "second":      unit = .seconds
        case "millisecond": unit = .milliseconds
        case "microsecond": unit = .microseconds
        case "nanosecond":  unit = .nanoseconds
        default:            unit = nil
        }
        guard let unit else { return nil }
        return unit as? Self
    }
}
