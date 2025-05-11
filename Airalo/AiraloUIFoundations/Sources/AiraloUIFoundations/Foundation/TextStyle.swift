import SwiftUI

public struct TextStyle: ViewModifier {
    let font: Font
    let color: Color

    public func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(color)
    }
}

public extension TextStyle {
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
