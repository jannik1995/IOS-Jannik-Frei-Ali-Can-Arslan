//
//  ListView.swift
//  CryptoApp
//
//  Created by Ali Can Arslan on 11.12.22.
//

import Foundation
import SwiftUI

struct HomeView: View{
    @StateObject var viewModel = ListViewModel.model
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        ZStack {
            if (networkManager.isConnected){
                    NavigationStack {
                        if (viewModel.coins.count < 2) {
                            ProgressView("Loading")
                        } else {
                            DropDownSelection()
                            List(viewModel.coins, id: \.id) { coin in
                                NavigationLink {
                                    DetailView(coin: coin, viewModel: DetailViewModel(coin:coin))
                                } label: {
                                    CardView(coin: coin)
                                }.padding(.trailing, -30)
                            }
                        .padding(.horizontal, -20.0)
                        
                        .navigationTitle("Coins")
                        .navigationBarTitleDisplayMode(.large)
                    }
                    }
                    .refreshable {
                        viewModel.getListOfCoins()
                    }
                    .onAppear {
                        viewModel.getListOfCoins()
                    }
            }
            else{
                VStack {
                    Text("Kein Internet").font(.body).fontWeight(.bold)
                    Button {
                        viewModel.getListOfCoins()
                    } label: {
                        Label("Retry", systemImage: "arrow.clockwise")
                    }

                }
            }
        }
        .background(Color.black)
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
