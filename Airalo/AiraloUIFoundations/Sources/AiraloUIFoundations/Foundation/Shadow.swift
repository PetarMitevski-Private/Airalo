import Foundation
import SwiftUI

public struct Shadow: ViewModifier {
    let color: Color
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat
    
    public func body(content: Content) -> some View {
        content
            .shadow(color: color, radius: radius, x: x, y: y)
    }
}

public extension Shadow {
    static let dropShadow: Shadow = Shadow(color: .dropShadowColor, radius: 30, x: 0, y: 10)
}
