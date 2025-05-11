import Foundation
import SwiftUI
import Combine

final class CountriesListViewInteractor: ObservableObject {

    // MARK: - Published Properties

    @Published var countriesListViewModel: CountriesListViewModel = CountriesListViewModel(responseState: .fetching)

    // MARK: - Private Properties

    private let model: ModelType
    private var cancellables: Set<AnyCancellable> = []

    // MARK: - Initialiser

    init(model: ModelType) {
        self.model = model
        configureBindings()
    }

    // MARK: - Private Methods

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
    
    func refresh() {
        model.eventOccurred(.refreshCountryList)
    }
}
