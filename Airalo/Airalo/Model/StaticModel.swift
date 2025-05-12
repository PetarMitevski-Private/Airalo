import Combine
import Foundation

final class StaticModel: ModelType {
    
    var localESimState: AnyPublisher<LocalEsimResponseState, Never> {
        Just(.success(data: Self.mockLocalEsims))
            .eraseToAnyPublisher()
    }
    
    var countryPackagesState: AnyPublisher<CountryPackagesResponseState, Never> {
        Just(.success(data: Self.mockCountryPackages))
            .eraseToAnyPublisher()
    }
    
    func getCountryPackagesState(for countryId: Int) {
        // No-op in previews
    }
    
    func eventOccurred(_ event: Event) {
        // No-op in previews
    }
}

// MARK: - Static Mock Data

private extension StaticModel {
    
    static var mockLocalEsims: [LocalEsimResponse] {
        [
            LocalEsimResponse(id: 1,
                              slug: "france",
                              title: "France",
                              image: RemoteImage(url: "https://example.com/france.png")),
            LocalEsimResponse(id: 2,
                              slug: "spain",
                              title: "Spain",
                              image: RemoteImage(url: "https://example.com/spain.png"))
        ]
    }
    
    static var mockCountryPackages: CountryPackagesResponse {
        CountryPackagesResponse(
            id: 1,
            slug: "france",
            title: "France Packages",
            image: RemoteImage(url: ""),
            packages: [
                PackageResponse(
                    id: 101,
                    slug: "",
                    type: "data",
                    price: 9.99,
                    title: "Basic Plan",
                    data: "10 GB",
                    validity: "7 Days",
                    day: 7,
                    amount: 10,
                    operatorInfo: OperatorResponse(
                        id: 111,
                        title: "Orange",
                        style: "dark",
                        gradientStart: "#FF6B6B",
                        gradientEnd: "#FFD93D",
                        type: "prepaid",
                        image: RemoteImage(url: "https://example.com/orange.png"),
                        countries: [CountryResponse(id: 1,
                                                    title: "France")]
                    )
                )
            ]
        )
    }
}
