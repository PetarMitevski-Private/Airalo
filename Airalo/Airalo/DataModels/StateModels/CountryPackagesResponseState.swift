enum CountryPackagesResponseState: Equatable {
    case fetching
    case success(data: CountryPackagesResponse)
    case error
}
