enum LocalEsimResponseState {
    case fetching
    case success(data: [LocalEsimResponse])
    case error
}
