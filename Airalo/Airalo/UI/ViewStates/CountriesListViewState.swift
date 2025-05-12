enum CountriesListViewState: Equatable {
    case loading
    case ready(data: CountriesListViewDataModel)
    case error
}
