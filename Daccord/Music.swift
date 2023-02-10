//
//  Music.swift
//  Daccord
//
//  Created by Kuan-Ting Lin on 2023/2/8.
//


import Foundation

struct Music: Codable, Identifiable {
    let id = UUID()
    let wrapperType: WrapperType
    let kind: Kind
    let collectionExplicitness, trackExplicitness, artistExplicitness: Explicitness?
    let collectionName, trackName, artistName, collectionCensoredName, trackCensoredName, artistCensoredName, collectionArtistName: String?
    /* artistAndCollectionName is determined by artistName & collectionName.
       It's
         1. "artistName - collectionName" if both not nil,
         2. only "artistName" or "collectionName" if other variable is nil, or
         3. nil if both are nil.
     */
    var artistAndCollectionName: String? {
        if let artistName = artistName {
            if let collectionName = collectionName {
                return "\(artistName) - \(collectionName)"
            } else {
                return artistName
            }
        } else {
            if let collectionName = collectionName {
                return collectionName
            } else {
                return nil
            }
        }
    }
    let artistViewURL, collectionViewURL, trackViewURL, previewURL, artworkUrl30, artworkUrl60, artworkUrl100, collectionArtistViewURL: String?
    var artworkUrl600: String? {
        if let artworkUrl100 = artworkUrl100 {
            return artworkUrl100.replacingOccurrences(of: "100x100", with: "600x600")
        } else {
            return nil
        }
    }
    let country, currency, primaryGenreName, contentAdvisoryRating, releaseDate: String?
    let artistID, collectionID, trackID, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, collectionArtistID: Int?
    let collectionPrice, trackPrice: Double?
    let isStreamable: Bool?
    
    enum CodingKeys: String, CodingKey {
        case wrapperType, kind, artistName, collectionName, trackName, collectionCensoredName, trackCensoredName, artistCensoredName, artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, collectionExplicitness, trackExplicitness, artistExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, isStreamable, collectionArtistName
        case artistID = "artistId"
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case collectionArtistID = "collectionArtistId"
        case collectionArtistViewURL = "collectionArtistViewUrl"
    }
    
    static let defaultMusic = Music(wrapperType: WrapperType(rawValue: "track")!, kind: Kind(rawValue: "song")!, collectionExplicitness: Explicitness(rawValue: "notExplicit"), trackExplicitness: Explicitness(rawValue: "notExplicit"), artistExplicitness: nil, collectionName: "kinakaian 母親的舌頭", trackName: "tjakudain 無奈 (feat. 李英宏)", artistName: "ABAO", collectionCensoredName: "kinakaian 母親的舌頭", trackCensoredName: "tjakudain 無奈 (feat. 李英宏)", artistCensoredName: nil, collectionArtistName: nil, artistViewURL: "https://music.apple.com/us/artist/abao/1149993208?uo=4", collectionViewURL: "https://music.apple.com/us/album/tjakudain-%E7%84%A1%E5%A5%88-feat-%E6%9D%8E%E8%8B%B1%E5%AE%8F/1498166703?i=1498166802&uo=4", trackViewURL: "https://music.apple.com/us/album/tjakudain-%E7%84%A1%E5%A5%88-feat-%E6%9D%8E%E8%8B%B1%E5%AE%8F/1498166703?i=1498166802&uo=4", previewURL: "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/f4/6e/6e/f46e6e33-d623-fa11-569a-4370affabc07/mzaf_9439843479999656985.plus.aac.p.m4a", artworkUrl30: "https://is3-ssl.mzstatic.com/image/thumb/Music123/v4/63/fe/9f/63fe9f28-d649-d0c5-6069-6a64895fd8d6/20UMGIM01114.rgb.jpg/30x30bb.jpg", artworkUrl60: "https://is3-ssl.mzstatic.com/image/thumb/Music123/v4/63/fe/9f/63fe9f28-d649-d0c5-6069-6a64895fd8d6/20UMGIM01114.rgb.jpg/60x60bb.jpg", artworkUrl100: "https://is3-ssl.mzstatic.com/image/thumb/Music123/v4/63/fe/9f/63fe9f28-d649-d0c5-6069-6a64895fd8d6/20UMGIM01114.rgb.jpg/100x100bb.jpg", collectionArtistViewURL: nil, country: "USA", currency: "USD", primaryGenreName: "Mandopop", contentAdvisoryRating: nil, releaseDate: "2019-12-30T12:00:00Z", artistID: 1149993208, collectionID: 1498166703, trackID: 1498166802, discCount: 1, discNumber: 1, trackCount: 11, trackNumber: 4, trackTimeMillis: 224516, collectionArtistID: nil, collectionPrice: nil, trackPrice: nil, isStreamable: true)
}

enum WrapperType: String, Codable {
    case track = "track"
    case collection = "collection"
    case artist = "artist"
}

enum Kind: String, Codable {
    case book = "book"
    case album = "album"
    case coachedAudio = "coached-audio"
    case featureMovie = "feature-movie"
    case interactiveBooklet = "interactive-booklet"
    case musicVideo = "music-video"
    case pdf = "pdf"
    case podcast = "podcast"
    case podcastEpisode = "podcast-episode"
    case softwarePackage = "software-package"
    case song = "song"
    case tvEpisode = "tv-episode"
    case artist = "artist"
}

enum Explicitness: String, Codable {
    case explicit = "explicit"
    case cleaned = "cleaned"
    case notExplicit = "notExplicit"
}

struct MusicCollection: Codable {
    let resultCount: Int?
    let results: [Music]
}
