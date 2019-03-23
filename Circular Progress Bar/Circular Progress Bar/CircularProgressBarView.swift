//
//  CircularProgressBarView.swift
//  Circular Progress Bar
//
//  Created by Dooth Developer 10 on 23/03/19.
//  Copyright © 2019 Dooth Developer 10. All rights reserved.
//

import Foundation
import UIKit

class CircularProgressBarView: UIView {
    
    var progressLineColor = UIColor.red
    var progressDuration = 60
    
    override func awakeFromNib() {
        drawCircularProgressBar()
    }
    
    func drawCircularProgressBar() {
        let center = CGPoint(x: self.frame.width/2, y: self.frame.width/2)
        let radius: CGFloat = self.frame.width/2 * 0.83
        let startAngle = CGFloat(-0.5 * .pi)
        let endAngle = CGFloat(1.5 * .pi)
        
        let circlePath = UIBezierPath.init(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.strokeColor = progressLineColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 4.0
        shapeLayer.strokeStart = 0
        shapeLayer.strokeEnd = 0.25
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = CFTimeInterval(progressDuration)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        
        shapeLayer.add(animation, forKey: "ani")
        
        self.layer.addSublayer(shapeLayer)
        
        
    }
}
