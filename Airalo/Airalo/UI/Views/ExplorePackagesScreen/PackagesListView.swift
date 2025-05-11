import SwiftUI
import AiraloUIFoundations

struct PackagesView: View {
    
    @EnvironmentObject var packageListViewInteractor: PackageListViewInteractor
    
    private let id: Int
    private let countryName: String
    
    init(id: Int, countryName: String) {
        self.id = id
        self.countryName = countryName
    }
    
    var body: some View {
        Group {
            switch packageListViewInteractor.packageListViewModel.state {
            case .loading:
                contentView(data: .placeholder)
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

private extension PackageListViewDataModel {
    static let placeholder: PackageListViewDataModel = {
        let packages = [
            PackageViewDataModel(id: 0, name: "", countryName: "", data: "", validity: "", imageUrl: nil, price: "", startColor: .gray, endColor: .gray, style: .light),
            PackageViewDataModel(id: 1, name: "", countryName: "", data: "", validity: "", imageUrl: nil, price: "", startColor: .gray, endColor: .gray, style: .light),
            PackageViewDataModel(id: 2, name: "", countryName: "", data: "", validity: "", imageUrl: nil, price: "", startColor: .gray, endColor: .gray, style: .light),
            PackageViewDataModel(id: 3, name: "", countryName: "", data: "", validity: "", imageUrl: nil, price: "", startColor: .gray, endColor: .gray, style: .light)
        ]
        
        return PackageListViewDataModel(id: 0, title: "", packages: packages)
    }()
}
