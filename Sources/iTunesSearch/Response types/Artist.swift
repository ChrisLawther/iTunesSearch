//{
//    "wrapperType": "artist",
//    "artistType": "Artist",
//    "artistName": "David Bowie",
//    "artistLinkUrl": "https://music.apple.com/gb/artist/david-bowie/551695?uo=4",
//    "artistId": 551695,
//    "amgArtistId": 3753,
//    "primaryGenreName": "Rock",
//    "primaryGenreId": 21
//}

import Foundation

public struct Artist: Decodable {
    public let name: String
    public let link: URL
    public let id: Int
    public let primaryGenre: String
    public let primaryGenreId: Int

    enum CodingKeys: String, CodingKey {
        case name = "artistName"
        case link = "artistLinkUrl"
        case id = "artistId"
        case primaryGenre = "primaryGenreName"
        case primaryGenreId
    }
}
