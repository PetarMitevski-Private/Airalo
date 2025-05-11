import SwiftUI

public extension View {
    func shadow(_ shadow: Shadow) -> some View {
        modifier(shadow)
    }
}
