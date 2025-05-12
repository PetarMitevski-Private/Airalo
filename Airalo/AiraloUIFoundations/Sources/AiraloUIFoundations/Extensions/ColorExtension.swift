import SwiftUI

///This is an extension for the `Color` struct that allows you to initialize a `Color` object using a
///hexadecimal color string (e.g., #RRGGBB format).
public extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex.trimmingCharacters(in: .whitespacesAndNewlines))
        var hexNumber: UInt64 = 0

        if scanner.string.hasPrefix("#") {
            scanner.currentIndex = scanner.string.index(after: scanner.string.startIndex)
        }

        if scanner.scanHexInt64(&hexNumber) {
            let r = Double((hexNumber & 0xFF0000) >> 16) / 255
            let g = Double((hexNumber & 0x00FF00) >> 8) / 255
            let b = Double(hexNumber & 0x0000FF) / 255

            self.init(red: r, green: g, blue: b)
            return
        }

        self = Color.clear
    }
}
