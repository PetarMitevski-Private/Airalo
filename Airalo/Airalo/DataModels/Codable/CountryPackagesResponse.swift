struct CountryPackagesResponse: Codable, Equatable {
    let id: Int
    let slug: String
    let title: String
    let image: RemoteImage
    let packages: [PackageResponse]
}
