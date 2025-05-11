struct LocalEsimResponse: Codable, Equatable {
    let id: Int
    let slug: String
    let title: String
    let image: RemoteImage
}
