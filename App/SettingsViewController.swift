//
//  SettingsViewController.swift
//  App
//
//  Created by Nio Homy on 19.10.2023.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    var themeSelectionHandler: (([String]) -> Void)?
    
    
    @IBOutlet weak var themeNatureButton: UIButton!
    @IBOutlet weak var themeSpaceButton: UIButton!
    @IBOutlet weak var themeFoodButton: UIButton!
    @IBOutlet weak var randomThemeButton: UIButton!

    var theme: [String] = ["🍄", "🌿", "🤸🏻","🌱", "🎋", "🌵", "☘️", "🍀", "🗿","🕸", "🍁", "🌼"]
    
    let themes = [
        ["🍄", "🌿", "🤸🏻","🌱", "🎋", "🌵", "☘️", "🍀", "🗿","🕸", "🍁", "🌼"],
        ["🚀", "🌌", "🌠", "🌕", "👨‍🚀", "🌖", "🌓", "🌏", "🌞", "🛰️", "🪐", "🌑"],
        ["🍔", "🍕", "🌮", "🍣", "🥗", "🍩", "🍦", "🍓", "🍉", "🍇", "🥕", "🍟"],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        themeNatureButton.addTarget(self, action: #selector(themeButton1Tapped), for: .touchUpInside)
        themeNatureButton.addTarget(self, action: #selector(themeButton2Tapped), for: .touchUpInside)
        themeFoodButton.addTarget(self, action: #selector(themeButton3Tapped), for: .touchUpInside)
        randomThemeButton.addTarget(self, action: #selector(randomThemeButtonTapped), for: .touchUpInside)
    }

    
    @IBAction func closeSettings() {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func applyTheme() {
        let selectedTheme = theme
        
        themeSelectionHandler?(selectedTheme)
        closeSettings()
    }

    @objc func themeButton1Tapped() {
        theme = themes[0]
    }

    @objc func themeButton2Tapped() {
        theme = themes[1]
    }

    @objc func themeButton3Tapped() {
        theme = themes[2]
    }
    @objc func randomThemeButtonTapped() {
            let randomIndex = Int.random(in: 0..<themes.count)
            theme = themes[randomIndex]
        }
}

