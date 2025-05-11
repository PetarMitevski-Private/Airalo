import Foundation
import Combine

protocol NetworkingServiceType {
    var fetchLocalESims: AnyPublisher<Data, Error> { get }
    func fetchCountryPackages(id: Int) -> AnyPublisher<Data, Error>
}
