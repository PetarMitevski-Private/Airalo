import Foundation
import SwiftUI

struct PackageListViewDataModel: Equatable {
    let id: Int
    let title: String
    let packages: [PackageViewDataModel]
    
    struct PackageViewDataModel: Equatable {
        let id: Int
        let name: String
        let countryName: String
        let data: String
        let validity: String
        let imageUrl: URL?
        let price: String
        let startColor: Color
        let endColor: Color
        let style: Style
        
        enum Style {
            case light
            case dark
        }
    }
}

typealias PackageViewDataModel = PackageListViewDataModel.PackageViewDataModel
