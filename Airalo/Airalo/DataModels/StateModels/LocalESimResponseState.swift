enum LocalEsimResponseState: Equatable {
    case fetching
    case success(data: [LocalEsimResponse])
    case error
}
