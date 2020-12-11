import Foundation
import XCTest
@testable import iTunesSearch

final class iTunesSearchTests: XCTestCase {

    typealias DataFetcher = (URLRequest, (Result<Data, Error>) -> Void) -> Void

    private static func fetcher(returning testFile: String) throws -> DataFetcher {
        let data = try DataLoader.contents(of: testFile)

        return { _, completion in
            completion(.success(data))
        }
    }

    // MARK: - Decoding responses

    func testCanDecodeResponseWithTrack() throws {
        let fetcher = try Self.fetcher(returning: "sampleResponse.json")

        let searchReturned = expectation(description: "Search returned")

        iTunesSearch.search("foo", using: fetcher) { result in
            switch result {
            case .success(let results):
                XCTAssertEqual(results.count, 1)
            case .failure(_):
                XCTFail()
            }
            searchReturned.fulfill()
        }

        wait(for: [searchReturned], timeout: 0)
    }

    func testCanDecodeResponseWithArtistEntity() throws {
        let fetcher = try Self.fetcher(returning: "artistEntity.json")

        let searchReturned = expectation(description: "Search returned")

        iTunesSearch.search("foo", using: fetcher) { result in
            switch result {
            case .success(let results):
                XCTAssertEqual(results.count, 1)
            case .failure(let error):
                XCTFail("Failed with error: \(error)")
            }
            searchReturned.fulfill()
        }

        wait(for: [searchReturned], timeout: 0)
    }

    func testCanDecodeResponseWithCollection() throws {
        let fetcher = try Self.fetcher(returning: "tvSeasonEntity.json")

        let searchReturned = expectation(description: "Search returned")

        iTunesSearch.search("foo", using: fetcher) { result in
            switch result {
            case .success(let results):
                XCTAssertEqual(results.count, 1)
            case .failure(let error):
                XCTFail("Failed with error: \(error)")
            }
            searchReturned.fulfill()
        }

        wait(for: [searchReturned], timeout: 0)
    }

    // MARK: - Making requests

    func testDefaultSearchPassesOnlyMediaAllAsQueryParam() throws {
        let requestWasMade = expectation(description: "A request was made")

        var searchRequest: URLRequest?

        let fetcher: (URLRequest, (Result<Data, Error>) -> Void) -> Void = { request, _ in
            searchRequest = request
            requestWasMade.fulfill()
        }

        iTunesSearch.search("foo", using: fetcher) { _ in }

        wait(for: [requestWasMade], timeout: 0)

        let components = URLComponents(url: searchRequest!.url!, resolvingAgainstBaseURL: true)!

        let items = components.queryItems!.asDictionary

        XCTAssertEqual(items["media"], "all")
        XCTAssertNil(items["entity"])
        XCTAssertNil(items["attribute"])
    }

    func testSearchingWithinMoviesForMoviesByActorSendsCorrectQuery() {
        let requestWasMade = expectation(description: "A request was made")

        var searchRequest: URLRequest?

        let fetcher: (URLRequest, (Result<Data, Error>) -> Void) -> Void = { request, _ in
            searchRequest = request
            requestWasMade.fulfill()
        }

        iTunesSearch.search("foo", in: .movie(.movie, .actorTerm), using: fetcher) { _ in }

        wait(for: [requestWasMade], timeout: 0)

        let components = URLComponents(url: searchRequest!.url!, resolvingAgainstBaseURL: true)!

        let items = components.queryItems!.asDictionary

        XCTAssertEqual(items["media"], "movie")
        XCTAssertEqual(items["entity"], "movie")
        XCTAssertEqual(items["attribute"], "actorTerm")
    }

    // MARK: -

    // :sigh: linux
    static var allTests = [
        ("testCanDecodeResponseWithTrack", testCanDecodeResponseWithTrack),
    ]
}

// MARK: - Helpers

enum DataLoader {
    private static let rootUrl = URL(fileURLWithPath: #file).deletingLastPathComponent()

    static func contents(of filename: String) throws -> Data {
        let resourceURL = rootUrl
            .appendingPathComponent("Test data")
            .appendingPathComponent(filename)

        return try Data(contentsOf: resourceURL)
    }
}

extension Array where Element == URLQueryItem {

    /// For ease of indexing/comparing, it's sometimes helpful to be able to view an array of URLQueryItem as a simple [String: String]
    var asDictionary: [String: String] {
        self.reduce(into: [:]) { (dict, item) in
            dict[item.name] = item.value
        }
    }
}
