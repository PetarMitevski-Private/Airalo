public enum CustomFont: String, CaseIterable {
    case ibmPlexSansMedium = "IBMPlexSans-Medium"
    case ibmPlexSansSemiBold = "IBMPlexSans-SemiBold"
    
    var ext: String {
        return "ttf"
    }
}

public extension CustomFont {
    func register() {
        switch self {
        case .ibmPlexSansMedium:
            return FontsRegistrar.registerFont(.ibmPlexSansMedium)
        case .ibmPlexSansSemiBold:
            return FontsRegistrar.registerFont(.ibmPlexSansSemiBold)
        }
    }
}
