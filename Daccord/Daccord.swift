//
//  Daccord.swift
//  Daccord
//
//  Created by Kuan-Ting Lin on 2023/2/8.
//

import SwiftUI

struct Daccord: View {
    @State var searchText: String = ""
    var body: some View {
        NavigationView {
            ZStack {
                if searchText.isEmpty {
                    List {
                        Section(header: Text("Discover").font(.title2).bold().foregroundColor(.primary)) {
                            Button {
                                
                            } label: {
                                Text("ABAO")
                                    .font(.title3)
                                    .foregroundColor(.accentColor)
                            }
                            Button {
                                
                            } label: {
                                Text("ABAO")
                                    .font(.title3)
                                    .foregroundColor(.accentColor)
                            }
                            Button {
                                
                            } label: {
                                Text("ABAO")
                                    .font(.title3)
                                    .foregroundColor(.accentColor)
                            }
                        }
                        .listSectionSeparator(.hidden)
                    }
                    .listStyle(.plain)
                }
                
                if !searchText.isEmpty {
                    SearchResults()
                }
            }
            .navigationTitle("Search")
        }
        .searchable(text: $searchText, prompt: "Artists, Songs, Lyrics and More")
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Daccord(searchText: "")
    }
}
