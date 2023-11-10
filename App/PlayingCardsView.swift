//
//  PlayingCardsView.swift
//  App
//
//  Created by Nio Homy on 10.11.2023.
//

import SwiftUI

class PlayingCardsView: UIView {
    override func draw(_ rect: CGRect){
        if let context = UIGraphicsGetCurrentContext(){
            context.addArc(center: CGPoint(x: bounds.midX, y: bounds.midY), radius: 100.0, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        }
    }
}
