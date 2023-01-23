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
    
    @Published var chartData: [ChartData] = [ChartData(date: Date(), value: 0.0)]
    
    var min: Float = 0.0
    var max: Float = 0.0
    
    init(coin: Coin){
        self.coin = coin
     }
    
    func getexchangeData(days: Int, intervall: String){
        model.getExchangeRate24h(id: coin.id, days: String(days), interval: intervall, onSuccess: {
            var exchangeRate24h = self.model.exchangeRate24h ?? ExchangeRate24h(prices: [[0, 0]])
            
            var parsedData: [ChartData] = []
            
            
            self.min = exchangeRate24h.prices[0][1]
            self.max = exchangeRate24h.prices[0][1]
            
            for i in exchangeRate24h.prices.indices {
                
                let date = Date(timeIntervalSince1970:Double((exchangeRate24h.prices[i][0])) / 1000.0)
                
                
                parsedData.append(ChartData(date: date, value: exchangeRate24h.prices[i][1]))
                
                let value = exchangeRate24h.prices[i][1]
                
                if self.min > value{
                    self.min = value
                }
                if self.max < value {
                    self.max = value
                }
                
            }
            self.chartData = parsedData
            
        }
        )
    }
}

struct ChartData:Hashable, Comparable, Equatable{
    static func < (lhs: ChartData, rhs: ChartData) -> Bool {
        lhs.date < rhs.date
    }
    
    var date: Date
    var value: Float
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(date)
    }
    
    static func == (lhs: ChartData, rhs: ChartData) -> Bool {
        return lhs.date == rhs.date
      }
}
