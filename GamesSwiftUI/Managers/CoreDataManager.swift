//
//  CoreDataManager.swift
//  GamesSwiftUI
//
//  Created by Berkay Sancar on 4.04.2023.
//

import CoreData
import Foundation

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private let container: NSPersistentContainer
        
    private init() {
        container = NSPersistentContainer(name: "Favorite")
        container.loadPersistentStores { _, error in
            if let error {
                print("Core Data failed to load: \(error.localizedDescription) ")
            }
        }
    }
    
    func save() {
        try? container.viewContext.save()
    }
    
    func fetchFavorites() -> [Favorite]? {
        let request = NSFetchRequest<Favorite>(entityName: "Favorite")
        return try? container.viewContext.fetch(request)
    }
    
    func addFavorite(game: GameDetail) {
        let favGame = Favorite(context: container.viewContext)
        favGame.name = game.name
        favGame.imageURL = game.backgroundImage
        save()
    }
    
    func deleteFavorite(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        if let favs = fetchFavorites() {
            container.viewContext.delete(favs[index])
            save()
        }
    }
    
    func isAlreadyFavorited(game: GameDetail) -> Bool {
        if fetchFavorites()?.contains(where: { $0.name == game.name }) == true {
            return true
        } else {
            return false
        }
    }
}
