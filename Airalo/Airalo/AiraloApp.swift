import SwiftUI
import AiraloUIFoundations

@main
struct AiraloApp: App {
    
    let dependenciesContainer: DependenciesContainerType
    let model: ModelType

    let countriesListViewInteractor: CountriesListViewInteractor
    let packageListViewInteractor: PackageListViewInteractor

    init () {
        dependenciesContainer = DependenciesContainer()
        model = Model(dependenciesContainer: dependenciesContainer)
        
        countriesListViewInteractor = CountriesListViewInteractor(model: model)
        packageListViewInteractor = PackageListViewInteractor(model: model)
        
        registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            CountriesListView()
                .environmentObject(countriesListViewInteractor)
                .environmentObject(packageListViewInteractor)
        }
    }
    
    func registerFonts() {
        CustomFont.allCases.forEach { $0.register() }
    }
}
