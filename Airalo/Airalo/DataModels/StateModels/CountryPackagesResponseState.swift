enum CountryPackagesResponseState {
    case fetching
    case success(data: CountryPackagesResponse)
    case error
}
