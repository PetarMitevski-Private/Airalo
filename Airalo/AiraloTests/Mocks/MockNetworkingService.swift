import Combine
import Foundation
@testable import Airalo

final class MockNetworkingService: NetworkingServiceType {
    private var stubbedResponses = [API: Result<Data, Error>]()
    private let scheduler: DispatchQueue
    
    init(scheduler: DispatchQueue = .main) {
        self.scheduler = scheduler
    }
    
    func stubSuccess(_ data: Data, for api: API) {
        stubbedResponses[api] = .success(data)
    }
    
    func stubFailure(_ error: Error, for api: API) {
        stubbedResponses[api] = .failure(error)
    }
    
    var fetchLocalESims: AnyPublisher<Data, Error> {
        request(api: .localESims)
    }
    
    func fetchCountryPackages(id: Int) -> AnyPublisher<Data, Error> {
        request(api: .countryPackages(id: id))
    }
    
    private func request(api: API) -> AnyPublisher<Data, Error> {
        guard let result = stubbedResponses[api] else {
            return Fail(error: MockError.unstubbedRequest)
                .eraseToAnyPublisher()
        }
        
        return result.publisher
            .delay(for: .milliseconds(10), scheduler: scheduler) // Simulate network delay
            .eraseToAnyPublisher()
    }
}

enum MockError: Error {
    case unstubbedRequest
    case testError
}

extension AnyPublisher {
    func asyncValues() async throws -> [Output] {
        var values = [Output]()
        var error: Error?
        
        _ = sink(
            receiveCompletion: { completion in
                if case .failure(let e) = completion {
                    error = e
                }
            },
            receiveValue: { values.append($0) }
        )
        
        if let error = error {
            throw error
        }
        return values
    }
}
