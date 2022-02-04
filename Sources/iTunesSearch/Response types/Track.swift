import Foundation

public struct Track: Decodable {
    public let kind: String    // enum?
    public let previewUrl: URL
    public let trackName: String
}
