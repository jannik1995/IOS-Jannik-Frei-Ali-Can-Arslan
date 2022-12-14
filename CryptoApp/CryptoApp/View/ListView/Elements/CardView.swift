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
            Text("Image")
            VStack (alignment: .leading){
                Text(coin.name)
                Text(coin.id)
            }
            Text(String(coin.current_price))
        }
    }
}
