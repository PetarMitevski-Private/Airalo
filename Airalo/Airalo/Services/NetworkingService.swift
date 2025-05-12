import Foundation
import Combine

/// A service class responsible for making network requests related to eSIMs and country packages.
final class NetworkingService: NetworkingServiceType {
    
    // MARK: - Private Properties
    
    /// The session used for making network requests.
    private let session: URLSession
    
    // MARK: - Internal Properties
    
    /// A publisher that fetches local eSIM data.
    var fetchLocalESims: AnyPublisher<Data, Error> {
        request(api: API.localESims)
    }

    // MARK: - Initialiser
    
    /// Initializes a new `NetworkingService` instance.
    init(session: URLSession = .shared) {
        self.session = session
    }

    // MARK: - Internal Methods
    
    /// Fetches country packages data for a specific country.
    func fetchCountryPackages(id: Int) -> AnyPublisher<Data, Error> {
        request(api: API.countryPackages(id: id))
    }

    // MARK: - Private Methods
    
    /// A private method that performs a network request for a given API.
    private func request(api: API) -> AnyPublisher<Data, Error> {
        Result {
            try api.request()
        }
        .publisher
        .flatMap { [weak self] request in
            guard let self else {
                return Empty<Data, Error>().eraseToAnyPublisher()
            }
            return self.session.dataTaskPublisher(for: request)
                .tryMap(\.data)
                .eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
}
