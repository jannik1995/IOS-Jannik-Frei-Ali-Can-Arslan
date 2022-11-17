//
//  FormGenerator.swift
//  MemoryGame
//
//  Created by Ali Can Arslan on 17.11.22.
//

import Foundation
import SwiftUI

class CardObjectWrapper : Equatable {
    let id: Int
    let obj: Any
    init(id: Int, obj:Any) {
        self.id = id
        self.obj = obj
    }

    static func == (lhs: CardObjectWrapper, rhs: CardObjectWrapper) -> Bool { return lhs.id == rhs.id}
}
    
