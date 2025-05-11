import SwiftUI

public extension Text {
    func textStyle(textStyle: TextStyle) -> some View {
        self.modifier(TextStyle(font: textStyle.font, color: textStyle.color))
    }
}
