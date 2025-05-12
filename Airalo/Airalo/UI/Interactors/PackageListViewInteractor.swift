import Foundation
import SwiftUI
import Combine

/// An interactor that manages the state and logic for the package list view.
final class PackageListViewInteractor: ObservableObject {
        
    // MARK: - Published Properties
    
    /// The view model that holds the current state of the package list view.
    @Published var packageListViewModel: PackageListViewModel = PackageListViewModel(responseState: .fetching)
    
    // MARK: - Private Properties
    
    /// The model used to fetch and manage the package list data.
    private let model: ModelType
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Initialiser

    /// Initializes a new `PackageListViewInteractor` instance.
    init(model: ModelType) {
        self.model = model
    }
    
    // MARK: - Public Methods

    /// Invoked when the package list view appears, triggering a fetch for country package data.
    func didAppear(id: Int) {
        model.getCountryPackagesState(for: id)
        model.countryPackagesState
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.packageListViewModel = PackageListViewModel(responseState: .error)
            } receiveValue: { [weak self] responseState in
                self?.packageListViewModel = PackageListViewModel(responseState: responseState)
            }
            .store(in: &cancellables)
    }
    
    /// Triggers a refresh of the country packages data.
    func refresh(id: Int) {
        model.eventOccurred(.refreshPackagesList(id: id))
    }
    
    /// Handles the event when a user clicks to buy a package.
    func clickedBuyPackage(id: Int) {
        model.eventOccurred(.clickedBuyPackage(id: id))
    }
}
