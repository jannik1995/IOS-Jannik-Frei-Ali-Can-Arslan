//
//  LineChartTabs.swift
//  CryptoApp
//
//  Created by Ali Can Arslan on 21.12.22.
//

import Foundation
import SwiftUI

struct LineChartTabs: View{
    
    
    
    var body: some View {
        
        TabView {
            Text("View 1")
                .onTapGesture {
                    
                }
                .tabItem{
                    Label("Tab 1", systemImage: "car")
                }
            Text("View 2")
                .tabItem{
                    Label("Tab 2", systemImage: "car.2.fill")
                }
            Text("View 3")
                .tabItem{
                    Label("Tab 3", systemImage: "fuelpump.fill")
                }
        }
    }
}
