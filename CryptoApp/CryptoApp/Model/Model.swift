//
//  Model.swift
//  CryptoApp
//
//  Created by Ali Can Arslan on 10.12.22.
//

import Foundation
import SwiftUI


class Model {
    var coins: [Coin]?
    var exchangeRate24h: ExchangeRate24h?
    
    func getListOfCoins(onSuccess: @escaping ()->Void ) {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error ) in
            if  let data{
                self.coins = try? JSONDecoder().decode([Coin].self, from: data)
                print(self.coins)
                onSuccess()
            }
            
        }
        .resume()
    }
    
    func getExchangeRate24h(id: String , onSuccess: @escaping ()->Void ) {
        /*guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/" + id + "/market_chart?vs_currency=usd&days=10&interval=daily") else {
            return
        }*/
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/" + id + "/market_chart?vs_currency=usd&days=10&interval=daily")
        else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error ) in
            if  let data{
                self.exchangeRate24h = try? JSONDecoder().decode(ExchangeRate24h.self, from: data)
                onSuccess()
            }
            
        }
        .resume()
    }
}

struct Coin: Codable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let current_price: Float
    let market_cap: Int
    let market_cap_rank: Int
    let high_24h: Float
    let low_24h: Float
    let price_change_percentage_24h: Float
    let circulating_supply: Double
    let total_supply: Double?
}

struct ExchangeRate24h: Codable{
    var prices: [[Float]]
}
