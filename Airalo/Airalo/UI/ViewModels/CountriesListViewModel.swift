import Foundation
import Combine

final class CountriesListViewModel: ObservableObject {
    
    @Published var state: CountriesListViewState = .loading
    
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
    var mapToViewDataModel: CountriesListViewDataModel {
        let countries = self.map { country in
            CountriesListViewDataModel.CountrySelectableViewDataModel(id: country.id,
                                                                      countryName: country.title,
                                                                      imageUrl: URL(string: country.image.url))
            
        }
        return CountriesListViewDataModel(countries: countries)
    }
}
