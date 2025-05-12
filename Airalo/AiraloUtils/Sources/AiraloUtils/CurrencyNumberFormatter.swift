import Foundation

/// A utility struct for formatting currency values as strings.
/// Uses the US English locale and always formats with two fraction digits.
public struct CurrencyNumberFormatter {
    private let formatter: NumberFormatter

    /// Initializes a new `CurrencyNumberFormatter` instance.
    public init() {
        formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
    }

    /// Converts a `Double` value into a currency-formatted `String`.
    /// String formatted as currency (e.g., `$19.99`). Returns `$0.00` if formatting fails.
    public func string(from value: Double) -> String {
        return formatter.string(from: NSNumber(value: value)) ?? "$0.00"
    }
}
