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
    let name: String
    let link: URL
    let id: Int
    let primaryGenre: String
    let primaryGenreId: Int

    enum CodingKeys: String, CodingKey {
        case name = "artistName"
        case link = "artistLinkUrl"
        case id = "artistId"
        case primaryGenre = "primaryGenreName"
        case primaryGenreId
    }
}
