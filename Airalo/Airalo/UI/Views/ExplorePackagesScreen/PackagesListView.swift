import SwiftUI
import AiraloUIFoundations

struct PackagesListView: View {
    
    // MARK: - Internal Properties
    
    @EnvironmentObject var packageListViewInteractor: PackageListViewInteractor
    
    // MARK: - Private Properties
    
    private let id: Int
    private let countryName: String
    
    // MARK: - Initialiser
    
    init(id: Int, countryName: String) {
        self.id = id
        self.countryName = countryName
    }
    
    // MARK: - Body
    var body: some View {
        Group {
            switch packageListViewInteractor.packageListViewModel.state {
            case .loading:
                contentView(data: StaticModel.placeholderPackageListViewDataModel)
                    .redacted(reason: .placeholder)
                    .shimmering()
            case let .ready(data):
                contentView(data: data)
            case .error:
                ErrorView {
                    packageListViewInteractor.refresh(id: id)
                }
            }
        }
        .onAppear {
            packageListViewInteractor.didAppear(id: id)
        }
    }
    
    // MARK: - Subviews
    
    private func contentView(data: PackageListViewDataModel) -> some View {
        AiraloNavigationStack(title: countryName) {
            ScrollView {
                VStack(spacing: .spacing40) {
                Spacer()
                    ForEach(data.packages, id: \.id) { package in
                        PackageView(package: package, buyPackage: { id in
                            packageListViewInteractor.clickedBuyPackage(id: id)
                        })
                        .padding(.horizontal, .spacing20)
                }
            }
            .frame(maxWidth: .infinity)
            }
            .background(Color.alabasterWhite)
        }
    }
}

#Preview {
    PackagesListView(id: 1, countryName: "Coutry Name")
        .environmentObject(PackageListViewInteractor(model: StaticModel()))
}
