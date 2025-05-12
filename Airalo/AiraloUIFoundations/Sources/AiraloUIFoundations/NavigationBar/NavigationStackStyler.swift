import UIKit
import SwiftUI

/// A utility struct to configure the appearance of navigation bars globally across the app.
/// `NavigationStackStyler` customizes the appearance of the navigation bar
struct NavigationStackStyler {

    // MARK: - Appearance Configuration
    
    /// Sets the appearance for navigation bars across the app.
    @MainActor static func makeAppearance() {
        
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = .white
        
        // Title text attributes for standard and large titles
        coloredAppearance.titleTextAttributes = [.foregroundColor: AiraloUIColor(.charcoal),
                                                 .font: AiraloUIFonts.smallTitleFont]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: AiraloUIColor(.charcoal),
                                                      .font: AiraloUIFonts.largeTitleFont]
        
        // Set the gradient shadow image for the navigation bar
        let shadowImage = ImageRenderer(content: gradientView)
        coloredAppearance.shadowImage = shadowImage.uiImage
        
        // Customize the back button appearance
        let backButtonAppearance = UIBarButtonItemAppearance(style: .plain)
        backButtonAppearance.focused.titleTextAttributes = [.foregroundColor: UIColor.clear]
        backButtonAppearance.disabled.titleTextAttributes = [.foregroundColor: UIColor.clear]
        backButtonAppearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.clear]
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        
        // Customizing the back button image
        if var image = UIImage(named: "chevron_left") {
            image = image.withTintColor(AiraloUIColor.charcoal, renderingMode: .alwaysOriginal)
            coloredAppearance.setBackIndicatorImage(image, transitionMaskImage: image)
            coloredAppearance.backButtonAppearance = backButtonAppearance

        }
        
        // Apply the appearance settings to the UINavigationBar globally
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
    
    // MARK: - Gradient View for Shadow Image

    /// A linear gradient view used as the shadow image for the navigation bar.
    private static var gradientView: some View {
        LinearGradient(gradient: Gradient(colors: [.dropShadowColor.opacity(0.3), .clear]),
                       startPoint: .top,
                       endPoint: .bottom)
    }
}
