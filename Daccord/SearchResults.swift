//
//  SearchResults.swift
//  Daccord
//
//  Created by Kuan-Ting Lin on 2023/2/8.
//

import SwiftUI

struct SearchResults: View {
    var searchResults: [Music]
    
    var body: some View {
        List {
            Section {
                ForEach(searchResults) { result in
                    SearchResultItem(music: result)
                }
            }
            .listSectionSeparator(.hidden)
        }
        
        .listStyle(.plain)
    }
}

struct SearchResults_Previews: PreviewProvider {
    static var previews: some View {
        SearchResults(searchResults: [Music.defaultMusic])
    }
}


struct SearchResultItem: View {
    var music: Music
    
    var body: some View {
        NavigationLink(destination: SongDetails()) {
            HStack {
                RoundedRectangle(cornerRadius: 2, style: .continuous)
                                .fill(.gray)
                                .frame(width: 50, height: 50)
                VStack(alignment: .leading, spacing: 2) {
                    if let trackName = music.trackName {
                        Text(trackName)
                    }
                    if let collectionName = music.collectionName {
                        Text(collectionName)
                            .foregroundColor(.secondary)
                            .font(.footnote)
                    }
                }
                .lineLimit(1)
            }
        }
        .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
    }
}
