import SwiftUI

struct TextStyle: ViewModifier {
    let font: Font
    let color: Color

    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(color)
    }
}

extension TextStyle {
    static var navigationTitleStyle: TextStyle {
        TextStyle(font: .plexSansSemiBold27, color: .charcoal)
    }
    
    static var titleStyle: TextStyle {
        TextStyle(font: .plexSansSemiBold19, color: .charcoal)
    }
    
    static var bodyStyle: TextStyle {
        TextStyle(font: .plexSansMedium15, color: .charcoal)
    }
}

extension Text {
    func textStyle(textStyle: TextStyle) -> some View {
        self.modifier(TextStyle(font: textStyle.font, color: textStyle.color))
    }
}
