//
//  DetailView.swift
//  CryptoApp
//
//  Created by Ali Can Arslan on 11.12.22.
//

import Foundation
import SwiftUI

struct DetailView: View{
    var coin: Coin
    
    @StateObject var viewModel: DetailViewModel
    
    
    
    var body: some View {
        ScrollView{
            VStack{
                Text(String(coin.current_price))
                Text(String(coin.price_change_percentage_24h))
                Text(String(coin.price_change_24h))
                LineChart(exchangeRate: viewModel.chartData)
            }
            .refreshable {
                viewModel.getexchangeData()
                
            }
            .onAppear {
                viewModel.getexchangeData()
            }
        }
    }
}
