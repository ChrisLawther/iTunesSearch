import Foundation

public enum Media {
    case movie(MovieEntity?, MovieAttribute?),
        podcast(PodcastEntity?, PodcastAttribute?),
        music(MusicEntity?, MusicAttribute?),
        musicVideo(MusicVideoEntity?, MusicVideoAttribute?),
        audiobook(AudiobookEntity?, AudiobookAttribute?),
        shortFilm(ShortFilmEntity?, ShortFilmAttribute?),
        tvShow(TvShowEntity?, TvShowAttribute?),
        software(SoftwareEntity?, SoftwareAttribute?),
        ebook(EbookEntity?),
        all(AllEntity?, AllAttribute?)
}

extension Media {
    var queryItems: [URLQueryItem] {

        switch self {
        case let .movie(entity, attribute):
            return Self.queryItems(for: "movie", entity: entity, attribute: attribute)
        case let .podcast(entity, attribute):
            return Self.queryItems(for: "podcast", entity: entity, attribute: attribute)
        case let .music(entity, attribute):
            return Self.queryItems(for: "music", entity: entity, attribute: attribute)
        case let .musicVideo(entity, attribute):
            return Self.queryItems(for: "musicVideo", entity: entity, attribute: attribute)
        case let .audiobook(entity, attribute):
            return Self.queryItems(for: "audiobook", entity: entity, attribute: attribute)
        case let .shortFilm(entity, attribute):
            return Self.queryItems(for: "shortFilm", entity: entity, attribute: attribute)
        case let .tvShow(entity, attribute):
            return Self.queryItems(for: "tvShow", entity: entity, attribute: attribute)
        case let .software(entity, attribute):
            return Self.queryItems(for: "software", entity: entity, attribute: attribute)
        case let .ebook(entity):
            let nilAttribute: AllAttribute? = nil
            return Self.queryItems(for: "ebook", entity: entity, attribute: nilAttribute)
        case let .all(entity, attribute):
            return Self.queryItems(for: "all", entity: entity, attribute: attribute)
        }
    }

    static func queryItems<Entity: RawRepresentable, Attribute: RawRepresentable>(for media: String,
                                                                                  entity: Entity?,
                                                                                  attribute: Attribute?) -> [URLQueryItem] where Entity.RawValue == String,
                                                                                                                                 Attribute.RawValue == String {
        var items = [URLQueryItem(name: "media", value: media)]
        if entity != nil {
            items.append(URLQueryItem(name: "entity", value: entity!.rawValue))
        }
        if attribute != nil {
            items.append(URLQueryItem(name: "attribute", value: attribute!.rawValue))
        }

        return items
    }
}
