//
//  Card.swift
//  App
//
//  Created by Nio Homy on 22.09.2023.
//

import Foundation

struct Card {
    var cardId: Int
    
    var isFaceUp = false
    
    var isMatched = false
    
    static var factoryId = 0
    
    static func getUniqueId() -> Int{
        factoryId += 1
        return Card.factoryId
    }
    init() {
        self.cardId = Card.getUniqueId()
    }
}
