//
//  SongDetails.swift
//  Daccord
//
//  Created by Kuan-Ting Lin on 2023/2/8.
//

import SwiftUI

struct SongDetails: View {
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.gray)
                            .frame(width: 250, height: 250)
                            .shadow(color: .gray, radius: 15)
            VStack(spacing: 5) {
                Text("Opium (feat. EARTHGANG)")
                    .bold()
                Text("Gorillaz")
                    .foregroundColor(.secondary)
                + Text(Image(systemName: "chevron.forward"))
                    .foregroundColor(.secondary)
                Text("Song Machine, Season One: Strange Timez (Deluxe)")
                    .foregroundColor(.secondary)
                + Text(Image(systemName: "chevron.forward"))
                    .foregroundColor(.secondary)
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
            Text("Released 2000/01/01")
                .foregroundColor(.secondary)
                .font(.footnote)
                .bold()
        }
        .padding()
    }
}

struct SongDetails_Previews: PreviewProvider {
    static var previews: some View {
        SongDetails()
    }
}
