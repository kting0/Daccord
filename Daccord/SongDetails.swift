//
//  SongDetails.swift
//  Daccord
//
//  Created by Kuan-Ting Lin on 2023/2/8.
//

import SwiftUI

struct SongDetails: View {
    var trackID: Int?
    @EnvironmentObject var fetcher: DataFetcher
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                if let artworkUrl600 = fetcher.currentMusic.artworkUrl600 {
                    AsyncImage(url: URL(string: artworkUrl600)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        Color.gray.opacity(0.1)
                    }
                } else {
                    Rectangle()
                        .fill(.gray)
                }
            }
            .frame(width: 250, height: 250)
            .cornerRadius(10)
            VStack(spacing: 5) {
                if let trackName = fetcher.currentMusic.trackName {
                    Text(trackName)
                        .bold()
                }
                if let artistName = fetcher.currentMusic.artistName {
                    Text(artistName)
                        .foregroundColor(.secondary)
                    + Text(Image(systemName: "chevron.forward"))
                        .foregroundColor(.secondary)
                }
                if let collectionName = fetcher.currentMusic.collectionName {
                    Text(collectionName)
                        .foregroundColor(.secondary)
                    + Text(Image(systemName: "chevron.forward"))
                        .foregroundColor(.secondary)
                }
            }
            .font(.title3)
            .multilineTextAlignment(.center)
            HStack {
                Button {
                    
                } label: {
                    Label("Preview Song", systemImage: "play.fill")
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
            }
            if let releaseDate = fetcher.currentMusic.releaseDate {
                VStack {
                    Text("Released ")
                    + Text(releaseDate)
                }
                .foregroundColor(.secondary)
                .font(.footnote)
                .bold()
            }
        }
        .padding()
        .task {
            if let trackID = trackID {
                do {
                    try await fetcher.fetchData(fetchType: .track, query: String(trackID))
                } catch {
                    print("track error")
                }
            }
        }
    }
}

struct SongDetails_Previews: PreviewProvider {
    static var previews: some View {
        SongDetails()
    }
}
