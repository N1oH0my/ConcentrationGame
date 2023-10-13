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
        /*
         
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].cardId == cards[index].cardId {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            
        }
        else{
            for flipDownIndex in cards.indices {
                cards[flipDownIndex].isFaceUp = false
            }
            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = index
        }*/
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
