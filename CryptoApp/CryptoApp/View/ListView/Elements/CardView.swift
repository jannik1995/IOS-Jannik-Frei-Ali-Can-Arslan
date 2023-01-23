//
//  CardView.swift
//  CryptoApp
//
//  Created by Ali Can Arslan on 11.12.22.
//

import Foundation
import SwiftUI


struct CardView: View{
    
    var coin: Coin
    
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: coin.image), scale: 6)
            VStack(alignment: .leading){
                Text(coin.name)
                Text(coin.symbol)
            }
            

            VStack(alignment: .trailing){
                Text("$ " + String(coin.current_price))
                Text(String(coin.price_change_percentage_24h) + " %")
                    .foregroundColor(coin.price_change_percentage_24h >= 0 ? .green : .red)
            }.frame(maxWidth: .infinity, alignment: .trailing)

            
        }
        
    }
}
