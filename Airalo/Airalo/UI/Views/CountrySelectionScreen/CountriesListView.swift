import SwiftUI
import AiraloUIFoundations

struct CountriesListView: View {
    
    // MARK: - Internal Properties
    
    @EnvironmentObject var countriesListViewInteractor: CountriesListViewInteractor
    
    // MARK: - Body
    
    var body: some View {
        AiraloNavigationStack(title: .navigationTitle) {
            switch countriesListViewInteractor.countriesListViewModel.state {
            case .loading:
                contentView(data: StaticModel.placeholderCountriesListViewDataModel)
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
    
    // MARK: - Subviews
    
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

#Preview {
    CountriesListView()
        .environmentObject(CountriesListViewInteractor(model: StaticModel()))
}
