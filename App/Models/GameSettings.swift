//
//  GameSettings.swift
//  App
//
//  Created by Nio Homy on 02.11.2023.
//

import Foundation
import UIKit
enum DifficultyLevel {
    case easy
    case medium
    case hard

    var numberOfPairsOfCards: Int {
        switch self {
        case .easy:
            return 4
        case .medium:
            return 6
        case .hard:
            return 12
        }
    }

    var numberOfCardsToShow: Int {
        switch self {
        case .easy:
            return 8
        case .medium:
            return 12
        case .hard:
            return 24
        }
    }
}

class GameSettings {
    static let shared = GameSettings()
    
    var difficultyLevel: DifficultyLevel = .easy
    
    var emojis = ["🍄", "🌿", "🤸🏻","🌱", "🎋", "🌵", "☘️", "🍀", "🗿","🕸", "🍁", "🌼"]
    var backupEmojis = ["🍄", "🌿", "🤸🏻","🌱", "🎋", "🌵", "☘️", "🍀", "🗿","🕸", "🍁", "🌼"]
    
    var backgroundColor: UIColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1) 
    
    private init() {}
}
