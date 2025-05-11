import Testing
@testable import AiraloUtils

@Suite struct CurrencyNumberFormatterTests {
    var formatter: CurrencyNumberFormatter

    init() {
        formatter = CurrencyNumberFormatter()
    }

    @Test
    func testFormattingPositiveValue() {
        let result = formatter.string(from: 1234.56)
        #expect(result == "$1,234.56")
    }

    @Test
    func testFormattingZero() {
        let result = formatter.string(from: 0)
        #expect(result == "$0.00")
    }

    @Test
    func testFormattingNegativeValue() {
        let result = formatter.string(from: -42.5)
        #expect(result == "-$42.50")
    }

    @Test
    func testFormattingRounding() {
        let result = formatter.string(from: 2.345)
        #expect(result == "$2.34")
    }

    @Test
    func testFormattingLargeNumber() {
        let result = formatter.string(from: 1_000_000.99)
        #expect(result == "$1,000,000.99")
    }

    @Test
    func testFormattingSmallFraction() {
        let result = formatter.string(from: 0.004)
        #expect(result == "$0.00")
    }
}
