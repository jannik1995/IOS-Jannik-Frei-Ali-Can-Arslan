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
    
    var min: Float = 0.0
    var max: Float = 0.0
    
    init(coin: Coin){
        self.coin = coin
     }
    
    func getexchangeData(days: Int, intervall: String, dateformat: String){
        model.getExchangeRate24h(id: coin.id, days: String(days), interval: intervall, onSuccess: {
            var exchangeRate24h = self.model.exchangeRate24h ?? ExchangeRate24h(prices: [[0, 0]])
            
            var currentTime = Float(Date().timeIntervalSince1970 * 1000.0)
            
            let dateFormatter = DateFormatter()
             
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .none
            dateFormatter.dateFormat = dateformat
            dateFormatter.locale = Locale.current
            
            var temp: [ChartData] = []
            
            
            print("Data Point: " + String(exchangeRate24h.prices.count))
            
            self.min = exchangeRate24h.prices[0][1]
            self.max = exchangeRate24h.prices[0][1]
            
            for i in exchangeRate24h.prices.indices {
                
                let date = Date(timeIntervalSince1970:Double((exchangeRate24h.prices[i][0])) / 1000.0)
                
                let parsedDate = dateFormatter.string(from:date)
                
                temp.append(ChartData(date: parsedDate, value: exchangeRate24h.prices[i][1]))
                print("Temp: " + parsedDate)
                
                let value = exchangeRate24h.prices[i][1]
                
                if self.min > value{
                    self.min = value
                }
                if self.max < value {
                    self.max = value
                }
                
                
            }
            self.chartData = Array(Set(temp)).sorted(by: {$0.date < $1.date})
            print("Min: " + String(self.min))
            print("Max: " + String(self.max))
            
            for i in self.chartData {
                print("DAte: " + i.date)
            }
        }
        )
        
    }
    
}

struct ChartData:Hashable, Comparable, Equatable{
    static func < (lhs: ChartData, rhs: ChartData) -> Bool {
        lhs.date < rhs.date
    }
    
    var date: String
    var value: Float
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(date)
    }
    
    static func == (lhs: ChartData, rhs: ChartData) -> Bool {
        return lhs.date == rhs.date
      }
}
