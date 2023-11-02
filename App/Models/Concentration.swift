//
//  Concentration.swift
//  App
//
//  Created by Nio Homy on 22.09.2023.
//

import Foundation

class Concentration {
    var numberOfCardsToShow: Int = 8
    var cards = [Card]()    // Array
    
    var score = 0
        
        var indexOfTheOneAndOnlyFaceUpCard: Int? {
            get {
                return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
            }
            set {
                for index in cards.indices {
                    cards[index].isFaceUp = (index == newValue)
                }
            }
        }
        
    func chooseCard(at index: Int) {
        if cards[index].isMatched {
            return
        }
        
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            if let matchingIndex = indexOfTheOneAndOnlyFaceUpCard {
                if matchingIndex != index {
                    if cards[matchingIndex].cardId == cards[index].cardId {
                        cards[matchingIndex].isMatched = true
                        cards[index].isMatched = true
                        cards[matchingIndex].isFaceUp = false
                        cards[index].isFaceUp = false
                        score += 1
                    }
                    else{
                        score -= 2
                    }
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
            }
            if !cards[index].isMatched  {
                cards[index].isFaceUp = true
                indexOfTheOneAndOnlyFaceUpCard = index
            }
            
            
        }
    }
    /*init(numberOfPairsOfCards: Int) {
        // ..< like (), ... like []
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        shuffleCards()
        score = 0;
        
    }*/
    
    func shuffleCards()
    {
        cards.shuffle()
    }
    init(difficultyLevel: DifficultyLevel) {
        let numberOfPairsOfCards = difficultyLevel.numberOfPairsOfCards
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }

        shuffleCards()
        score = 0

        numberOfCardsToShow = difficultyLevel.numberOfCardsToShow
    }
    func resetScore()
    {
        score = 0;
    }
}
extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
