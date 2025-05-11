import SwiftUI
import AiraloUIFoundations

struct PackageView: View {
    private let package: PackageViewDataModel
    private let buyPackage: (Int) -> Void
    @State private var parentWidth: CGFloat = 0

    init(package: PackageViewDataModel, buyPackage: @escaping (Int) -> Void) {
        self.package = package
        self.buyPackage = buyPackage
    }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            backgroundGradient
            packageImage
            packageDetails
        }
        .fixedSize(horizontal: false, vertical: true)
    }

    // MARK: - Subviews

    private var backgroundGradient: some View {
        RoundedRectangle(cornerRadius: .spacing7)
            .fill(
                LinearGradient(
                    colors: [package.startColor, package.endColor],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .shadow(.dropShadow)
    }

    private var packageImage: some View {
        AsyncImage(url: package.imageUrl) { image in
            image
                .resizable()
        } placeholder: {
            package
                .startColor
                .rounded7
        }
        .frame(width: .packageImageWidth, height: .packageImageHeight)
        .clipShape(RoundedRectangle(cornerRadius: .spacing10))
        .offset(x: -.spacing20, y: -.spacing20)
        .shadow(.dropShadow)
    }

    private var packageDetails: some View {
        VStack(alignment: .leading, spacing: .zero) {
            headerSection
            divider
            PackageSectionInfoRow(rowType: .data(value: package.data), style: package.style)
            divider
            PackageSectionInfoRow(rowType: .validity(value: package.validity), style: package.style)
            divider
            buyNowButton
        }
        .background(sizeMontior)
    }

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: .spacing3) {
            Text(package.name)
                .font(.plexSansSemiBold19)
                .foregroundColor(styleColor)
                .lineLimit(1)
            Text(package.countryName)
                .font(.plexSansSemiBold13)
                .foregroundColor(styleColor)
                .lineLimit(1)
        }
        .frame(maxWidth: titleViewMaxWidth, alignment: .leading)
        .padding(.spacing20)
    }

    private var buyNowButton: some View {
        Button(action: {
            buyPackage(package.id)
        }) {
            Text("US\(package.price) - BUY NOW")
                .font(.plexSansSemiBold13)
                .frame(maxWidth: .infinity)
                .padding(.vertical, .spacing12)
                .foregroundColor(styleColor)
                .overlay(
                    RoundedRectangle(cornerRadius: .spacing7)
                        .stroke(styleColor, lineWidth: .dividerHeight)
                )
        }
        .padding(.spacing20)
    }

    private var divider: some View {
        Rectangle()
            .fill(styleColor)
            .frame(maxWidth: .infinity, maxHeight: .dividerHeight)
            .opacity(Double(.dividerOpacity))
    }

    private var sizeMontior: some View {
        GeometryReader { geometry in
            Color.clear
                .onAppear {
                    parentWidth = geometry.size.width
                }
                .onChange(of: geometry.size.width) { _, newValue in
                    parentWidth = newValue
                }
        }
    }
    
    private var styleColor: AiraloColor {
        switch package.style {
        case .light:
            .white
        case .dark:
            .charcoal
        }
    }
    
    private var titleViewMaxWidth: CGFloat {
        max(0, parentWidth - (.packageImageWidth + 2 * .spacing20))
    }
}

private extension CGFloat {
    static let dividerOpacity: CGFloat = 0.3
    static let dividerHeight: CGFloat = 1
    static let packageImageWidth: CGFloat = 140
    static let packageImageHeight: CGFloat = 88
}
