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
    
    var exchangeRate: [ChartData]
    
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
                    ForEach(self.exchangeRate, id: \.self) { item in
                        LineMark(
                            x: .value("Time", item.date),
                            y: .value("Value", item.value)
                        )
                        AreaMark(
                            x: .value("Time", item.date),
                            y: .value("Value", item.value)
                        )
                        .foregroundStyle(curGradient)
                    }
                }
                .frame(height: 300)
            }
        }
    }
}
        