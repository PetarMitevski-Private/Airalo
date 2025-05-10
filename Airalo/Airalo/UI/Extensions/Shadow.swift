//color: Color = Color(.sRGBLinear, white: 0, opacity: 0.33), radius: CGFloat, x: CGFloat = 0, y: CGFloat = 0
import Foundation
import SwiftUI

struct Shadow: ViewModifier {
    let color: Color
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat
    
    func body(content: Content) -> some View {
        content
            .shadow(color: color, radius: radius, x: x, y: y)
    }
}

extension Shadow {
    static let dropShadow: Shadow = Shadow(color: .dropShadowColor, radius: 30, x: 0, y: 10)
}

extension View {
    func shadow(_ shadow: Shadow) -> some View {
        modifier(shadow)
    }
}
