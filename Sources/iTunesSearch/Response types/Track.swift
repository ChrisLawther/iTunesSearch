import Foundation

public struct Track: Decodable {
    let kind: String    // enum?
    let previewUrl: URL
    let trackName: String
}
