//
//  GamesAPI.swift
//  GamesSwiftUI
//
//  Created by Berkay Sancar on 3.04.2023.
//

import Foundation

final class GamesAPI {
    
    static let shared = GamesAPI()
    
    private init() {}
    
}

extension GamesAPI {
    
    typealias GameListResults = Result<[Game], NetworkError>
    
    func fetchGameList(page: Int, completion: (GameListResults) -> Void) async throws {
        let urlString = GameEndpoints.list(page: page).url
        
        do {
            let games = try await NetworkManager.shared.makeRequest(type: GameListResponse.self, urlString: urlString).results
            completion(.success(games))
        } catch let error as NetworkError {
            completion(.failure(error))
        }
    }
}
