//
//  FavoriteView.swift
//  GamesSwiftUI
//
//  Created by Berkay Sancar on 4.04.2023.
//

import SwiftUI

struct FavoriteView: View {
    
    @StateObject private var viewModel = FavoriteViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.favGames.isEmpty {
                Text("List is empty")
            } else {
                List {
                    ForEach(viewModel.favGames, id: \.self) { game in
                        FavCellView(game: game)
                    }
                    .onDelete { indexSet in
                        viewModel.deleteGame(indexSet: indexSet)
                    }
                }
                .navigationTitle("Favorites")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .onAppear {
            viewModel.getFavGames()
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
