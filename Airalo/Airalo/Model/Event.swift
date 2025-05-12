/// An enumeration representing different events that can trigger changes in model state.
enum Event: Equatable {
    
    /// An event to trigger the refreshing of the country list.
    case refreshCountryList
    
    /// An event to trigger the refreshing of the country packages list for a specific country.
    case refreshPackagesList(id: Int)
    
    /// An event triggered when the user clicks the "Buy Package" button for a specific package.
    case clickedBuyPackage(id: Int)
}
