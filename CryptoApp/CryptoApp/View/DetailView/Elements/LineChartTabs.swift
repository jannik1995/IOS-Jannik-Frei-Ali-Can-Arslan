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
    
    
    var body: some View {
        
        HStack {
            Text("1D")
                .onTapGesture {
                    viewModel.getexchangeData(days: 1, intervall: "hourly", dateformat: "MM/dd/hh:mm")
                }
            Text("7D")
                .onTapGesture {
                    viewModel.getexchangeData(days: 7, intervall: "daily", dateformat: "MM/dd/hh:mm")
                }
            Text("1M")
                .onTapGesture {
                    viewModel.getexchangeData(days: 31, intervall: "daily", dateformat: "MM")
                }
            Text("3M")
                .onTapGesture {
                    viewModel.getexchangeData(days: 31 * 3, intervall: "monthly", dateformat: "MM")
                }
            Text("1Y")
                .onTapGesture {
                    viewModel.getexchangeData(days: 365, intervall: "monthly", dateformat: "MM")
                }
            Text("2Y")
                .onTapGesture {
                    viewModel.getexchangeData(days: 365 * 2, intervall: "yearly", dateformat: "YYYY")
                }
            Text("5Y")
                .onTapGesture {
                    viewModel.getexchangeData(days: 365 * 5, intervall: "yearly", dateformat: "YYYY")
                }
         
        }
    }
}
