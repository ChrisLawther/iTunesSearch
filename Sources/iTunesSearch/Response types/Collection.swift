//{
//    "wrapperType": "collection",
//    "collectionType": "TV Season",
//    "artistId": 681105851,
//    "collectionId": 681105853,
//    "artistName": "Love/Hate",
//    "collectionName": "Love/Hate, Series 1 & 2",
//    "collectionCensoredName": "Love/Hate, Series 1 & 2",
//    "artistViewUrl": "https://itunes.apple.com/gb/tv-show/love-hate/id681105851?uo=4",
//    "collectionViewUrl": "https://itunes.apple.com/gb/tv-season/love-hate-series-1-2/id681105853?uo=4",
//    "artworkUrl60": "https://is5-ssl.mzstatic.com/image/thumb/Video6/v4/62/45/3c/62453c86-0ac3-f27d-921c-a4b387c49498/source/60x60bb.jpg",
//    "artworkUrl100": "https://is5-ssl.mzstatic.com/image/thumb/Video6/v4/62/45/3c/62453c86-0ac3-f27d-921c-a4b387c49498/source/100x100bb.jpg",
//    "collectionPrice": 13.99,
//    "collectionHdPrice": 15.99,
//    "collectionExplicitness": "notExplicit",
//    "contentAdvisoryRating": "Caution",
//    "trackCount": 10,
//    "copyright": "© RTE 2010",
//    "country": "GBR",
//    "currency": "GBP",
//    "releaseDate": "2013-07-24T07:00:00Z",
//    "primaryGenreName": "Drama",
//    "longDescription": "A contemporary series set in the Dublin underworld. Darren Tracey is on a flying visit from Spain to celebrate the release of his brother from prison. Tragedy strikes when his brother is assassinated. Darren is left to look after his sister - a single mum, who is deeply traumatised by their brother's death. Thrown back into the heart of gangland Dublin, Darren does a few 'jobs' for his old boss John Boy Power, played by the award-winning Aidan Gillen. His sister's sanity, the safety of her children and wanting a girl he can't have who's never stopped loving him complicate the journey to his ultimate goal: revenge."
//}

import Foundation

public struct Collection: Decodable {
    public let collectionType: String
    public let artistId: Int
    public let collectionId: Int
    public let artistName: String
    public let collectionName: String
    public let artistViewUrl: URL
    public let collectionViewUrl: URL
    public let artworkUrl60: URL
    public let artworkUrl100: URL
    public let description: String

    enum CodingKeys: String, CodingKey {
        case collectionType
        case artistId
        case collectionId
        case artistName
        case collectionName
        case artistViewUrl
        case collectionViewUrl
        case artworkUrl60
        case artworkUrl100
        case description = "longDescription"
    }
}
