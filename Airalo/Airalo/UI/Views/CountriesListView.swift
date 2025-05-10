import SwiftUI

struct CountriesListView: View {
    var body: some View {
        StyledNavigationStack(title: "Hello") {
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Popular Countries")
                            .textStyle(textStyle: .titleStyle)
                            .padding(.horizontal, 20)
                            .padding(.top)
                        
                        ForEach(countries, id: \.id) { country in
                            NavigationLink(destination: PackagesView(name: country.name)) { CountrySelectableView(country: country)
                            }
                        }
                        Spacer()
                    }
                    .padding(.top)
                }
            .background(Color.alabasterWhite)            
        }
    }
}
