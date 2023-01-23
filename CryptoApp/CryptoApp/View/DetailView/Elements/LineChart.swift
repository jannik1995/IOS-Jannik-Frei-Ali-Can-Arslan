//
//  LineChart.swift
//  CryptoApp
//
//  Created by Ali Can Arslan on 11.12.22.
//

import Foundation
import Charts
import SwiftUI

struct LineChart: View{
    
    @StateObject var viewModel: DetailViewModel
    
    var body: some View {
        
        let curColor = Color(.blue)
        let curGradient = LinearGradient(
            gradient: Gradient (
                colors: [
                    curColor.opacity(0.5),
                    curColor.opacity(0.2),
                    curColor.opacity(0.05),
                ]
            ),
            startPoint: .top,
            endPoint: .bottom
        )
        
        VStack() {
            GroupBox ( "Line Chart - Combine LIne and Area chart") {
                
                Chart {
                    ForEach(self.viewModel.chartData, id: \.self) { item in
                        LineMark(
                            x: .value("Time", item.date),
                            y: .value("Value", item.value)
                        )
                        AreaMark(
                            x: .value("Time", item.date),
                            yStart: .value("amount", item.value),
                                // get the max close value or adjust to your use case
                            yEnd: .value("amountEnd", viewModel.min)
                        )
                        .foregroundStyle(curGradient)
                    }
                }.onAppear{
                    viewModel.getexchangeData(days: 7, intervall: "daily", dateformat: "MM/dd/hh:mm")
                    
                }
                .chartYAxis {
                            AxisMarks(position: .leading)
                        }
                .chartYScale(domain: viewModel.min...viewModel.max)
                .frame(height: 300)
            }
        }
    }
}
        
