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
    
    var difficultyLevel: DifficultyLevel = .easy{
        didSet {
            saveDifficultyLevel()
        }
    }
    
    var emojis = ["🍄", "🌿", "🤸🏻","🌱", "🎋", "🌵", "☘️", "🍀", "🗿","🕸", "🍁", "🌼"]{
        didSet {
            saveEmojis()
        }
    }
    var backupEmojis = ["🍄", "🌿", "🤸🏻","🌱", "🎋", "🌵", "☘️", "🍀", "🗿","🕸", "🍁", "🌼"]{
        didSet {
            saveBackupEmojis()
        }
    }
    
    var backgroundColor: UIColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1) {
        didSet {
            saveBackgroundColor()
        }
    }
    
    private init() {
        loadDifficultyLevel()
        loadEmojis()
        loadBackupEmojis()
        loadBackgroundColor()

    }
    
    private let difficultyLevelDisplayNames: [DifficultyLevel: String] = [
            .easy: "Easy",
            .medium: "Medium",
            .hard: "Hard"
        ]
        
        var displayDifficultyLevel: String {
            return difficultyLevelDisplayNames[difficultyLevel] ?? ""
        }
    private let userDefaults = UserDefaults.standard
        
    private func saveDifficultyLevel() {
        let displayName = difficultyLevelDisplayNames[difficultyLevel]
        userDefaults.set(displayName, forKey: "difficultyLevel")
    }
    
    private func loadDifficultyLevel() {
        if let displayName = userDefaults.string(forKey: "difficultyLevel"),
           let level = difficultyLevelDisplayNames.first(where: { $0.value == displayName })?.key {
            difficultyLevel = level
        }
    }
    
    private func saveEmojis() {
        userDefaults.set(emojis, forKey: "emojis")
    }
    
    private func loadEmojis() {
        if let savedEmojis = userDefaults.object(forKey: "emojis") as? [String] {
            emojis = savedEmojis
        }
    }
    
    private func saveBackupEmojis() {
        userDefaults.set(backupEmojis, forKey: "backupEmojis")
    }
    
    private func loadBackupEmojis() {
        if let savedBackupEmojis = userDefaults.object(forKey: "backupEmojis") as? [String] {
            backupEmojis = savedBackupEmojis
        }
    }
    
    private func saveBackgroundColor() {
        userDefaults.set(NSKeyedArchiver.archivedData(withRootObject: backgroundColor), forKey: "backgroundColor")
    }
    
    private func loadBackgroundColor() {
        if let savedColorData = userDefaults.object(forKey: "backgroundColor") as? Data,
           let color = NSKeyedUnarchiver.unarchiveObject(with: savedColorData) as? UIColor {
            backgroundColor = color
        }
    }
}
