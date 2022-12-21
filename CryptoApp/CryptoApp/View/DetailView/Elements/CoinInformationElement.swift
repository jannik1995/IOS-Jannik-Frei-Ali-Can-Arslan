//
//  CoinInformationElement.swift
//  CryptoApp
//
//  Created by Ali Can Arslan on 21.12.22.
//

import Foundation
import SwiftUI

struct CoinInformationElement: View{
    
    let text: String
    let value: String
    
    var body: some View{
        Divider()
        HStack{
            Text(text)
            Text(value)
        }
        
    }
    
    
}
