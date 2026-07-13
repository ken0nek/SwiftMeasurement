import Foundation

/// CLDR 48.2 identifiers for `UnitInformationStorage`. Unmapped constants (no
/// regular CLDR id): `nibbles`, `yottabytes`, `zettabytes`, `exabytes`,
/// `yottabits`, `zettabits`, `exabits`, `petabits`. Also unmapped: all 16 binary
/// (IEC) constants — `kibibytes`, `mebibytes`, `gibibytes`, `tebibytes`,
/// `pebibytes`, `exbibytes`, `zebibytes`, `yobibytes`, `kibibits`, `mebibits`,
/// `gibibits`, `tebibits`, `pebibits`, `exbibits`, `zebibits`, `yobibits` — because
/// CLDR's digital-information ids are decimal-only.
extension UnitInformationStorage: UnitIdentifierRepresentable {
    public var unitIdentifier: String? {
        switch self {
        case .bytes:     "byte"
        case .bits:      "bit"
        case .petabytes: "petabyte"
        case .terabytes: "terabyte"
        case .gigabytes: "gigabyte"
        case .megabytes: "megabyte"
        case .kilobytes: "kilobyte"
        case .terabits:  "terabit"
        case .gigabits:  "gigabit"
        case .megabits:  "megabit"
        case .kilobits:  "kilobit"
        default:         nil
        }
    }

    public static func unit(forIdentifier identifier: String) -> Self? {
        let unit: UnitInformationStorage?
        switch identifier {
        case "byte":     unit = .bytes
        case "bit":      unit = .bits
        case "petabyte": unit = .petabytes
        case "terabyte": unit = .terabytes
        case "gigabyte": unit = .gigabytes
        case "megabyte": unit = .megabytes
        case "kilobyte": unit = .kilobytes
        case "terabit":  unit = .terabits
        case "gigabit":  unit = .gigabits
        case "megabit":  unit = .megabits
        case "kilobit":  unit = .kilobits
        default:         unit = nil
        }
        guard let unit else { return nil }
        return unit as? Self
    }
}
