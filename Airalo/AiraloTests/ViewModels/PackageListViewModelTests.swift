import XCTest
import SwiftUI
@testable import Airalo

final class PackageListViewModelTests: XCTestCase {
    
    func test_init_withFetching_setsLoadingState() {
        let state: CountryPackagesResponseState = .fetching
        
        let viewModel = PackageListViewModel(responseState: state)
        
        XCTAssertEqual(viewModel.state, .loading)
    }
    
    func test_init_withError_setsErrorState() {
        let state: CountryPackagesResponseState = .error
        
        let viewModel = PackageListViewModel(responseState: state)
        XCTAssertEqual(viewModel.state, .error)
    }
    
    func test_init_withSuccess_setsReadyState_withCorrectData() {
        let mockResponse = CountryPackagesResponse(
            id: 1,
            slug: "",
            title: "Packages",
            image: RemoteImage(url: "https://example.com/image.png"),
            packages: [
                PackageResponse(
                    id: 100,
                    slug: "Package",
                    type: "Package Name",
                    price: 9.99,
                    title: "30 days",
                    data: "10 GB",
                    validity: "7 Days",
                    day: 7,
                    amount: 10,
                    operatorInfo: OperatorResponse(
                        id: 1,
                        title: "Telecom",
                        style: "light",
                        gradientStart: "#FF5733",
                        gradientEnd: "#C70039",
                        type: "pre-paid",
                        image: RemoteImage(url: "https://example.com/image.png"),
                        countries: [CountryResponse(id: 1, title: "France")]
                    )
                )
            ]
        )

        let state: CountryPackagesResponseState = .success(data: mockResponse)
        
        let viewModel = PackageListViewModel(responseState: state)
        
        guard case let .ready(data) = viewModel.state else {
            return XCTFail("Expected .ready state but got \(viewModel.state)")
        }
        
        XCTAssertEqual(data.id, 1)
        XCTAssertEqual(data.title, "Packages")
        XCTAssertEqual(data.packages.count, 1)
        
        let package = data.packages[0]
        XCTAssertEqual(package.id, 100)
        XCTAssertEqual(package.name, "Telecom")
        XCTAssertEqual(package.countryName, "France")
        XCTAssertEqual(package.data, "10 GB")
        XCTAssertEqual(package.validity, "7 Days")
        XCTAssertEqual(package.price, "$9.99")
        XCTAssertEqual(package.imageUrl?.absoluteString, "https://example.com/image.png")
        XCTAssertEqual(package.style, .light)
    }
}
