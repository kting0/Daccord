//
//  Daccord.swift
//  Daccord
//
//  Created by Kuan-Ting Lin on 2023/2/8.
//

import SwiftUI

struct Daccord: View {
    @EnvironmentObject var fetcher: DataFetcher
    
    @State var searchText: String = ""
    var body: some View {
        NavigationView {
            ZStack {
                if searchText.isEmpty {
                    List {
                        Section(header: Text("Discover").font(.title2).bold().foregroundColor(.primary)) {
                            Button {
                                searchText = "ABAO"
                                Task {
                                    await doSearch()
                                }
                            } label: {
                                Text("ABAO")
                                    .font(.title3)
                                    .foregroundColor(.accentColor)
                            }
                            Button {
                                searchText = "Lady Gaga"
                                Task {
                                    await doSearch()
                                }
                            } label: {
                                Text("Lady Gaga")
                                    .font(.title3)
                                    .foregroundColor(.accentColor)
                            }
                            Button {
                                searchText = "五月天"
                                Task {
                                    await doSearch()
                                }
                            } label: {
                                Text("五月天")
                                    .font(.title3)
                                    .foregroundColor(.accentColor)
                            }
                        }
                        .listSectionSeparator(.hidden)
                    }
                    .listStyle(.plain)
                }
                
                if !searchText.isEmpty {
                    SearchResults(searchResults: fetcher.searchResults.results)
                }
            }
            .navigationTitle("Search")
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Artists, Songs, Lyrics and More")
        .onSubmit(of: .search) {
            Task {
                await doSearch()
            }
        }
    }
    
    func doSearch() async {
        do {
            try await fetcher.fetchData(fetchType: .collection, query: searchText)
        } catch {
            print("error")
        }
    }
    
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Daccord(searchText: "")
    }
}


