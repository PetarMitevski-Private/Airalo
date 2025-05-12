import Foundation

class JSONLoader {
    static var shared: JSONLoader { .init() }

    func loadJSON(named name: String) throws -> Data {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: name, withExtension: "json") else {
            throw NSError(domain: "Missing file: \(name).json", code: 0)
        }
        return try Data(contentsOf: url)
    }
}
