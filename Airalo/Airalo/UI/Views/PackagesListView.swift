import SwiftUI

struct PackagesView: View {
    let countryName: String
    init(countryName: String) {
        self.countryName = countryName
    }
    
    var body: some View {
        StyledNavigationStack(title: countryName) {
            ScrollView {
                VStack(spacing: 40) {
                    Spacer()
                    ForEach(0..<20) { num in
                        PackageView()
                            .padding(.horizontal, 20)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .background(Color.alabasterWhite)
        }
    }
}
