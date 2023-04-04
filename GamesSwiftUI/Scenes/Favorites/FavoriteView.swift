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
        Text("Favorites")
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
