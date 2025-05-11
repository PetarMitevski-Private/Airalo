struct OperatorResponse: Codable, Equatable {
    let id: Int
    let title: String
    let style: String
    let gradientStart: String
    let gradientEnd: String
    let type: String
    let image: RemoteImage
    let countries: [CountryResponse]

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case style
        case gradientStart = "gradient_start"
        case gradientEnd = "gradient_end"
        case type
        case image
        case countries
    }
}
