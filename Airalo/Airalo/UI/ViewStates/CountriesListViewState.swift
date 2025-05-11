enum CountriesListViewState {
    case loading
    case ready(data: CountriesListViewDataModel)
    case error
}
