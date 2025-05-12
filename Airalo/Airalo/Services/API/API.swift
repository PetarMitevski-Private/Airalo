import Foundation

/// An enumeration representing different API endpoints used in the application.
enum API: Hashable {
    
    /// Represents the endpoint for fetching local eSIM data.
    case localESims
    
    /// Represents the endpoint for fetching country packages data for a specific country.
    case countryPackages(id: Int)
    
    // MARK: - Private Properties
    
    /// The HTTP method used for requests.
    private var httpMethod: String { "GET" }
    
    /// The base URL for the Airalo API.
    private var baseURL: String { "https://www.airalo.com/api/v2/" }
    
    /// The content type accepted by the API.
    private var contentType: String { "application/json" }
    
    /// The language for the request.
    private var language: String { "en" }
    
    /// The path appended to the base URL depending on the API case.
    private var path: String {
        switch self {
        case .localESims:
            return "countries"
        case let .countryPackages(id):
            return "countries/\(id)"
        }
    }
    
    /// The HTTP headers required for the API request.
    private var headers: [String: String] {
        [
            "Accept": contentType,
            "Accept-Language": language
        ]
    }
    
    // MARK: - Public Methods

    /// Constructs and returns a URLRequest for the specific API endpoint.
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
