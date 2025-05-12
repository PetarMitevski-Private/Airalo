import XCTest
import Combine
@testable import Airalo

final class ModelTests: XCTestCase {
    
    private var model: Model!
    private var mockNetworkingService: MockNetworkingService!
    private var dependencies: MockDependenciesContainer!
    private var cancellables: Set<AnyCancellable> = []

    override func setUp() {
        super.setUp()
        mockNetworkingService = MockNetworkingService()
        dependencies = MockDependenciesContainer(networkingService: mockNetworkingService)
        model = Model(dependenciesContainer: dependencies)
    }

    func test_fetchLocalEsims_emitsFetchingAndSuccess() {
        let expectation = XCTestExpectation(description: "Emits .fetching and then .sucess for fetch local sims")
        expectation.expectedFulfillmentCount = 1
        
        var receivedStates: [LocalEsimResponseState] = []
        
        model.localESimState
            .sink { state in
                receivedStates.append(state)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        model.getLocalEsims()
        
        wait(for: [expectation], timeout: 1.0)
        
        XCTAssertEqual(receivedStates.first, .fetching)
    }
    
    func test_getCountryPackages_emitsFetchingAndError() {
        
        let expectation = XCTestExpectation(description: "Emits .fetching and then .sucess for country packages")
        expectation.expectedFulfillmentCount = 1
        
        var receivedStates: [CountryPackagesResponseState] = []
        
        model.countryPackagesState
            .sink { state in
                receivedStates.append(state)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        model.getCountryPackagesState(for: 100)
        
        wait(for: [expectation], timeout: 1.0)
        
        XCTAssertEqual(receivedStates.first, .fetching)
    }
    
    func test_eventOccurred_refreshCountryList_triggersLocalEsimsFetch() {
        let expectation = XCTestExpectation(description: "Expected .fetching and .success from refreshCountryList event")
        expectation.expectedFulfillmentCount = 2

        var receivedStates: [LocalEsimResponseState] = []

        model.localESimState
            .sink { state in
                receivedStates.append(state)
                expectation.fulfill()
            }
            .store(in: &cancellables)

        model.eventOccurred(.refreshCountryList)

        wait(for: [expectation], timeout: 1.0)

        XCTAssertEqual(receivedStates.first, .fetching)
        XCTAssertEqual(receivedStates.count, 2)
    }

    func test_eventOccurred_refreshPackagesList_triggersCountryPackagesFetch() {
        let expectation = XCTestExpectation(description: "Expected .fetching and .success from refreshPackagesList event")
        expectation.expectedFulfillmentCount = 2

        var receivedStates: [CountryPackagesResponseState] = []

        model.countryPackagesState
            .sink { state in
                receivedStates.append(state)
                expectation.fulfill()
            }
            .store(in: &cancellables)

        model.eventOccurred(.refreshPackagesList(id: 99))

        wait(for: [expectation], timeout: 1.0)

        XCTAssertEqual(receivedStates.first, .fetching)
        XCTAssertEqual(receivedStates.count, 2)
    }
}
