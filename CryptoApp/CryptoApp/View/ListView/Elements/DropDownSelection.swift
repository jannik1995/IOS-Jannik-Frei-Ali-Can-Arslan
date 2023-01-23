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
            HStack {
                Button(action: {
                    viewModel.sortListBy(sort: Sort.name)
                }) {
                    Text("Name")
                }
                .foregroundColor(viewModel.sortBy == Sort.name ? Color.blue : Color.gray)
                Button(action: {
                    viewModel.sortListBy(sort: Sort.marketCap)
                }) {
                    Text("Marked Cap")
                }
                .foregroundColor(viewModel.sortBy == Sort.marketCap ? Color.blue : Color.gray)
                Button(action: {
                    viewModel.sortListBy(sort: Sort.price)
                }) {
                    Text("Price")
                }
                .foregroundColor(viewModel.sortBy == Sort.price ? Color.blue : Color.gray)
            }
        }
    }
}


