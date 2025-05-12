import Foundation
import SwiftUI

/// A custom `ViewModifier` that applies a shadow effect with customizable parameters.
public struct Shadow: ViewModifier {
    let color: Color
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat
    
    // MARK: - ViewModifier
        
    /// Modifies the content view by applying a shadow effect with the specified properties.
    public func body(content: Content) -> some View {
        content
            .shadow(color: color, radius: radius, x: x, y: y)
    }
}

public extension Shadow {
    /// A predefined shadow configuration with a drop shadow effect.
    static let dropShadow: Shadow = Shadow(color: .dropShadowColor, radius: 30, x: 0, y: 10)
}
