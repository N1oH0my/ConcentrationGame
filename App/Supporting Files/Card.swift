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
    
    private static var factoryId = 0
    
    private static func getUniqueId() -> Int{
        factoryId += 1
        return Card.factoryId
    }
    
    init() {
        self.cardId = Card.getUniqueId()
    }
    
}
