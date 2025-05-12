import Foundation
import SwiftUI
import Combine

final class PackageListViewInteractor: ObservableObject {
        
    @Published var packageListViewModel: PackageListViewModel = PackageListViewModel(responseState: .fetching)
        
    private let model: ModelType
    private var cancellables: Set<AnyCancellable> = []
    
    
    init(model: ModelType) {
        self.model = model
    }
    
    func didAppear(id: Int) {
        model.getCountryPackagesState(for: id)
        model.countryPackagesState
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.packageListViewModel = PackageListViewModel(responseState: .error)
            } receiveValue: { [weak self] responseState in
                self?.packageListViewModel = PackageListViewModel(responseState: responseState)
            }
            .store(in: &cancellables)
    }
    
    func refresh(id: Int) {
        model.eventOccurred(.refreshPackagesList(id: id))
    }
    
    func clickedBuyPackage(id: Int) {
        model.eventOccurred(.clickedBuyPackage(id: id))
    }
}
