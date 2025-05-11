import Foundation
import Combine

final class NetworkingService: NetworkingServiceType {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    var fetchLocalESims: AnyPublisher<Data, Error> {
        request(api: API.localESims)
    }

    func fetchCountryPackages(id: Int) -> AnyPublisher<Data, Error> {
        request(api: API.countryPackages(id: id))
    }

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
