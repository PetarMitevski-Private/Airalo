import Foundation
import CoreText

class FontsRegistrar {
    static func registerFont(_ font: CustomFont) {
        guard let url = Bundle.module.url(forResource: font.rawValue, withExtension: font.ext) else { return }
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error) {
            guard let error else { return }
            print(error.takeUnretainedValue())
        }
    }
}
