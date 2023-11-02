//
//  SettingsViewController.swift
//  App
//
//  Created by Nio Homy on 19.10.2023.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    weak var delegate: SettingsDelegate?
    
    var themeSelectionHandler: (([String]) -> Void)?
    var backgroundColorSelectionHandler: ((UIColor) -> Void)?
    
    
    @IBOutlet weak var themeNatureButton: UIButton!
    @IBOutlet weak var themeSpaceButton: UIButton!
    @IBOutlet weak var themeFoodButton: UIButton!
    @IBOutlet weak var randomThemeButton: UIButton!

    var theme: [String] = ["🍄", "🌿", "🤸🏻","🌱", "🎋", "🌵", "☘️", "🍀", "🗿","🕸", "🍁", "🌼"]
    var backgroundColor=#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    
    let themes = [
        ["🍄", "🌿", "🤸🏻","🌱", "🎋", "🌵", "☘️", "🍀", "🗿","🕸", "🍁", "🌼"],
        ["🚀", "🌌", "🌠", "🌕", "👨‍🚀", "🌖", "🌓", "🌏", "🌞", "🛰️", "🪐", "🌑"],
        ["🍔", "🍕", "🌮", "🍣", "🥗", "🍩", "🍦", "🍓", "🍉", "🍇", "🥕", "🍟"],
    ]
    let colorThemes: [UIColor] = [
        #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1),
        #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),
        #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        themeNatureButton.addTarget(self, action: #selector(themeButton1Tapped), for: .touchUpInside)
        themeSpaceButton.addTarget(self, action: #selector(themeButton2Tapped), for: .touchUpInside)
        themeFoodButton.addTarget(self, action: #selector(themeButton3Tapped), for: .touchUpInside)
        randomThemeButton.addTarget(self, action: #selector(randomThemeButtonTapped), for: .touchUpInside)
    }

    
    @IBAction func closeSettings() {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func applyTheme() {
        let selectedTheme = theme
        let selectedBackgroundColor = backgroundColor
        //backgroundColorSelectionHandler?(selectedBackgroundColor)
        //themeSelectionHandler?(selectedTheme)
        
        GameSettings.shared.emojis = selectedTheme
        GameSettings.shared.backupEmojis = selectedTheme
        GameSettings.shared.backgroundColor = selectedBackgroundColor
        
        delegate?.didChangeTheme()
        closeSettings()
    }

    @objc func themeButton1Tapped() {
        theme = themes[0]
        backgroundColor = colorThemes[0]
    }

    @objc func themeButton2Tapped() {
        theme = themes[1]
        backgroundColor = colorThemes[1]
    }

    @objc func themeButton3Tapped() {
        theme = themes[2]
        backgroundColor = colorThemes[2]
    }
    @objc func randomThemeButtonTapped() {
            let randomIndex = Int.random(in: 0..<themes.count)
            theme = themes[randomIndex]
            backgroundColor = colorThemes[randomIndex]
        }
}

