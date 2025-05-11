import SwiftUI

public extension View {
    func shimmering() -> some View {
        modifier(Shimmer())
    }
}
