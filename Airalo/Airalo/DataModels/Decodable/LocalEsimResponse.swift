struct LocalEsimResponse: Decodable {
    let id: Int
    let slug: String
    let title: String
    let image: RemoteImage
}
