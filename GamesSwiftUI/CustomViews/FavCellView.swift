//
//  FavCellView.swift
//  GamesSwiftUI
//
//  Created by Berkay Sancar on 4.04.2023.
//

import SwiftUI

struct FavCellView: View {
    
    var game: Favorite
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: game.imageURL ?? "")) { image in
                image.image?.resizable()
            }
            .frame(width: 72, height: 72)
            .cornerRadius(8)
            
            Text(game.name ?? "")
        }
    }
}
