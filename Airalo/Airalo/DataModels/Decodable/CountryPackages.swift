import Foundation

struct CountryPackages: Decodable {
    let id: Int
    let slug: String
    let title: String
    let image: RemoteImage
    let seo: String?
    let packages: [Package]
}

struct Package: Decodable {
    let id: Int
    let slug: String
    let type: String
    let price: Double
    let title: String
    let data: String
    let validity: String
    let day: Int
    let amount: Int
    let isUnlimited: Bool
    let note: String?
    let shortInfo: String?
    let callingCredit: String?
    let fairUsagePolicy: String?
    let isStock: Bool
    let operatorInfo: Operator

    enum CodingKeys: String, CodingKey {
        case id, slug, type, price, title, data, validity, day, amount
        case isUnlimited = "is_unlimited"
        case note
        case shortInfo = "short_info"
        case callingCredit = "calling_credit"
        case fairUsagePolicy = "fair_usage_policy"
        case isStock = "is_stock"
        case operatorInfo = "operator"
    }
}

struct Operator: Decodable {
    let id: Int
    let title: String
    let style: String
    let gradientStart: String
    let gradientEnd: String
    let isKycVerify: Int
    let kycType: String?
    let operatorLegalName: String?
    let privacyPolicyUrl: String?
    let type: String
    let isPrepaid: Bool
    let isMultiPackage: Bool
    let planType: String
    let activationPolicy: String
    let rechargeability: Bool
    let otherInfo: String?
    let apnType: String
    let apnTypeIos: String
    let apnTypeAndroid: String
    let apnSingle: String
    let dataRoaming: Bool
    let apn: String?
    let networks: [Network]
    let info: [String]
    let image: RemoteImage
    let countries: [CountryReference]

    enum CodingKeys: String, CodingKey {
        case id, title, style
        case gradientStart = "gradient_start"
        case gradientEnd = "gradient_end"
        case isKycVerify = "is_kyc_verify"
        case kycType = "kyc_type"
        case operatorLegalName = "operator_legal_name"
        case privacyPolicyUrl = "privacy_policy_url"
        case type
        case isPrepaid = "is_prepaid"
        case isMultiPackage = "is_multi_package"
        case planType = "plan_type"
        case activationPolicy = "activation_policy"
        case rechargeability
        case otherInfo = "other_info"
        case apnType = "apn_type"
        case apnTypeIos = "apn_type_ios"
        case apnTypeAndroid = "apn_type_android"
        case apnSingle = "apn_single"
        case dataRoaming = "data_roaming"
        case apn
        case networks, info, image, countries
    }
}

struct Network: Decodable {
    let network: String
    let serviceType: String
    let status: Bool

    enum CodingKeys: String, CodingKey {
        case network
        case serviceType = "service_type"
        case status
    }
}

struct CountryReference: Decodable {
    let id: Int
    let slug: String
    let title: String
    let image: RemoteImage
}
