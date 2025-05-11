import Foundation

public struct CurrencyNumberFormatter {
    private let formatter: NumberFormatter

    public init() {
        formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
    }

    public func string(from value: Double) -> String {
        return formatter.string(from: NSNumber(value: value)) ?? "$0.00"
    }
}
