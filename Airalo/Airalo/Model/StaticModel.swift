import Combine
import Foundation

/// Local Implementation of the ModelType used for Previews
final class StaticModel: ModelType {
    
    var localESimState: AnyPublisher<LocalEsimResponseState, Never> {
        Just(.success(data: Self.mockLocalEsims))
            .eraseToAnyPublisher()
    }
    
    var countryPackagesState: AnyPublisher<CountryPackagesResponseState, Never> {
        Just(.success(data: Self.mockCountryPackages))
            .eraseToAnyPublisher()
    }
    
    func getCountryPackagesState(for countryId: Int) { }
    
    func eventOccurred(_ event: Event) { }
}

// MARK: - Static Mock Data

extension StaticModel {
    
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
    
    static var placeholderPackageListViewDataModel: PackageListViewDataModel {
        let packages = [
            PackageViewDataModel(id: 0, name: "", countryName: "", data: "", validity: "", imageUrl: nil, price: "", startColor: .gray, endColor: .gray, style: .light),
            PackageViewDataModel(id: 1, name: "", countryName: "", data: "", validity: "", imageUrl: nil, price: "", startColor: .gray, endColor: .gray, style: .light),
            PackageViewDataModel(id: 2, name: "", countryName: "", data: "", validity: "", imageUrl: nil, price: "", startColor: .gray, endColor: .gray, style: .light),
            PackageViewDataModel(id: 3, name: "", countryName: "", data: "", validity: "", imageUrl: nil, price: "", startColor: .gray, endColor: .gray, style: .light)
        ]
        
        return PackageListViewDataModel(id: 0, title: "", packages: packages)
    }
    
    static var placeholderCountriesListViewDataModel: CountriesListViewDataModel {
        let countries: [CountrySelectableViewDataModel] = [
            CountrySelectableViewDataModel(id: 0, countryName: "", imageUrl: nil),
            CountrySelectableViewDataModel(id: 1, countryName: "", imageUrl: nil),
            CountrySelectableViewDataModel(id: 2, countryName: "", imageUrl: nil),
            CountrySelectableViewDataModel(id: 3, countryName: "", imageUrl: nil),
            CountrySelectableViewDataModel(id: 4, countryName: "", imageUrl: nil),
            CountrySelectableViewDataModel(id: 5, countryName: "", imageUrl: nil),
            CountrySelectableViewDataModel(id: 6, countryName: "", imageUrl: nil),
            CountrySelectableViewDataModel(id: 7, countryName: "", imageUrl: nil),
            CountrySelectableViewDataModel(id: 8, countryName: "", imageUrl: nil),
            CountrySelectableViewDataModel(id: 9, countryName: "", imageUrl: nil)
        ]
        return CountriesListViewDataModel(countries: countries)
    }
}
