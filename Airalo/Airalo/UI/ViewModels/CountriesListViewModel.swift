import Foundation
import Combine

/// The view model for managing the state of the countries list view.
final class CountriesListViewModel: ObservableObject {
    
    // MARK: - Published Properties

    /// The current state of the countries list view.
    @Published var state: CountriesListViewState = .loading
    
    // MARK: - Initialiser

    /// Initializes the view model with the given response state.
    init(responseState: LocalEsimResponseState) {
        switch responseState {
        case .fetching:
            state = .loading
        case let .success(data):
            state = .ready(data: data.mapToViewDataModel)
        case .error:
            state = .error
        }
    }
}

private extension [LocalEsimResponse] {
    /// Maps an array of `LocalEsimResponse` to a `CountriesListViewDataModel`.
    var mapToViewDataModel: CountriesListViewDataModel {
        let countries = self.map { country in
            CountriesListViewDataModel.CountrySelectableViewDataModel(id: country.id,
                                                                      countryName: country.title,
                                                                      imageUrl: URL(string: country.image.url))
            
        }
        return CountriesListViewDataModel(countries: countries)
    }
}
