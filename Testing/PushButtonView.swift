//
//  PushButtonView.swift
//  Testing
//
//  Created by Elliott D'Alvarez on 30/11/2016.
//  Copyright © 2016 EJD. All rights reserved.
//

import UIKit

@IBDesignable class PushButtonView: UIButton {

    @IBInspectable var fillColor: UIColor = UIColor.green
    @IBInspectable var isAddButton: Bool = true
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        let plusStrokeSize: CGFloat = 3.0
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        let plusHeight: CGFloat = min(bounds.height, bounds.width) * 0.6
        
        //create the path
        let plusPath = UIBezierPath()
        
        //set the path's line width to the height of the stroke
        plusPath.lineWidth = plusStrokeSize
        
        //move the initial point of the path
        //to the start of the horizontal stroke
        plusPath.move(to: CGPoint(
            x:bounds.width/2 - plusWidth/2 + 0.5,
            y:bounds.height/2 + 0.5))
        
        //add a point to the path at the end of the stroke
        plusPath.addLine(to: CGPoint(
            x:bounds.width/2 + plusWidth/2 + 0.5,
            y:bounds.height/2 + 0.5))
        
        if isAddButton {
            //vertical line code moveToPoint(_:) and addLineToPoint(_:)
            
            plusPath.move(to: CGPoint(x:bounds.width/2 + 0.5, y:bounds.height/2 - plusHeight/2 + 0.5))
            
            plusPath.addLine(to: CGPoint(
                x:bounds.width/2 + 0.5,
                y:bounds.height/2 + plusHeight/2 + 0.5))
            
        }
        
        //set the stroke color
        UIColor.white.setStroke()
        
        //draw the stroke
        plusPath.stroke()
    }
    

}
