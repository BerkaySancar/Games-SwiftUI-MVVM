//
//  GameListResponse.swift
//  GamesSwiftUI
//
//  Created by Berkay Sancar on 3.04.2023.
//

import Foundation

struct GameListResponse: Codable {
    let results: [Game]
}

struct Game: Codable, Identifiable {
    let id: Int
    let name: String
    let metacritic: Int?
    let backgroundImage: String?
    let released: String?
    
    private enum CodingKeys: String, CodingKey {
        case id, name, metacritic, released
        case backgroundImage = "background_image"
    }
}
