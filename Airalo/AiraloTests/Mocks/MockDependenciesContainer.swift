import Combine
import Foundation
@testable import Airalo

final class MockDependenciesContainer: DependenciesContainerType {
    var mockNetworkingService: MockNetworkingService {
        return self.networkingService as! MockNetworkingService
    }
    
    var networkingService: NetworkingServiceType
    
    init(networkingService: NetworkingServiceType = MockNetworkingService()) {
        self.networkingService = networkingService
    }
    
}
