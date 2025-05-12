import XCTest
import Combine
@testable import Airalo

final class PackageListViewInteractorTests: XCTestCase {
    
    private var interactor: PackageListViewInteractor!
    private var mockModel: MockModel!
    private var cancellables: Set<AnyCancellable> = []

    override func setUp() {
        super.setUp()
        mockModel = MockModel()
        interactor = PackageListViewInteractor(model: mockModel)
    }

    func testDidAppearSuccessUpdatesReadyState() {
        interactor.didAppear(id: 1)
        
        let mockResponse = CountryPackagesResponse(
            id: 1,
            slug: "",
            title: "Packages",
            image: RemoteImage(url: "https://example.com/image.png"),
            packages: [
                PackageResponse(
                    id: 100,
                    slug: "Package",
                    type: "Spain",
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
        
        mockModel.countryPackagesStateSubject.send(.success(data: mockResponse))
        
        let expectation = XCTestExpectation(description: "Wait for published value")
        interactor.$packageListViewModel
            .dropFirst()
            .sink { viewModel in
                if case .ready(let data) = viewModel.state {
                    XCTAssertEqual(data.packages.first?.countryName, "Spain")
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
    }

    func testRefreshSendsRefreshEvent() {
        interactor.refresh(id: 99)
        XCTAssertEqual(mockModel.receivedEvents, [.refreshPackagesList(id: 99)])
    }

    func testClickedBuyPackageSendsCorrectEvent() {
        interactor.clickedBuyPackage(id: 7)
        XCTAssertEqual(mockModel.receivedEvents, [.clickedBuyPackage(id: 7)])
    }
}
