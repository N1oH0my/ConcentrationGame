//
//  Concentration.swift
//  App
//
//  Created by Nio Homy on 22.09.2023.
//

import Foundation

class Concentration {
    var cards = [Card]()    // Array
    
    var indexOfOneAndOnlyFaceUpCard: Int?{
        get{
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp
                {
                    if foundIndex==nil {
                        foundIndex = index
                    }
                    else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        /*
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        }
        else{
            cards[index].isFaceUp = true
        }*/
        /**/
         
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].cardId == cards[index].cardId {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            }
            else{
                indexOfOneAndOnlyFaceUpCard = index
            }
            
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
