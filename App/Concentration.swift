//
//  Concentration.swift
//  App
//
//  Created by Nio Homy on 22.09.2023.
//

import Foundation

struct Concentration {
    private (set) var cards = [Card]()    // Array
    
    private var indexOfOneAndOnlyFaceUpCard: Int?{
        get{
            return cards.indices.filter { (cards[$0].isFaceUp) }.oneAndOnly
        }
        set{
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        /*
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        }
        else{
            cards[index].isFaceUp = true
        }*/
        /**/
        assert(cards.indices.contains(index), "Concentration.chooseCard(\(index)): wrong index!")
        if !cards[index].isMatched {
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index]{
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
    mutating func shuffleCards()
    {
        cards.shuffle()
    }
}

extension Collection{
    var oneAndOnly: Element?{
        return count == 1 ? first : nil
    }
}
