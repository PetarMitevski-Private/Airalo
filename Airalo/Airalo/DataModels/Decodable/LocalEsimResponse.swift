import Foundation

struct LocalEsimResponse: Decodable {
    let id: Int
    let slug: String
    let title: String
    let image: RemoteImage
    let seo: SEO?
    let packageCount: Int

    enum CodingKeys: String, CodingKey {
        case id, slug, title, image, seo
        case packageCount = "package_count"
    }
}

struct SEO: Decodable {
    let title: String?
    let keywords: String?
    let description: String?
}
