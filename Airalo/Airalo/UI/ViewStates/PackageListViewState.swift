enum PackageListViewState: Equatable {
    case loading
    case ready(data: PackageListViewDataModel)
    case error
}
