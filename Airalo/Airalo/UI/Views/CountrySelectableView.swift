import SwiftUI

struct CountrySelectableView: View {
    private let country: Country

    init(country: Country) {
        self.country = country
    }
    
    var body: some View {
        HStack(spacing: 15) {
            flagImage
            countryName
            Spacer()
            chevronIcon
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 20)
        .background(Color.white)
        .rounded
        .shadow(.dropShadow)
        .padding(.horizontal, 20)
    }
    
    private var countryName: some View {
        Text(country.name)
            .textStyle(textStyle: .bodyStyle)
    }
    
    private var flagImage: some View {
        AsyncImage(url: URL(string: country.url)) { phase in
            switch phase {
            case .empty, .failure:
                Image(.imagePlaceholder)
                    .resizable()
                    .scaledToFill()
            case let .success(image):
                image
                    .resizable()
                    .scaledToFill()
            @unknown default:
                Image(.imagePlaceholder)
                    .resizable()
                    .scaledToFill()
            }
        }
        .frame(width: 37, height: 28)
        .clipped()
    }
    
    private var chevronIcon: some View {
        Image(.chevronLeft)
            .resizable()
            .foregroundColor(.charcoal)
            .rotationEffect(.degrees(180))
            .frame(width: 8, height: 12)
    }
}
