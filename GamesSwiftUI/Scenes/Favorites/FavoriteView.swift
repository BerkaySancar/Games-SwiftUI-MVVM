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
                    ForEach(viewModel.favGames, id: \.name) { game in
                        HStack {
                            AsyncImage(url: URL(string: game.imageURL ?? "")) { image in
                                image.image?.resizable()
                            }
                            .frame(width: 72, height: 72)
                            .cornerRadius(8)
                            
                            Text(game.name ?? "")
                        }
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
