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
                LineChart(viewModel: viewModel)
                LineChartTabs(viewModel: viewModel)
                CoinInformation(coin: coin)
            }
            .onAppear {
                viewModel.getexchangeData(days: 10, intervall: "daily",dateformat: "MM/dd")
            }
        }
    }
}
