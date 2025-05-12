import Foundation
import Combine
import SwiftUI
import AiraloUtils

/// The view model for managing the state of the package list view.
final class PackageListViewModel: ObservableObject {
    
    // MARK: - Published Properties

    /// The current state of the package list view.
    @Published var state: PackageListViewState = .loading
    
    // MARK: - Initialiser

    /// Initializes the view model with the given response state.
    init(responseState: CountryPackagesResponseState) {
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

private extension CountryPackagesResponse {
    /// Maps a `CountryPackagesResponse` to a `PackageListViewDataModel`.
    var mapToViewDataModel: PackageListViewDataModel {
        let packageViewDataModel = self.packages.map { package in
            let price = CurrencyNumberFormatter().string(from: package.price)
            let style: PackageListViewDataModel.PackageViewDataModel.Style = {
                switch package.operatorInfo.style {
                case "light":
                    return .light
                default:
                    return .dark
                }
            }()
            
            return PackageViewDataModel(id: package.id,
                                        name: package.operatorInfo.title,
                                        countryName: package.operatorInfo.countries.first?.title ?? package.title,
                                        data: package.data,
                                        validity: package.validity,
                                        imageUrl: URL(string: package.operatorInfo.image.url),
                                        price: price,
                                        startColor: Color(hex: package.operatorInfo.gradientStart),
                                        endColor: Color(hex: package.operatorInfo.gradientEnd),
                                        style: style)
        }
        
        return PackageListViewDataModel(id: self.id,
                                        title: self.title,
                                        packages: packageViewDataModel)
    }
}
