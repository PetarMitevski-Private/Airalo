import Combine

/// A protocol that defines the structure of a model that handles state and events.
protocol ModelType  {
    
    /// A publisher that emits the state of the local eSIM response.
    var localESimState: AnyPublisher<LocalEsimResponseState, Never> { get }
    
    /// A publisher that emits the state of the country packages response.
    var countryPackagesState: AnyPublisher<CountryPackagesResponseState, Never> { get }
    
    /// Fetches the current state of country packages for a specific country.
    func getCountryPackagesState(for countryId: Int)
    
    /// Handles an event that can trigger changes to the model state.
    func eventOccurred(_ event: Event)
}
