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
                LineChart(exchangeRate: viewModel.chartData)
                CoinInformation(coin: coin)
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
