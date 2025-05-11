import UIKit
import SwiftUI

struct NavigationStackStyler {
    @MainActor static func makeAppearance() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = .white
        coloredAppearance.titleTextAttributes = [.foregroundColor: AiraloUIColor(.charcoal),
                                                 .font: AiraloUIFonts.smallTitleFont]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: AiraloUIColor(.charcoal),
                                                      .font: AiraloUIFonts.largeTitleFont]
        
        let shadowImage = ImageRenderer(content: gradientView)
        coloredAppearance.shadowImage = shadowImage.uiImage
        
        let backButtonAppearance = UIBarButtonItemAppearance(style: .plain)
        backButtonAppearance.focused.titleTextAttributes = [.foregroundColor: UIColor.clear]
        backButtonAppearance.disabled.titleTextAttributes = [.foregroundColor: UIColor.clear]
        backButtonAppearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.clear]
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        
        if var image = UIImage(named: "chevron_left") {
            image = image.withTintColor(AiraloUIColor.charcoal, renderingMode: .alwaysOriginal)
            coloredAppearance.setBackIndicatorImage(image, transitionMaskImage: image)
            coloredAppearance.backButtonAppearance = backButtonAppearance

        }
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
    
    static var gradientView: some View {
        LinearGradient(gradient: Gradient(colors: [.dropShadowColor.opacity(0.3), .clear]),
                       startPoint: .top,
                       endPoint: .bottom)
    }
}
