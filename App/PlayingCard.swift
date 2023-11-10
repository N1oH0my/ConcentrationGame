//
//  PlayingCard.swift
//  App
//
//  Created by Nio Homy on 09.11.2023.
//

import Foundation

struct PlayingCard : CustomStringConvertible{
    var description: String { return "\(rank)\(suit)"}
    
    var suit: Suit
    var rank: Rank

    enum Suit: String, CustomStringConvertible{
        var description: String {return rawValue}
        
        case spades = "♠️"
        case hearts = "♥️"
        case clubs = "♣️"
        case diamonds = "♦️"
        
        static var all = [Suit.spades, .clubs, .diamonds, .hearts]
    }
    
    enum Rank: CustomStringConvertible{
        var description: String {
               switch self {
               case .ace:
                   return "Ace"
               case .numeric(let pips):
                   return String(pips)
               case .face(let kind):
                   return kind
               }
        }
        case ace
        case face(String)
        case numeric(pipsCount: Int)
        
        var order: Int{
            switch self {
            case .ace:
                return 1
            case .numeric(let pips):
                return pips
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
                
            default:
                return 0
            }
            
        }
        static var all: [Rank]{
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numeric(pipsCount: pips))
            }
            allRanks += [Rank.face("J"),Rank.face("Q"),Rank.face("K")]
            return allRanks
        }
    }
}

