import Foundation

public enum SearchResult {
    case track(Track)
    case artist(Artist)
    case collection(Collection)
}

extension SearchResult: Decodable {

    public init(from decoder: Decoder) throws {
        struct Wrapper: Decodable {
            let wrapperType: String
        }

        do {
            let wrapper = try Wrapper(from: decoder)

            switch wrapper.wrapperType {
            case "track":
                self = .track(try Track(from: decoder))
            case "artist":
                self = .artist(try Artist(from: decoder))
            case "collection":
                self = .collection(try Collection(from: decoder))
            default:
                fatalError() //throw DecodeError.invalidData // Unexpected type
            }
        }
    }
}
