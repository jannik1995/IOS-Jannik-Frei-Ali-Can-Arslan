//
//  DropDown.swift
//  CryptoApp
//
//  Created by Ali Can Arslan on 13.12.22.
//

import Foundation
import SwiftUI


struct DropDownSelection: View{
    
    @StateObject var viewModel: ListViewModel = ListViewModel.model
        
    //MARK: - BODY
        
    var body: some View{
        GroupBox(){
            DisclosureGroup("Sort") {
                Divider().padding(.vertical, 2)
                DropDownSelectionElement(text: "Marked Cap")
                    .backgroundStyle(viewModel.sortBy == Sort.marketCap ?  .blue : .gray)
                    .onTapGesture {
                        viewModel.sortListBy(sort: Sort.marketCap)
                    print("pressed")
                }
                Divider().padding(.vertical, 2)
                DropDownSelectionElement(text: "Name")
                    .backgroundStyle(viewModel.sortBy == Sort.name ?  .blue : .gray)
                    .onTapGesture {
                    viewModel.sortListBy(sort: Sort.name) 
                }
                
                Divider().padding(.vertical, 2)
                DropDownSelectionElement(text: "Price")
                    .backgroundStyle(viewModel.sortBy == Sort.price ?  .blue : .gray)
                    .onTapGesture {
                    viewModel.sortListBy(sort: Sort.price)
                }
            }
        }
    }
}
