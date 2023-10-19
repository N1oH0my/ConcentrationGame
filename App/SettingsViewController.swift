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
    
    
    @IBOutlet weak var themeButton1: UIButton!
    @IBOutlet weak var themeButton2: UIButton!
    @IBOutlet weak var themeButton3: UIButton!

    var theme: [String] = ["🍄", "🌿", "🤸🏻","🌱", "🎋", "🌵", "☘️", "🍀", "🗿","🕸", "🍁", "🌼"]
    
    let themes = [
        ["🍄", "🌿", "🤸🏻","🌱", "🎋", "🌵", "☘️", "🍀", "🗿","🕸", "🍁", "🌼"],
        ["🚀", "🌌", "🌠", "🌕", "👨‍🚀", "🌖", "🌓", "🌏", "🌞", "🛰️", "🪐", "🌑"],
        ["🍔", "🍕", "🌮", "🍣", "🥗", "🍩", "🍦", "🍓", "🍉", "🍇", "🥕", "🍟"],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        themeButton1.addTarget(self, action: #selector(themeButton1Tapped), for: .touchUpInside)
        themeButton2.addTarget(self, action: #selector(themeButton2Tapped), for: .touchUpInside)
        themeButton3.addTarget(self, action: #selector(themeButton3Tapped), for: .touchUpInside)

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

}

