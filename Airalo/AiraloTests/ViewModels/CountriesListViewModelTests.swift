import XCTest
@testable import Airalo

final class CountriesListViewModelTests: XCTestCase {
    
    func test_init_withFetching_setsLoadingState() {
        let inputState: LocalEsimResponseState = .fetching
        
        let viewModel = CountriesListViewModel(responseState: inputState)
        
        XCTAssertEqual(viewModel.state, .loading)
    }
    
    func test_init_withError_setsErrorState() {
        let inputState: LocalEsimResponseState = .error
        
        let viewModel = CountriesListViewModel(responseState: inputState)
        
        XCTAssertEqual(viewModel.state, .error)
    }
    
    func test_init_withSuccess_setsReadyState_withCorrectData() {
        let mockCountries: [LocalEsimResponse] = [
            LocalEsimResponse(id: 1, slug: "france", title: "France", image: .init(url: "https://example.com/fr.png")),
            LocalEsimResponse(id: 2, slug: "germany", title: "Germany", image: .init(url: "https://example.com/de.png"))
        ]
        let inputState: LocalEsimResponseState = .success(data: mockCountries)
        
        let viewModel = CountriesListViewModel(responseState: inputState)
        
        guard case let .ready(data) = viewModel.state else {
            return XCTFail("Expected .ready state, got \(viewModel.state)")
        }
        
        XCTAssertEqual(data.countries.count, 2)
        XCTAssertEqual(data.countries[0].id, 1)
        XCTAssertEqual(data.countries[0].countryName, "France")
        XCTAssertEqual(data.countries[0].imageUrl?.absoluteString, "https://example.com/fr.png")
    }
}
