//
//  DetailView.swift
//  GamesSwiftUI
//
//  Created by Berkay Sancar on 4.04.2023.
//

import SwiftUI

struct DetailView: View {
    
    @StateObject private var viewModel = DetailViewModel()
    @State private var starTapped = false
    private var id: Int
    
    init(id: Int) {
        self.id = id
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
                    AsyncImage(url: URL(string: viewModel.game?.backgroundImage ?? "")) { image in
                        image.image?.resizable()
                    }
                    .frame(height: 300)
                    
                    Text(viewModel.game?.name ?? "")
                        .font(.title2)
                    
                    Text(viewModel.game?.description ?? "")
                        .padding()
                        .multilineTextAlignment(.leading)
                }
                .navigationTitle("Detail")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button {
                        self.starTapped.toggle()
                    } label: {
                        Image(systemName: self.starTapped ? "star.fill" : "star")
                    }
                }
            }
        }
        .onAppear {
            viewModel.getGameDetail(id: self.id)
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage ?? ""), dismissButton: .default(Text("Try Again")) {
                viewModel.getGameDetail(id: self.id)
                print("in")
            })
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(id: 4)
    }
}
