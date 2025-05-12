import Foundation

struct CountriesListViewDataModel: Equatable {
    let countries: [CountrySelectableViewDataModel]
    struct CountrySelectableViewDataModel: Equatable {
        let id: Int
        let countryName: String
        let imageUrl: URL?
    }
}

typealias CountrySelectableViewDataModel = CountriesListViewDataModel.CountrySelectableViewDataModel
