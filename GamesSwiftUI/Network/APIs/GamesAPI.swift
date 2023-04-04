//
//  GamesAPI.swift
//  GamesSwiftUI
//
//  Created by Berkay Sancar on 3.04.2023.
//

import Foundation

protocol GamesAPIProtocol {
    typealias GameListResults = (Result<[Game], NetworkError>) -> Void
    typealias GameDetailResults = (Result<GameDetail, NetworkError>) -> Void
    
    func fetchGameList(page: Int, completion: (GameListResults)) async throws
    func fetchGameDetail(id: Int, completion: (GameDetailResults)) async throws
}

final class GamesAPI {
    
    static let shared = GamesAPI()
    
    private init() {}
}

extension GamesAPI: GamesAPIProtocol {
    
    func fetchGameList(page: Int, completion: (GameListResults)) async throws {
        let urlString = GameEndpoints.list(page: page).url
        
        do {
            let games = try await NetworkManager.shared.makeRequest(type: GameList.self, urlString: urlString)
            completion(.success(games.results))
        } catch let error as NetworkError {
            completion(.failure(error))
        }
    }
    
    func fetchGameDetail(id: Int, completion: (GameDetailResults)) async throws {
        let urlString = GameEndpoints.detail(id: id).url
        
        do {
            let game = try await NetworkManager.shared.makeRequest(type: GameDetail.self, urlString: urlString)
            completion(.success(game))
        } catch let error as NetworkError {
            completion(.failure(error))
        }
    }
}
