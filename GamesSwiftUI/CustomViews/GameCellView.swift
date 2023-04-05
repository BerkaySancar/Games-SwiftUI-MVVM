//
//  HorizontalGamesView.swift
//  GamesSwiftUI
//
//  Created by Berkay Sancar on 3.04.2023.
//

import SwiftUI

struct GameCellView: View {
    
    var game: Game
    
    var body: some View {
        ZStack {
            Color.black
            
            HStack {
                AsyncImage(url: URL(string: game.backgroundImage ?? "")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                        .tint(.blue)
                }
                .frame(width: 116, height: 116)
                .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 14) {
                    Text("Name: \(game.name)")
                        .lineLimit(2)
                    
                    Text("Released: \(game.released ?? "")")
                    
                    Text("Metacritics: \(game.metacritic ?? 0)")
                }
                .foregroundColor(.white)
                .padding(.leading, 4)
                .font(.body)
                
                Spacer()
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width - 32, height: 180)
        .border(.blue, width: 2)
        .cornerRadius(8)
    }
}

struct HorizontalGamesView_Previews: PreviewProvider {
    static var previews: some View {
        GameCellView(game: .init(id: 1,
                                 name: "Grand Theft Auto",
                                 metacritic: 99,
                                 backgroundImage: "https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg",
                                 released: "213131"))
    }
}
