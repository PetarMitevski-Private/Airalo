import SwiftUI
import AiraloUIFoundations

struct CountriesListView: View {
    @EnvironmentObject var countriesListViewInteractor: CountriesListViewInteractor
    
    var body: some View {
        AiraloNavigationStack(title: .navigationTitle) {
            switch countriesListViewInteractor.countriesListViewModel.state {
            case .loading:
                contentView(data: .placeholder)
                    .redacted(reason: .placeholder)
                    .shimmering()
            case .ready(let data):
                contentView(data: data)
            case .error:
                ErrorView {
                    countriesListViewInteractor.refresh()
                }
            }
        }
    }
    
    private func contentView(data: CountriesListViewDataModel) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: .spacing12) {
                Text(verbatim: .countriesListTitle)
                    .textStyle(textStyle: .titleStyle)
                    .padding(.horizontal, .spacing20)
                    .padding(.top)
                
                ForEach(data.countries, id: \.id) { country in
                    NavigationLink(destination: PackagesListView(id: country.id,
                                                             countryName: country.countryName)) {
                        CountrySelectableView(country: country)
                    }
                }
                Spacer()
            }
            .padding(.top)
        }
        .background(Color.alabasterWhite)
    }
}

private extension String {
    static let navigationTitle = "Hello"
    static let countriesListTitle = "Popular Countries"
}

private extension CountriesListViewDataModel {
    static let placeholder: CountriesListViewDataModel = {
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
    }()
}

#Preview {
    CountriesListView()
        .environmentObject(CountriesListViewInteractor(model: StaticModel()))
}
