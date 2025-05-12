import SwiftUI

/// A custom navigation stack component for managing navigation in a SwiftUI view hierarchy.
public struct AiraloNavigationStack<Content: View>: View {
    
    // MARK: - Properties
        
    /// A closure that provides the content for the view hierarchy inside the navigation stack.
    let content: () -> Content
    
    /// The title to display in the navigation bar.
    let title: String
    
    // MARK: - Initialiser
    
    /// Initializes the `AiraloNavigationStack` with a title and a content closure.
    public init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.title = title
        
        /// Custom appearance styling for the navigation stack (via `NavigationStackStyler`).
        NavigationStackStyler.makeAppearance()
    }
    
    // MARK: - Body
    
    public var body: some View {
        NavigationStack {
            content()
                .background(AiraloColor.alabasterWhite)
                .navigationTitle(title)
        }
    }
}
