import Foundation

struct CountriesListViewDataModel {
    let countries: [CountrySelectableViewDataModel]
    struct CountrySelectableViewDataModel {
        let id: Int
        let countryName: String
        let imageUrl: URL?
    }
}

typealias CountrySelectableViewDataModel = CountriesListViewDataModel.CountrySelectableViewDataModel
