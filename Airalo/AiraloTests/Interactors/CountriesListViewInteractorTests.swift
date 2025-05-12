import XCTest
import Combine
@testable import Airalo

final class CountriesListViewInteractorTests: XCTestCase {
    private var cancellables: Set<AnyCancellable> = []
    
    func testInteractorInitialStateIsFetching() {
        let model = MockModel()
        let interactor = CountriesListViewInteractor(model: model)
        
        XCTAssertEqual(interactor.countriesListViewModel.state, .loading)
    }

    func testInteractorUpdatesToReadyOnSuccess() {
        let model = MockModel()
        let interactor = CountriesListViewInteractor(model: model)
        let response = LocalEsimResponse(id: 1, slug: "spain", title: "Spain", image: RemoteImage(url: "https://example.com"))
        
        model.localESimStateSubject.send(.success(data: [response]))

        let expectation = XCTestExpectation(description: "Wait for published value")
        interactor.$countriesListViewModel
            .dropFirst()
            .sink { viewModel in
                if case .ready(let data) = viewModel.state {
                    XCTAssertEqual(data.countries.first?.countryName, "Spain")
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }

    func testInteractorUpdatesToErrorOnError() {
        let model = MockModel()
        let interactor = CountriesListViewInteractor(model: model)

        let expectation = XCTestExpectation(description: "Error state received")

        interactor.$countriesListViewModel
            .dropFirst()
            .sink { viewModel in
                if case .error = viewModel.state {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        model.localESimStateSubject.send(.error)

        wait(for: [expectation], timeout: 1.0)
    }

    func testRefreshTriggersModelEvent() {
        let model = MockModel()
        let interactor = CountriesListViewInteractor(model: model)

        interactor.refresh()
        XCTAssertEqual(model.didCallEvent, .refreshCountryList)
    }
}
