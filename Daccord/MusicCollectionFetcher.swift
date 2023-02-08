//
//  MusicCollectionFetcher.swift
//  Daccord
//
//  Created by Kuan-Ting Lin on 2023/2/9.
//  LICENSE NOTICE: This file uses Apple's codes from its work "Meme Creator" (https://developer.apple.com/tutorials/sample-apps/memecreator) and part of this file might be subjected to Apple's licenses.

import SwiftUI

class MusicCollectionFetcher: ObservableObject {
    @Published var searchResults = MusicCollection(resultCount: nil, results: [Music.defaultMusic])
    @Published var currentMusic = Music.defaultMusic
    
        enum FetchError: Error {
        case badRequest
    }
    
    func fetchData(query: String, offset: Int = 0) async
     throws  {
        let urlString = "https://itunes.apple.com/search?term=\(query)&media=music&offset=\(offset)&limit=10"
        print(urlString)
        guard let url = URLComponents(string: urlString)?.url else { return }
         
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badRequest }

        Task { @MainActor in
            searchResults = try JSONDecoder().decode(MusicCollection.self, from: data)
            print(searchResults)
        }
    }
}
