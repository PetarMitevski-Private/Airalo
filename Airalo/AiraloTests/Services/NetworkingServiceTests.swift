import XCTest
import Foundation
import Combine
@testable import Airalo

final class NetworkingServiceTests: XCTest {
    
    private var cancellables: Set<AnyCancellable> = []
    private var service: NetworkingService!
    
    override func setUp() {
        super.setUp()
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: config)
        service = NetworkingService(session: session)
    }
    
    override func tearDown() {
        cancellables.removeAll()
        MockURLProtocol.requestHandler = nil
        service = nil
        super.tearDown()
    }
    
    func test_fetchLocalESims_returnsExpectedJSON() {
        let jsonData = try! JSONLoader.shared.loadJSON(named: "LocalESimResponse")
        MockURLProtocol.requestHandler = { _ in
            let response = HTTPURLResponse(url: URL(string: "https://api.example.com")!,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: nil)!
            return (response, jsonData)
        }

        let expectation = XCTestExpectation(description: "fetchLocalESims returns correct data")

        service.fetchLocalESims
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    XCTFail("Expected success but got failure: \(error)")
                }
            }, receiveValue: { data in
                XCTAssertFalse(data.isEmpty, "Expected non-empty data")
                expectation.fulfill()
            })
            .store(in: &cancellables)
    }
    
    func test_countryPackages_returnsExpectedJSON() {
        let jsonData = try! JSONLoader.shared.loadJSON(named: "CountryPackagesResponse")
        MockURLProtocol.requestHandler = { _ in
            let response = HTTPURLResponse(url: URL(string: "https://api.example.com")!,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: nil)!
            return (response, jsonData)
        }

        let expectation = XCTestExpectation(description: "fetchCountryPackages returns correct data")

        service.fetchCountryPackages(id: 195)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    XCTFail("Expected success but got failure: \(error)")
                }
            }, receiveValue: { data in
                XCTAssertFalse(data.isEmpty, "Expected non-empty data")
                expectation.fulfill()
            })
            .store(in: &cancellables)
    }
}
