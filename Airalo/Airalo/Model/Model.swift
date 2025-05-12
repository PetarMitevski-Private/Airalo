import Foundation
import Combine

/// A concrete implementation of the `ModelType` protocol that manages local eSIM
/// and country packages state, as well as handling events.
final class Model: ModelType {
    
    // MARK: - Internal Properties
    
    /// A publisher that emits the state of the local eSIM response.
    var localESimState: AnyPublisher<LocalEsimResponseState, Never> {
        _localESimState.eraseToAnyPublisher()
    }
    
    /// A publisher that emits the state of the country packages response.
    var countryPackagesState: AnyPublisher<CountryPackagesResponseState, Never> {
        _countryPackagesStateSubject.eraseToAnyPublisher()
    }
    
    // MARK: - Private Properties
    
    /// The dependencies container holding the networking service.
    private let dependenciesContainer: DependenciesContainerType
    
    /// A private subject for emitting local eSIM state updates.
    private let _localESimState = PassthroughSubject<LocalEsimResponseState, Never>()
    
    /// A private subject for emitting country package state updates.
    private let _countryPackagesStateSubject = PassthroughSubject<CountryPackagesResponseState, Never>()
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initialiser

    /// Initializes a new instance of `Model` with a specified dependencies container.
    init(dependenciesContainer: DependenciesContainerType) {
        self.dependenciesContainer = dependenciesContainer
        getLocalEsims()
    }
    
    // MARK: - Internal Methods
    
    /// Fetches the state of country packages for a specified country ID.
    func getCountryPackagesState(for countryId: Int) {
        _countryPackagesStateSubject.send(.fetching)
        dependenciesContainer
            .networkingService
            .fetchCountryPackages(id: countryId)
            .decode(type: CountryPackagesResponse.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { [weak self] completion in
                guard let self else { return }
                switch completion {
                case .finished:
                    break
                case .failure:
                    _countryPackagesStateSubject.send(.error)
                }
            }, receiveValue: { [weak self] response in
                guard let self else { return }
                self._countryPackagesStateSubject.send(.success(data: response))
            })
            .store(in: &cancellables)
    }
    
    /// Fetches the state of local eSIMs.
    func getLocalEsims() {
        _localESimState.send(.fetching)
        dependenciesContainer
            .networkingService
            .fetchLocalESims
            .decode(type: [LocalEsimResponse].self, decoder: JSONDecoder())
            .sink(receiveCompletion: { [weak self] completion in
                guard let self else { return }
                switch completion {
                case .finished:
                    break
                case .failure:
                    _localESimState.send(.error)
                }
            }, receiveValue: { [weak self] response in
                guard let self else { return }
                self._localESimState.send(.success(data: response))
            })
            .store(in: &cancellables)
    }
    
    /// Handles different events that can trigger changes in model state.
    func eventOccurred(_ event: Event) {
        switch event {
        case .refreshCountryList:
            getLocalEsims()
        case let .refreshPackagesList(id):
            getCountryPackagesState(for: id)
        case let .clickedBuyPackage(id):
            print("Unimplemented feature, user clicked on Buy Package with id: \(id)")
        }
    }
}
