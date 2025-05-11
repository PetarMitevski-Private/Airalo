import SwiftUI
import AiraloUIFoundations

struct CountrySelectableView: View {
    private let country: CountrySelectableViewDataModel
    
    init(country: CountrySelectableViewDataModel) {
        self.country = country
    }
    
    var body: some View {
        HStack(spacing: .spacing14) {
            flagImage
            countryName
            Spacer()
            chevronIcon
        }
        .padding(.vertical, .spacing14)
        .padding(.horizontal, .spacing20)
        .background(Color.white)
        .rounded7
        .shadow(.dropShadow)
        .padding(.horizontal, .spacing20)
    }
    
    private var countryName: some View {
        Text(country.countryName)
            .textStyle(textStyle: .bodyStyle)
            .multilineTextAlignment(.leading)
    }
    
    private var flagImage: some View {
        AsyncImage(url: country.imageUrl) { phase in
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
        .frame(width: .flagImageWidth, height: .flagImageHeight)
        .clipped()
    }
    
    private var chevronIcon: some View {
        Image(.chevronLeft)
            .resizable()
            .foregroundColor(.charcoal)
            .rotationEffect(.mirror)
            .frame(width: .chevronIconWidth, height: .chevronIconHeight)
    }
}

private extension CGFloat {
    static let flagImageWidth: CGFloat = 37
    static let flagImageHeight: CGFloat = 28
    
    static let chevronIconWidth: CGFloat = 8
    static let chevronIconHeight: CGFloat = 12
}
