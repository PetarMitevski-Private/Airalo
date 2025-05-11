struct PackageResponse: Decodable {
    let id: Int
    let slug: String
    let type: String
    let price: Double
    let title: String
    let data: String
    let validity: String
    let day: Int
    let amount: Int
    let operatorInfo: OperatorResponse

    enum CodingKeys: String, CodingKey {
        case id
        case slug
        case type
        case price
        case title
        case data
        case validity
        case day
        case amount
        case operatorInfo = "operator"
    }
}
