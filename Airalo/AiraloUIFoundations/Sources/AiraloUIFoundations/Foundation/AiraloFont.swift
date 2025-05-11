import SwiftUI
import UIKit

public typealias AiraloFont = Font
public extension AiraloFont {
    static let plexSansSemiBold27: AiraloFont = Font.custom("IBMPlexSans-SmBld", size: 27)
    static let plexSansSemiBold19: AiraloFont = Font.custom("IBMPlexSans-SmBld", size: 19)
    static let plexSansSemiBold11: AiraloFont = Font.custom("IBMPlexSans-SmBld", size: 11)
    static let plexSansSemiBold13: AiraloFont = Font.custom("IBMPlexSans-SmBld", size: 13)
    static let plexSansSemiBold15: AiraloFont = Font.custom("IBMPlexSans-SmBld", size: 15)
    
    static let plexSansMedium12: AiraloFont = Font.custom("IBMPlexSans-Medm", size: 12)
    static let plexSansMedium15: AiraloFont = Font.custom("IBMPlexSans-Medm", size: 15)
    static let plexSansMedium17: AiraloFont = Font.custom("IBMPlexSans-Medm", size: 17)
}

public typealias AiraloUIFonts = UIFont
public extension AiraloUIFonts {
    static let largeTitleFont: AiraloUIFonts = UIFont(name: "IBMPlexSans-SmBld", size: 27)!
    static let smallTitleFont: AiraloUIFonts = UIFont(name: "IBMPlexSans-SmBld", size: 19)!
}
