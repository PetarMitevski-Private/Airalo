import UIKit

struct NavBarStyling {
    @MainActor static func makeAppearance() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = .white
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor(.charcoal),
                                                 .font: UIFont.smallTitleFont]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(.charcoal),
                                                      .font: UIFont.largeTitleFont]
        
        coloredAppearance.shadowImage = UIImage()
        coloredAppearance.shadowColor = .clear
        
        
        let backButtonAppearance = UIBarButtonItemAppearance(style: .plain)
        backButtonAppearance.focused.titleTextAttributes = [.foregroundColor: UIColor.clear]
        backButtonAppearance.disabled.titleTextAttributes = [.foregroundColor: UIColor.clear]
        backButtonAppearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.clear]
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        
        if var image = UIImage(named: "chevron_left") {
            image = image.withTintColor(.charcoal, renderingMode: .alwaysOriginal)
            coloredAppearance.setBackIndicatorImage(image, transitionMaskImage: image)
            coloredAppearance.backButtonAppearance = backButtonAppearance

        }
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
}
