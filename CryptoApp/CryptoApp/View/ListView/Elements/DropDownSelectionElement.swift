//
//  DropDown.swift
//  CryptoApp
//
//  Created by Ali Can Arslan on 13.12.22.
//

import Foundation
import SwiftUI


struct DropDownSelectionElement: View{
    
    let text: String
    
    //MARK: - BODY
        
    var body: some View{
        GroupBox(){
            HStack{
                Group{
                    Text(text)
                }//: GROUP
                .font(.system(.body).bold())
            }//: HSTACK

        }//: BOX
    }
}
