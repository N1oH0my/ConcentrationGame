//
//  GameSettings.swift
//  App
//
//  Created by Nio Homy on 02.11.2023.
//

import Foundation
import UIKit

class GameSettings {
    static let shared = GameSettings()
    
    var emojis = ["🍄", "🌿", "🤸🏻","🌱", "🎋", "🌵", "☘️", "🍀", "🗿","🕸", "🍁", "🌼"] {
        didSet {
            NotificationCenter.default.post(name: Notification.Name("EmojisChanged"), object: nil)
        }
    }
    var backupEmojis = ["🍄", "🌿", "🤸🏻","🌱", "🎋", "🌵", "☘️", "🍀", "🗿","🕸", "🍁", "🌼"]/*{
        didSet {
            NotificationCenter.default.post(name: Notification.Name("EmojisChanged"), object: nil)
        }
    }*/
    
    var backgroundColor: UIColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1) {
        didSet {
            NotificationCenter.default.post(name: Notification.Name("BackgroundColorChanged"), object: nil)
        }
    }
    
    private init() {}
}
