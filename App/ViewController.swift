//
//  ViewController.swift
//  App
//
//  Created by Nio Homy on 14.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2) // пока ее не используют она не инициализируется
    
    private (set) var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var shuffleButton: UIButton!
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchSomeCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            print("cardNumber = \(cardNumber ?? -1)")
            } else {
                    print("Кнопка не найдена в массиве cardButtons")
                }
        
    }
    @IBAction private func shuffleCards() {
        game.shuffleCards()
        
        updateViewFromModel()
    }
    private var emojis = ["🍄", "🌿", "🤸🏻","🌱", "🎋", "🌵"]
    private var emoji = Dictionary<Int, String>()
    private func getEmoji(for card: Card)-> String
    {
        if emoji[card.cardId] == nil, emojis.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojis.count)))
            emoji[card.cardId] = emojis.remove(at: randomIndex)
        }
        
        return emoji[card.cardId] ?? "?"
        
    }
    
    private func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp && card.isMatched{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 0):#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            }
            else if card.isFaceUp {
                button.setTitle(getEmoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 0):#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        }
    }
    
    func viewDidLoad() {
            super.viewDidLoad()
    }
    
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        print("flipCard(withEmoji: \(emoji))")
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5029296378, blue: 0.1438817539, alpha: 1)
        }
        else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    }
}


