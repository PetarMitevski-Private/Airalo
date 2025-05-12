/// A protocol that defines the required dependencies for a service container.
protocol DependenciesContainerType {
    /// The networking service dependency.
    ///
    /// This property provides access to the networking service, which
    /// is expected to conform to the `NetworkingServiceType` protocol.
    /// It is used for making network requests and handling responses.
    var networkingService: NetworkingServiceType { get }
}
