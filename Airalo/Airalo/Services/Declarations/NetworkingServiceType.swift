import Foundation
import Combine

/// A protocol defining the required methods and properties for a networking service.
protocol NetworkingServiceType {
    
    /// A publisher that fetches local eSIM data.
    var fetchLocalESims: AnyPublisher<Data, Error> { get }
    
    /// Fetches country packages data for a specific country.
    func fetchCountryPackages(id: Int) -> AnyPublisher<Data, Error>
}
