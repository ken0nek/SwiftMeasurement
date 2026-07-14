import Foundation

/// A `Dimension` subclass whose units map to CLDR core unit identifiers.
///
/// CLDR core unit identifiers (`"gram"`, `"celsius"`, `"kilometer-per-hour"`) are
/// locale-neutral, standardized strings — the same vocabulary JavaScript's
/// `Intl.NumberFormat` accepts — making them suitable as a stable wire format,
/// unlike display symbols (`"g"`, `"°C"`) or Foundation's built-in `Measurement`
/// encoding. Identifiers follow CLDR 48.2 (`idStatus='regular'` only).
///
/// Conform your own `Dimension` subclass by switching over its units in both
/// directions:
///
/// ```swift
/// extension UnitCaffeine: UnitIdentifierRepresentable {
///     public var unitIdentifier: String? {
///         switch self {
///         case .milligrams: "milligram-caffeine"
///         default:          nil
///         }
///     }
///
///     public static func unit(forIdentifier identifier: String) -> Self? {
///         let unit: UnitCaffeine?
///         switch identifier {
///         case "milligram-caffeine": unit = .milligrams
///         default:                   unit = nil
///         }
///         guard let unit else { return nil }
///         return unit as? Self
///     }
/// }
/// ```
///
/// The trailing `as? Self` cast is required because Foundation's unit classes are
/// non-final; for a subclass of the conforming class the cast fails and the lookup
/// correctly returns `nil`. Note that Foundation compares `Dimension` units by both
/// symbol and converter, so a custom unit matches a standard constant's `switch` case
/// only when both its symbol and its converter are identical to that constant's; a
/// unit with a standard symbol but a different converter falls through to `nil`.
public protocol UnitIdentifierRepresentable: Dimension {
    /// The CLDR core unit identifier for this unit (e.g. `"gram"`),
    /// or `nil` if this unit has no CLDR identifier.
    var unitIdentifier: String? { get }

    /// The unit for a CLDR core unit identifier,
    /// or `nil` if this unit type does not recognize the identifier.
    static func unit(forIdentifier identifier: String) -> Self?
}
