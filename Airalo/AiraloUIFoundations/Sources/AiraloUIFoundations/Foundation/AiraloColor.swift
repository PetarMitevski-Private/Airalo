import SwiftUI
import UIKit

public typealias AiraloColor = Color
public extension AiraloColor {
    static let charcoal: AiraloColor = Color(red: 0.29, green: 0.29, blue: 0.29, opacity: 1)
    static let alabasterWhite: AiraloColor = Color(red: 0.98, green: 0.98, blue: 0.98, opacity: 1)
    static let dropShadowColor: AiraloColor = Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.15)
}

public typealias AiraloUIColor = UIColor
public extension UIColor {
    static let charcoal: AiraloUIColor = UIColor(.charcoal)
    static let alabasterWhite: AiraloUIColor = UIColor(.alabasterWhite)
}
