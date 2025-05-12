import SwiftUI

/// A custom `ViewModifier` to apply a specific font and color style to text.
public struct TextStyle: ViewModifier {
    
    // MARK: - Internal Properties
    
    let font: Font
    let color: Color

    // MARK: - ViewModifier
    
    /// Modifies the content view by applying the specified font and color style.
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
