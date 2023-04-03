//
//  GamesSwiftUIApp.swift
//  GamesSwiftUI
//
//  Created by Berkay Sancar on 3.04.2023.
//

import SwiftUI

@main
struct GamesSwiftUIApp: App {

    var body: some Scene {
        WindowGroup {
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
