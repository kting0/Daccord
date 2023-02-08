//
//  SearchResults.swift
//  Daccord
//
//  Created by Kuan-Ting Lin on 2023/2/8.
//

import SwiftUI

struct SearchResults: View {
    var body: some View {
        List {
            Section {
                SearchResultItem()
                SearchResultItem()
                SearchResultItem()
            }
            .listSectionSeparator(.hidden)
        }
        
        .listStyle(.plain)
    }
}

struct SearchResults_Previews: PreviewProvider {
    static var previews: some View {
        SearchResults()
    }
}


struct SearchResultItem: View {
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 2, style: .continuous)
                            .fill(.gray)
                            .frame(width: 50, height: 50)
            VStack(alignment: .leading, spacing: 2) {
                Text("Opium (feat. EARTHGANG)")
                Text("Gorillaz - Song Machine, Season One: Strange Timez (Deluxe)")
                    .foregroundColor(.secondary)
                    .font(.footnote)
            }
            .lineLimit(1)
        }
        .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
    }
}
