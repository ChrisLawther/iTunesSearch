public enum MovieAttribute: String {
    case actorTerm, genreIndex, artistTerm, shortFilmTerm, producerTerm, ratingTerm, directorTerm, releaseYearTerm, featureFilmTerm, movieArtistTerm, movieTerm, ratingIndex, descriptionTerm
}

public enum PodcastAttribute: String {
    case titleTerm, languageTerm, authorTerm, genreIndex, artistTerm, ratingIndex, keywordsTerm, descriptionTerm
}

public enum MusicAttribute: String {
    case mixTerm, genreIndex, artistTerm, composerTerm, albumTerm, ratingIndex, songTerm
}

public enum MusicVideoAttribute: String {
    case genreIndex, artistTerm, albumTerm, ratingIndex, songTerm
}

public enum AudiobookAttribute: String {
    case titleTerm, authorTerm, genreIndex, ratingIndex
}

public enum ShortFilmAttribute: String {
    case genreIndex, artistTerm, shortFilmTerm, ratingIndex, descriptionTerm
}

public enum SoftwareAttribute: String {
    case softwareDeveloper
}

public enum TvShowAttribute: String {
    case genreIndex, tvEpisodeTerm, showTerm, tvSeasonTerm, ratingIndex, descriptionTerm
}

public enum AllAttribute: String {
    case actorTerm, languageTerm, allArtistTerm, tvEpisodeTerm, shortFilmTerm,
        directorTerm, releaseYearTerm, titleTerm, featureFilmTerm, ratingIndex,
        keywordsTerm, descriptionTerm, authorTerm, genreIndex, mixTerm, allTrackTerm,
        artistTerm, composerTerm, tvSeasonTerm, producerTerm, ratingTerm, songTerm,
        movieArtistTerm, showTerm, movieTerm, albumTerm
}
