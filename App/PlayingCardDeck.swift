//
//  PlayingCardDeck.swift
//  App
//
//  Created by Nio Homy on 09.11.2023.
//

import Foundation

struct PlayingCardDeck{
    private(set) var cards = [PlayingCard]()
    
    init(){
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    
    mutating func draw()-> PlayingCard?{
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4randomm)
        }
        else{
            return nil
        }
    }
}
extension Int{
    var arc4randomm: Int{
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if(self<0)
        {
            return -Int(arc4random_uniform(UInt32(self)))
        }
        else{
            return 0
        }
        
    }
}
