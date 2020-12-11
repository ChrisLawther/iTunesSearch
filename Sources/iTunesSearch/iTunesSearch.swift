import Foundation

// https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/iTuneSearchAPI/Searching.html#//apple_ref/doc/uid/TP40017632-CH5-SW1

public enum iTunesSearch {
    private static let baseUrl = URL(string: "http://itunes.apple.com/search")!

    /// Perform a search
    /// - Parameters:
    ///   - term: The term to search for
    ///   - media: The media type to search (e.g. movie, music) and (optionally) the corresponding entity and attribute (default is `.all(nil, nil)`)
    ///   - dataFetcher: the dataFetcher
    ///   - completion: A completion to pass the eventual result to
    public static func search(_ term: String,
                              in media: Media? = .all(nil, nil),
                              using dataFetcher: DataFetcher = Networking.fetchData,
                              completion: @escaping (Result<[SearchResult], Error>) -> Void) {

        var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)
        components?.queryItems = media?.queryItems

        guard let url = components?.url else {
            return
        }

        let request = URLRequest(url: url)

        dataFetcher(request) { result in
            completion(result.flatMap(Self.decode(data:)))
        }
        // Query params are:
        // - term : the text to search for
        // - country: e.g. 'gb'
        // - media: the type of thing to look for
    }
}

private extension iTunesSearch {
    static let decoder = JSONDecoder()

    static func decode(data: Data) -> Result<[SearchResult], Error> {

        struct SearchResponse: Decodable {
            let results: [SearchResult]
        }

        return Result.init {
            (try Self.decoder.decode(SearchResponse.self, from: data)).results
        }
    }
}
