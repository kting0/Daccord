//
//  DaccordApp.swift
//  Daccord
//
//  Created by Kuan-Ting Lin on 2023/2/8.
//

import SwiftUI

@main
struct DaccordApp: App {
    @StateObject private var fetcher = DataFetcher()
    
    var body: some Scene {
        WindowGroup {
            Daccord()
                .environmentObject(fetcher)
        }
    }
}
