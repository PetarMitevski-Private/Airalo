import Foundation
import Combine
@testable import Airalo

final class MockModel: ModelType {
    let localESimStateSubject = PassthroughSubject<LocalEsimResponseState, Never>()
    
    var localESimState: AnyPublisher<LocalEsimResponseState, Never> {
        localESimStateSubject.eraseToAnyPublisher()
    }

    let countryPackagesStateSubject = PassthroughSubject<CountryPackagesResponseState, Never>()
    
    var countryPackagesState: AnyPublisher<CountryPackagesResponseState, Never> {
        countryPackagesStateSubject.eraseToAnyPublisher()
    }

    var didCallEvent: Event?
    
    private(set) var calledCountryId: Int?
    private(set) var receivedEvents: [Event] = []

    func getCountryPackagesState(for countryId: Int) {
        calledCountryId = countryId
    }

    func eventOccurred(_ event: Event) {
        didCallEvent = event
        receivedEvents.append(event)
    }
}

