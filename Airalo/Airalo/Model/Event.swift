enum Event: Equatable {
    case refreshCountryList
    case refreshPackagesList(id: Int)
    case clickedBuyPackage(id: Int)
}
