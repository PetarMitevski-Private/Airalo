import SwiftUI

public struct AiraloNavigationStack<Content: View>: View {
    let content: () -> Content
    let title: String
    
    public init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.title = title
        NavigationStackStyler.makeAppearance()
    }
    
    public var body: some View {
        NavigationStack {
            content()
                .background(AiraloColor.alabasterWhite)
                .navigationTitle(title)
        }
    }
}
