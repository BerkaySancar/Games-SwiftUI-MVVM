//
//  HomeView.swift
//  GamesSwiftUI
//
//  Created by Berkay Sancar on 3.04.2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    @State private var searchText = ""
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemBlue
    }
    
    var body: some View {
        NavigationView {
            if viewModel.viewState == .loading {
                ProgressView()
                    .controlSize(.large)
                    .progressViewStyle(.circular)
                    .tint(.blue)
            } else {
                ScrollView {
                    TabView {
                        ForEach(viewModel.games.prefix(5), id: \.id) { game in
                            AsyncImage(url: URL(string: game.backgroundImage ?? "")) { image in
                                image.image?.resizable()
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width - 32, height: 250)
                    .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                    .cornerRadius(8)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width)
                    
                    ForEach(viewModel.games, id: \.id) { game in
                        NavigationLink {
                            DetailView(id: game.id)
                        } label: {
                            GameCellView(game: game)
                        }
                    }
                }
                .searchable(text: $searchText) {
                    ForEach(viewModel.searchedGames(text: self.searchText), id: \.id) { game in
                        NavigationLink {
                            DetailView(id: game.id)
                        } label: {
                            GameCellView(game: game)
                        }
                    }
                }
                .navigationTitle("Games")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage ?? ""), dismissButton: .default(Text("Try Again")) {
                viewModel.getGames()
                print("in")
            })
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
