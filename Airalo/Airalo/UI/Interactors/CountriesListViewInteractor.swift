import Foundation
import SwiftUI
import Combine

/// An interactor that manages the state and logic for the countries list view.
final class CountriesListViewInteractor: ObservableObject {

    // MARK: - Published Properties
    
    /// The view model that holds the current state of the countries list view.
    @Published var countriesListViewModel: CountriesListViewModel = CountriesListViewModel(responseState: .fetching)

    // MARK: - Private Properties

    /// The model used to fetch and manage the eSIM data.
    private let model: ModelType
    
    /// A set used to store cancellables for Combine subscriptions.
    private var cancellables: Set<AnyCancellable> = []

    // MARK: - Initialiser

    /// Initializes a new `CountriesListViewInteractor` instance.
    init(model: ModelType) {
        self.model = model
        configureBindings()
    }

    // MARK: - Private Methods

    /// Configures the bindings for receiving updates from the model.
    private func configureBindings() {
        model
            .localESimState
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.countriesListViewModel = CountriesListViewModel(responseState: .error)
            } receiveValue: { [weak self] responseState in
                self?.countriesListViewModel = CountriesListViewModel(responseState: responseState)
            }
            .store(in: &cancellables)
    }
    
    /// Triggers a refresh of the countries list data.
    func refresh() {
        model.eventOccurred(.refreshCountryList)
    }
}
