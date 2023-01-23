//
//  LineChartTabs.swift
//  CryptoApp
//
//  Created by Ali Can Arslan on 21.12.22.
//

import Foundation
import SwiftUI

struct LineChartTabs: View{
    let viewModel: DetailViewModel
    @State private var selectedTab = 1
    
    
    var body: some View {
        
        HStack {
            Text("1D")
                .foregroundColor(selectedTab == 0 ? .blue : .black)
                .onTapGesture {
                    self.selectedTab = 0
                    viewModel.getexchangeData(days: 1, intervall: "hourly", dateformat: "MM/dd/hh:mm")
                }
            Text("7D")
                .foregroundColor(selectedTab == 1 ? .blue : .black)
                .onTapGesture {
                    self.selectedTab = 1
                    viewModel.getexchangeData(days: 7, intervall: "daily", dateformat: "MM/dd/hh:mm")
                }
            Text("1M")
                .foregroundColor(selectedTab == 2 ? .blue : .black)
                .onTapGesture {
                    self.selectedTab = 2
                    viewModel.getexchangeData(days: 31, intervall: "daily", dateformat: "MM/dd")
                }
            Text("3M")
                .foregroundColor(selectedTab == 3 ? .blue : .black)
                .onTapGesture {
                    self.selectedTab = 3
                    viewModel.getexchangeData(days: 31 * 3, intervall: "monthly", dateformat: "MM/dd")
                }
            Text("1Y")
                .foregroundColor(selectedTab == 4 ? .blue : .black)
                .onTapGesture {
                    self.selectedTab = 4
                    viewModel.getexchangeData(days: 365, intervall: "monthly", dateformat: "MM")
                }
            Text("2Y")
                .foregroundColor(selectedTab == 5 ? .blue : .black)
                .onTapGesture {
                    self.selectedTab = 5
                    viewModel.getexchangeData(days: 365 * 2, intervall: "yearly", dateformat: "YYYY/MM")
                }
            Text("5Y")
                .foregroundColor(selectedTab == 6 ? .blue : .black)
                .onTapGesture {
                    self.selectedTab = 6
                    viewModel.getexchangeData(days: 365 * 5, intervall: "yearly", dateformat: "YYYY")
                }
         
        }
    }
}
