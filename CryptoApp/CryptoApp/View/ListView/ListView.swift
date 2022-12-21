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
        
        if (networkManager.isConnected){
            
            NavigationStack {
                DropDownSelection()
                List(viewModel.coins, id: \.id) { coin in
                            NavigationLink {
                                DetailView(coin: coin, viewModel: DetailViewModel(coin:coin))
                            } label: {
                                CardView(coin: coin)
                            }
                        }
                .navigationTitle("Coins")
                .navigationBarTitleDisplayMode(.large)
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
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
