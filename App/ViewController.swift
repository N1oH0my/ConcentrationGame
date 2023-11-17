//
//  ViewController.swift
//  App
//
//  Created by Nio Homy on 14.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var deck = PlayingCardDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
            let playingCardsView = PlayingCardsView()
            playingCardsView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(playingCardsView)
            
            NSLayoutConstraint.activate([
                playingCardsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                playingCardsView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                playingCardsView.widthAnchor.constraint(equalToConstant: 200),
                playingCardsView.heightAnchor.constraint(equalToConstant: 200)
            ])
            
            for _ in 1...10 {
                if let card = deck.draw() {
                    print("\(card)")
                }
            }
    }
    
}
    
extension Int{
    var arc4random: Int{
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


