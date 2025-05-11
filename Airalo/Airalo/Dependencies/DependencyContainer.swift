final class DependenciesContainer: DependenciesContainerType {

    var networkingService: NetworkingServiceType

    init() {
        networkingService = NetworkingService()
    }
}
