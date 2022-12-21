//
//  CoinInformation.swift
//  CryptoApp
//
//  Created by Ali Can Arslan on 21.12.22.
//

import Foundation
import SwiftUI

struct CoinInformation: View{
    
    var coin:Coin
    
    var body: some View{
        VStack{
            CoinInformationElement(text: "Market Cap Rank:", value: String(coin.market_cap_rank))
            CoinInformationElement(text: "Market Cap:", value: "$ " + String(coin.market_cap))
            CoinInformationElement(text: "Price:", value: "$ " + String(coin.current_price))
            CoinInformationElement(text: "Available Supply:", value: String(coin.circulating_supply))
            if (coin.total_supply != nil) {
                CoinInformationElement(text: "Total Supply:", value: String(coin.total_supply!))
            }
            CoinInformationElement(text: "24h High:", value: String(coin.high_24h))
            CoinInformationElement(text: "24h Low:", value: String(coin.low_24h))
            Divider()
            HStack{
                Text("24h Change:")
                Text(String(coin.price_change_percentage_24h) + " %").multilineTextAlignment(.leading)
                    .foregroundColor(coin.price_change_percentage_24h > 0 ? .green : .red).multilineTextAlignment(.trailing)
            }
            Divider()
        }
    }
    
    
}
