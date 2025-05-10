import SwiftUI

struct StyledNavigationStack<Content: View>: View {
    let content: () -> Content
    let title: String
    
    init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.title = title
        NavBarStyling.makeAppearance()
    }
    
    var body: some View {
        NavigationStack {
            content()
                .background(Color.alabasterWhite)
                .navigationTitle("Hello")
        }
    }
}
