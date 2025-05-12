import SwiftUI

/// A custom `ViewModifier` that adds a shimmering effect to a view.
struct Shimmer: ViewModifier {
    
    /// A flag to track the initial state of the shimmer effect.
    @State private var isInitialState: Bool = true
    
    // MARK: - ViewModifier
    
    /// Modifies the content view by applying a shimmering effect.
    func body(content: Content) -> some View {
        content
            .mask {
                LinearGradient(
                    gradient: .init(colors: [.black.opacity(0.2), .white.opacity(0.5), .black.opacity(0.2)]),
                    startPoint: (isInitialState ? .startPointInitialState : .startPointFinalState),
                    endPoint: (isInitialState ? .endPointInitialState : .endPointFinalState)
                )
            }
            .animation(.linear(duration: 1).delay(0.25).repeatForever(autoreverses: false), value: isInitialState)
            .onAppear() {
                isInitialState = false
            }
    }
}

private extension UnitPoint {
    static let startPointInitialState: UnitPoint = .init(x: -0.3, y: -0.3)
    static let endPointInitialState: UnitPoint = .init(x: 0, y: 0)
    static let startPointFinalState: UnitPoint = .init(x: 1, y: 1)
    static let endPointFinalState: UnitPoint = .init(x: 1.3, y: 1.3)
}
