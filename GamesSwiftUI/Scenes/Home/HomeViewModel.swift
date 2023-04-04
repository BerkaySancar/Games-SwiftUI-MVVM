//
//  HomeViewModel.swift
//  GamesSwiftUI
//
//  Created by Berkay Sancar on 3.04.2023.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    
    @Published private(set) internal var games: [Game] = []
    @Published private(set) internal var viewState: ViewState = .loading
    @Published private(set) internal var errorMessage: String?
    @Published internal var showAlert = false
    
    init() {
        getGames()
    }
    
    func getGames() {
        Task {
            self.viewState = .loading
            
            try await GamesAPI.shared.fetchGameList(page: 1) { [weak self] results in
                guard let self else { return }
                switch results {
                case .success(let games):
                    DispatchQueue.main.async {
                        self.showAlert = false
                        self.viewState = .loaded
                        self.games = games
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.errorMessage = error.localizedDescription
                        self.showAlert = true
                    }
                }
            }
        }
    }
    
    func searchedGames(text: String) -> [Game] {
        if text.isEmpty {
            return self.games
        } else {
            return self.games.filter { $0.name.contains(text) }
        }
    }
}
