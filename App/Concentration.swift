//
//  Concentration.swift
//  App
//
//  Created by Nio Homy on 22.09.2023.
//

import Foundation

class Concentration {
    var cards = [Card]()    // Array
    
    func chooseCard(at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        }
        else{
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        // ..< like (), ... like []
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        shuffleCards()
        
    }
    func shuffleCards()
    {
        cards.shuffle()
    }
}
