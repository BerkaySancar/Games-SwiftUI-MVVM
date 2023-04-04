//
//  GameDetailResponse.swift
//  GamesSwiftUI
//
//  Created by Berkay Sancar on 4.04.2023.
//

import Foundation

struct GameDetail: Codable {
    let name: String
    let description: String?
    let backgroundImage: String?
    
    private enum CodingKeys: String, CodingKey {
        case name, description
        case backgroundImage = "background_image"
    }
}
