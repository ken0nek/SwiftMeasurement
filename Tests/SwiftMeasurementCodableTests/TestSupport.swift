import Foundation

extension JSONEncoder {
    /// A `JSONEncoder` with `.sortedKeys` for deterministic wire-byte assertions in tests.
    static var sortedKeysForTests: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys]
        return encoder
    }
}
