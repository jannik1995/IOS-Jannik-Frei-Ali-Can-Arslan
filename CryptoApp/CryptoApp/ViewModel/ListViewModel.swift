//
//  ListViewModel.swift
//  CryptoApp
//
//  Created by Ali Can Arslan on 10.12.22.
//

import Foundation

class ListViewModel: ObservableObject {
    
    static let model = ListViewModel()
    
    
    private init(){
    }
    
    
    let model = Model()
    
    @Published var coins: [Coin] = [Coin(id: "Default", symbol: "Default", name: "Default", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", current_price: 0, market_cap: 0, market_cap_rank: 0, high_24h: 0, low_24h: 0, price_change_percentage_24h: 0, circulating_supply: 0, total_supply: 0)]
    
    var sortBy = Sort.marketCap
    
    func getListOfCoins() {
        model.getListOfCoins(onSuccess: {
            var unsortedCoins = self.model.coins ?? [Coin(id: "FAILURE API CALL", symbol: "FAILURE API CALL", name: "Default", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", current_price: 0, market_cap: 0, market_cap_rank: 0, high_24h: 0, low_24h: 0, price_change_percentage_24h: 0, circulating_supply: 0, total_supply: 0)]
            self.sortCoins(coins: unsortedCoins)
            
        }
        )
    }
    
    func sortListBy(sort: Sort){
        if (self.sortBy != sort){
            self.sortBy = sort
            sortCoins(coins: self.coins)
        }
        
    }
    
    
    private func sortCoins(coins: [Coin]){
        
        switch self.sortBy {
        case .name:
            self.coins = self.sortListByName(coins: coins)
        case .marketCap:
            self.coins = self.sortListByMarketCap(coins: coins)
        case .price:
            self.coins = self.sortListByPrice(coins: coins)
        }
    }
    
    private func sortListByName(coins: [Coin]) -> [Coin] {
        print("sortByName")
        return coins.sorted{
            $0.name < $1.name
        }
    }
    
    private func sortListByMarketCap(coins: [Coin]) -> [Coin]{
        print("sortByMarketCap")
        return coins.sorted{
            $0.market_cap_rank < $1.market_cap_rank
        }
    }
    
    private func sortListByPrice(coins: [Coin]) -> [Coin]{
        print("sortByPrice")
        return coins.sorted{
            $0.current_price > $1.current_price
        }
    }
    
}

enum Sort{
    case name, marketCap, price
}

