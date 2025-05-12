import SwiftUI
import AiraloUIFoundations

// MARK: - Internal Types

enum PackageRowType {
    case data(value: String)
    case validity(value: String)
}

struct PackageSectionInfoRow: View {
    
    // MARK: - Private Properties
    
    private let rowType: PackageRowType
    private let style: PackageViewDataModel.Style
    
    // MARK: - Initialiser
    
    init(rowType: PackageRowType, style: PackageViewDataModel.Style) {
        self.rowType = rowType
        self.style = style
    }
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: .spacing10) {
            Image(rowIcon)
                .resizable()
                .frame(width: .spacing20, height: .spacing20)
                .foregroundStyle(styleColor)
            Text(rowTitle.uppercased())
                .font(.plexSansMedium12)
                .foregroundColor(styleColor)
            Spacer()
            Text(rowValue)
                .font(.plexSansMedium17)
                .foregroundColor(styleColor)
        }
        .padding(.horizontal, .spacing20)
        .padding(.vertical, .spacing14)
    }
    
    // MARK: - Subviews
    
    private var rowTitle: String {
        switch rowType {
        case .data:
            "data"
        case .validity:
            "validity"
        }
    }
    
    private var rowValue: String {
        switch rowType {
        case .data(value: let value):
            value
        case .validity(value: let value):
            value
        }
    }
    
    private var rowIcon: ImageResource {
        switch rowType {
        case .data:
                .icData
        case .validity:
                .icValidity
        }
    }
    
    private var styleColor: AiraloColor {
        switch style {
        case .light:
            .white
        case .dark:
            .charcoal
        }
    }
}
