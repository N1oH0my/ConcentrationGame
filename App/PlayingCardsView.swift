//
//  PlayingCardsView.swift
//  App
//
//  Created by Nio Homy on 10.11.2023.
//

import SwiftUI

class PlayingCardsView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear // 设置背景为透明
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if let context = UIGraphicsGetCurrentContext() {
            context.addArc(center: CGPoint(x: bounds.midX, y: bounds.midY), radius: min(bounds.width, bounds.height) / 2.0, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
            context.setFillColor(UIColor.white.cgColor) 
            context.fillPath()
        }
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            
            let diameter = min(bounds.width, bounds.height)
            let radius = diameter / 2.0
            
            var newX = superview?.bounds.midX ?? 0
            var newY = superview?.bounds.midY ?? 0
            
            newX = max(radius, min(newX, superview?.bounds.width ?? 0 - radius))
            newY = max(radius, min(newY, superview?.bounds.height ?? 0 - radius))
            
            center = CGPoint(x: newX, y: newY)
        }
}

