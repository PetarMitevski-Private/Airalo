import Combine

protocol ModelType  {
    var localESimState: AnyPublisher<LocalEsimResponseState, Never> { get }
    
    var countryPackagesStateSubject: AnyPublisher<CountryPackagesResponseState, Never> { get }
    
    func getCountryPackagesState(for countryId: Int)
    
    func eventOccurred(_ event: Event)
}
