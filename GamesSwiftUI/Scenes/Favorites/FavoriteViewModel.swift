//
//  FavoriteViewModel.swift
//  GamesSwiftUI
//
//  Created by Berkay Sancar on 4.04.2023.
//

import Foundation

final class FavoriteViewModel: ObservableObject {
    
    @Published internal var favGames: [Favorite] = []
    
    func getFavGames() {
        self.favGames = CoreDataManager.shared.fetchFavorites() ?? []
    }
    
    func deleteGame(indexSet: IndexSet) {
        CoreDataManager.shared.deleteFavorite(indexSet: indexSet)
    }
}
