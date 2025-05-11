enum PackageListViewState {
    case loading
    case ready(data: PackageListViewDataModel)
    case error
}
