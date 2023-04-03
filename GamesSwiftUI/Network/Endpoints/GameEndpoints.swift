//
//  GameEndpoints.swift
//  GamesSwiftUI
//
//  Created by Berkay Sancar on 3.04.2023.
//

import Foundation

enum GameEndpoints {
    case list(page: Int)
    case detail(id: Int)
}

extension GameEndpoints: EndpointsProtocol {
    
    var baseURLString: String {
        switch self {
        case .list(let page):
            return "https://api.rawg.io/api/games?page=\(page)"
        case .detail(let id):
            return "https://api.rawg.io/api/games/\(id)?"
        }
    }
    
    var apiKey: String {
        switch self {
        case .list:
            return "&key=7a692c0b214f47b0bb664039491b1fcf"
        case .detail:
            return "&key=7a692c0b214f47b0bb664039491b1fcf"
        }
    }
}
