//
//  DetailViewModel.swift
//  CryptoApp
//
//  Created by Ali Can Arslan on 11.12.22.
//

import Foundation
import SwiftUI

class DetailViewModel: ObservableObject {
    
    var coin: Coin
    
    let model = Model()
    
    @Published var chartData: [ChartData] = [ChartData(date: "", value: 0.0)]
    
    init(coin: Coin){
        self.coin = coin
     }
    
    func getexchangeData(){
        model.getExchangeRate24h(id: coin.id, onSuccess: {
            var exchangeRate24h = self.model.exchangeRate24h ?? ExchangeRate24h(prices: [[0, 0]])
            
            var currentTime = Float(Date().timeIntervalSince1970 * 1000.0)
            
            print(currentTime)
            
            let dateFormatter = DateFormatter()
             
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .none
            dateFormatter.dateFormat = "dd/MM"
            dateFormatter.locale = Locale.current
            
            var temp: [ChartData] = []
            
            for i in exchangeRate24h.prices.indices {
                
                var date = Date(timeIntervalSince1970:Double((exchangeRate24h.prices[i][0])) / 1000.0)
                
                var parsedDate = dateFormatter.string(from:date)
                
                temp.append(ChartData(date: parsedDate, value: exchangeRate24h.prices[i][1]))
                print(exchangeRate24h.prices[i][1])
            }
            self.chartData = temp
        }
        )
        
    }
}

struct ChartData:Hashable{
    var date: String
    var value: Float
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(date + String(value))
    }
}
