import Testing
@testable import Airalo

@Suite
struct APITests {
    @Test func localESimsRequestConfiguration() throws {
        let api = API.localESims
        let request = try api.request()
        
        #expect(request.httpMethod == "GET")
        #expect(request.url?.absoluteString == "https://www.airalo.com/api/v2/countries")
        #expect(request.value(forHTTPHeaderField: "Accept") == "application/json")
        #expect(request.value(forHTTPHeaderField: "Accept-Language") == "en")
        #expect(request.httpBody == nil)
    }

    @Test func countryPackagesRequestConfiguration() throws {
        let testID = 123
        let api = API.countryPackages(id: testID)
        let request = try api.request()
        
        #expect(request.url?.absoluteString == "https://www.airalo.com/api/v2/countries/\(testID)")
        #expect(request.httpMethod == "GET")
        #expect(request.value(forHTTPHeaderField: "Accept") == "application/json")
        #expect(request.value(forHTTPHeaderField: "Accept-Language") == "en")
        #expect(request.httpBody == nil)
    }
}
