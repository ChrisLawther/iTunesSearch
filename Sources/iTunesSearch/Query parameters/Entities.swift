
public enum MovieEntity: String {
    case movieArtist, movie
}

public enum PodcastEntity: String {
    case podcastAuthor, podcast
}

public enum MusicEntity: String {
    case musicArtist, musicTrack, album, musicVideo, mix, song
}

public enum MusicVideoEntity: String {
    case musicArtist, musicVideo
}

public enum AudiobookEntity: String {
    case audiobookAuthor, audiobook
}

public enum ShortFilmEntity: String {
    case shortFilmArtist, shortFilm
}

public enum TvShowEntity: String {
    case tvEpisode, tvSeason
}

public enum SoftwareEntity: String {
    case software, iPadSoftware, macSoftware
}

public enum EbookEntity: String {
    case ebook
}

public enum AllEntity: String {
    case movie, album, allArtist, podcast, musicVideo, mix, audiobook, tvSeason, allTrack
}
