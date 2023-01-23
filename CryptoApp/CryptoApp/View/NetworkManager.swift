//
//  NetworkManager.swift
//  CryptoApp
//
//  Created by Jannik Frei on 20.12.22.
//

import Foundation
import Network

class NetworkManager: ObservableObject{
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkManager")
    @Published var isConnected = true
    @Published var isNotConnected = false
    
    var imageName: String{
        return isConnected ? "wifi" : "wifi.slash"
    }
    
    var connectionDescription: String{
        if isConnected{
            return "Internverbindung steht"
        }else{
            return "Keine aktive Internetverbindung"
        }
        
    }
    
    var Conection: Bool{
        if isConnected{
            isNotConnected = false
            return isNotConnected
        }else{
            isNotConnected = true
            return isNotConnected
        }
    }
    
    init(){
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
}
