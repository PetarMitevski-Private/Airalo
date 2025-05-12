import Foundation
import Combine

final class Model: ModelType {
    
    var localESimState: AnyPublisher<LocalEsimResponseState, Never> {
        _localESimState.eraseToAnyPublisher()
    }
    
    var countryPackagesState: AnyPublisher<CountryPackagesResponseState, Never> {
        _countryPackagesStateSubject.eraseToAnyPublisher()
    }
    
    private let dependenciesContainer: DependenciesContainerType
    private let _localESimState = PassthroughSubject<LocalEsimResponseState, Never>()
    private let _countryPackagesStateSubject = PassthroughSubject<CountryPackagesResponseState, Never>()
    private var cancellables = Set<AnyCancellable>()


    init(dependenciesContainer: DependenciesContainerType) {
        self.dependenciesContainer = dependenciesContainer
        getLocalEsims()
    }
    
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
