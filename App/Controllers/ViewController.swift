//
//  ViewController.swift
//  App
//
//  Created by Nio Homy on 14.09.2023.
//

import UIKit

class ViewController: UIViewController, SettingsDelegate  {
    let difficultyLevel = GameSettings.shared.difficultyLevel
        
    lazy var game = Concentration(difficultyLevel: difficultyLevel)
    
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var helpButton: UIButton!
    
    @IBOutlet var shuffleButton: UIButton!
    
    @IBOutlet weak var flipCountLabel: UILabel!{
        didSet{
            navigationController?.isNavigationBarHidden = true
        }
    }
    
    
    @IBOutlet var cardButtons: [UIButton]!{
        didSet{
            for index in cardButtons.indices {
                cardButtons[index].isHidden = true
            }
        }
    }
    
    @IBAction func touchSomeCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            print("cardNumber = \(cardNumber ?? -1)")
            } else {
                    print("Кнопка не найдена в массиве cardButtons")
                }
        
    }
    @IBAction func shuffleCards() {
        game.shuffleCards()
        
        updateViewFromModel()
    }
    
    
    var emoji = Dictionary<Int, String>()
    func getEmoji(for card: Card)-> String
    {
        if emoji[card.cardId] == nil, GameSettings.shared.emojis.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(GameSettings.shared.emojis.count)))
            emoji[card.cardId] = GameSettings.shared.emojis.remove(at: randomIndex)
        }
        
        return emoji[card.cardId] ?? "?"
        
    }
    func didChangeTheme() {
            startNewGame()
        }
    @objc func updateViewFromModel(){
        for index in 0..<game.numberOfCardsToShow {
                cardButtons[index].isHidden = false
                let button = cardButtons[index]
                let card = game.cards[index]
                if card.isFaceUp {
                    button.setTitle(getEmoji(for: card), for: UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                }
                else{
                    button.setTitle("", for: UIControl.State.normal)
                    button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 0):GameSettings.shared.backgroundColor
                }
                
            
            
            scoreLabel.text = "Score: \(game.score)"
        }
        
        func viewDidLoad() {
            super.viewDidLoad()
            
            navigationController?.isNavigationBarHidden = true
            
            
            startNewGame()
            
            /*NotificationCenter.default.addObserver(self, selector: #selector(updateViewFromModel), name: Notification.Name("EmojisChanged"), object: nil)*/
                
        }
        
        

        func flipCard(withEmoji emoji: String, on button: UIButton) {
            print("flipCard(withEmoji: \(emoji))")
            if button.currentTitle == emoji {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = GameSettings.shared.backgroundColor
            }
            else{
                button.setTitle(emoji, for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
        }
    }
    
    var helpUsed = false

    @IBAction func useHelpButton(_ sender: UIButton) {
        if !helpUsed {
            for index in 0..<game.numberOfCardsToShow {
                let button = cardButtons[index]
                let card = game.cards[index]
                if !card.isMatched && !card.isFaceUp {
                    UIView.transition(with: button, duration: 0.75, options: [.transitionFlipFromLeft], animations: {
                        button.setTitle(self.getEmoji(for: card), for: UIControl.State.normal)
                        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    }, completion: { finished in
                        if finished {
                            UIView.transition(with: button, duration: 0.75, options: [.transitionFlipFromRight], animations: {
                                button.setTitle("", for: UIControl.State.normal)
                                button.backgroundColor = GameSettings.shared.backgroundColor
                            }, completion: nil)
                        }
                    })
                }
                
            }
            helpUsed = true
            helpButton.backgroundColor = UIColor.blue
        }
    }
    
    @IBAction func startNewGame() {//доделать с настройками потом
        let difficultyLevel = GameSettings.shared.difficultyLevel
        game = Concentration(difficultyLevel: difficultyLevel)
         //game = Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)
        if GameSettings.shared.emojis.isEmpty {
                GameSettings.shared.emojis = GameSettings.shared.backupEmojis
        }
        
        emoji = [Int:String]()
        flipCount = 0
        helpUsed = false
        helpButton.backgroundColor = UIColor.white
        
        for index in game.numberOfCardsToShow..<cardButtons.count {
            cardButtons[index].isHidden = true
        }
         updateViewFromModel()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let settingsViewController = segue.destination as? SettingsViewController {
                settingsViewController.delegate = self
            }
        }
    }

    



