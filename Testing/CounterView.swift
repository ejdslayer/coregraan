//
//  CounterView.swift
//  Testing
//
//  Created by Elliott D'Alvarez on 30/11/2016.
//  Copyright © 2016 EJD. All rights reserved.
//

import UIKit

let NoOfGlasses = 8
let π:CGFloat = CGFloat(M_PI)

@IBDesignable class CounterView: UIView {
    
    @IBInspectable var counter: Int = 5 {
        didSet {
            if counter <=  NoOfGlasses {
                //the view needs to be refreshed
                setNeedsDisplay()
            }
        }
    }
    @IBInspectable var outlineColor: UIColor = UIColor.blue
    @IBInspectable var counterColor: UIColor = UIColor.orange
    var circleAnimation: CAKeyframeAnimation?
    var testAnimation: CABasicAnimation?
    var pathLayer: CAShapeLayer?
    
    override func draw(_ rect: CGRect) {
        
        self.layer.sublayers?.removeAll()
        
        // 1
        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
        
        // 2
        let radius: CGFloat = max(bounds.width, bounds.height)
        
        // 3
        let arcWidth: CGFloat = 76
        
        // 4
        let startAngle: CGFloat = 3 * π / 4
        let endAngle: CGFloat = π / 4
        
        // 5
        let path = UIBezierPath(arcCenter: center,
                                radius: radius/2 - arcWidth/2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        
        // 6
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        
        //1 - first calculate the difference between the two angles
        //ensuring it is positive
        let angleDifference: CGFloat = 2 * π - startAngle + endAngle
        
        //then calculate the arc for each single glass
        let arcLengthPerGlass = angleDifference / CGFloat(NoOfGlasses)
        
        //then multiply out by the actual glasses drunk
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        //2 - draw the outer arc
        let outlinePath = UIBezierPath(arcCenter: center,
                                       radius: bounds.width/2 - 2.5,
                                       startAngle: startAngle,
                                       endAngle: outlineEndAngle,
                                       clockwise: true)
        
        
        //Create a CAShape Layer
        let pathLayer: CAShapeLayer = CAShapeLayer()
        pathLayer.frame = self.bounds
        pathLayer.path = outlinePath.cgPath
        pathLayer.strokeColor = UIColor.red.cgColor
        pathLayer.fillColor = nil
        pathLayer.lineWidth = 2.0
        pathLayer.lineJoin = kCALineJoinBevel
        
        //Add the layer to your view's layer
        self.layer.addSublayer(pathLayer)
        
        //This is basic animation, quite a few other methods exist to handle animation see the reference site answers
        let pathAnimation: CABasicAnimation = CABasicAnimation(keyPath:"strokeEnd")
        pathAnimation.duration = 2.0
        pathAnimation.fromValue = 0.0
        pathAnimation.toValue = 1.0
        //Animation will happen right away
        pathLayer.add(pathAnimation, forKey: "strokeEnd")
        /*
        //3 - draw the inner arc
        outlinePath.addArc(withCenter: center,
                                     radius: bounds.width/2 - arcWidth + 2.5,
                                     startAngle: outlineEndAngle,
                                     endAngle: startAngle,
                                     clockwise: false)
        
        //4 - close the path
        outlinePath.close()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = 5.0
        outlinePath.stroke()*/
        
        /*let animationLayer = CALayer()
        animationLayer.frame = self.bounds
        self.layer.addSublayer(animationLayer)
        
        let pathLayer = CAShapeLayer()
        pathLayer.frame = self.layer.bounds
        pathLayer.bounds = self.layer.bounds
        pathLayer.isGeometryFlipped = false
        pathLayer.path = outlinePath.cgPath
        pathLayer.strokeColor = self.outlineColor.cgColor
        pathLayer.fillColor = nil
        pathLayer.lineWidth = 5.0
        pathLayer.lineJoin = kCALineJoinBevel
        animationLayer.addSublayer(pathLayer)
        self.pathLayer = pathLayer*/
        
        /*self.testAnimation = CABasicAnimation(keyPath: "test")
        self.testAnimation?.fromValue = 0.0
        self.testAnimation?.toValue = 1.0
        self.testAnimation?.duration = 10.0*/
        
        /*self.circleAnimation = CAKeyframeAnimation()
        self.circleAnimation?.keyPath = "position"
        self.circleAnimation?.path = outlinePath.cgPath
        self.circleAnimation?.duration = 4*/
    }
}
