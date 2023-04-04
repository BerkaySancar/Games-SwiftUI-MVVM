//
//  DetailViewModel.swift
//  GamesSwiftUI
//
//  Created by Berkay Sancar on 4.04.2023.
//

import Foundation

@MainActor
final class DetailViewModel: ObservableObject {
    
    @Published private(set) internal var game: GameDetail?
    @Published private(set) internal var viewState: ViewState = .loading
    @Published private(set) internal var errorMessage: String?
    @Published internal var showAlert = false
    @Published internal var favButtonImageName = "star"
        
    func getGameDetail(id: Int) {
        Task {
            self.viewState = .loading
            
            try await GamesAPI.shared.fetchGameDetail(id: id, completion: { [weak self] results in
                guard let self else { return }
                switch results {
                case .success(let game):
                    DispatchQueue.main.async {
                        self.showAlert = false
                        self.viewState = .loaded
                        self.game = game
                    }
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.showAlert = true
                }
            })
        }
    }
    
    func setFavButtonImage()  {
        if let game, CoreDataManager.shared.isAlreadyFavorited(game: game) {
            self.favButtonImageName = "star.fill"
        } else {
            self.favButtonImageName = "star"
        }
    }
    
    func toggleFavButton() {
        if self.favButtonImageName == "star" {
            favButtonImageName = "star.fill"
        } else {
            favButtonImageName = "star"
        }
    }
    
    func addFavorite() {
        if let game, !CoreDataManager.shared.isAlreadyFavorited(game: game) {
            CoreDataManager.shared.addFavorite(game: game)
        } else {
            if let index = CoreDataManager.shared.fetchFavorites()?.firstIndex(where: { $0.name == self.game?.name }) {
                CoreDataManager.shared.deleteFavorite(indexSet: .init(integer: index))
            }
        }
    }
}
