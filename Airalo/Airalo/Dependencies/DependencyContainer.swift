/// A concrete implementation of the `DependenciesContainerType` protocol.
///
/// The `DependenciesContainer` class is responsible for providing the
/// necessary dependencies, such as the `NetworkingServiceType`, for
/// other components in the application.
final class DependenciesContainer: DependenciesContainerType {

    /// The networking service instance.
    var networkingService: NetworkingServiceType
    
    /// Initializes a new `DependenciesContainer` and its dependencies.
    init() {
        networkingService = NetworkingService()
    }
}
