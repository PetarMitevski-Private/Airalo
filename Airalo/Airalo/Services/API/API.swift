import Foundation

enum API: Hashable {
    case localESims
    case countryPackages(id: Int)
    
    
    private var httpMethod: String { "GET" }
    private var baseURL: String { "https://www.airalo.com/api/v2/" }
    private var contentType: String { "application/json" }
    private var language: String { "en" }
    
    private var path: String {
        switch self {
        case .localESims:
            return "countries"
        case let .countryPackages(id):
            return "countries/\(id)"
        }
    }
    
    private var headers: [String: String] {
        [
            "Accept": contentType,
            "Accept-Language": language
        ]
    }
    
    func request() throws -> URLRequest {
        guard let url = URLComponents(string: baseURL + path)?.url else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        
        for (headerField, value) in headers {
            request.setValue(value, forHTTPHeaderField: headerField)
        }
        
        return request
    }
}
