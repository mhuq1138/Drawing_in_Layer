//
//  ClockLayer.swift
//  TheClock
//
//  Created by Mazharul Huq on 8/8/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ClockLayer: CALayer {
    let minuteHand = HandLayer()
    let hourHand = HandLayer()
    var rotationLayer = CALayer()
    
    override func draw(in con:CGContext){
        let w = self.bounds.width
        let h = self.bounds.height
        
        CATransaction.setDisableActions(true)
        
        var transform = CATransform3DIdentity
        transform.m34 = -1.0/1000.0
        self.sublayerTransform = transform
        
        let transformLayer = CATransformLayer()
        transformLayer.frame = self.bounds
        self.addSublayer(transformLayer)
        self.rotationLayer = transformLayer
        
        let g = CAGradientLayer()
        g.contentsScale = UIScreen.main.scale
        g.frame = self.bounds
        g.colors = [UIColor.green.cgColor ,UIColor.blue.cgColor, UIColor.orange.cgColor ]
        g.locations = [0.0,0.5,1.0]

        transformLayer.addSublayer(g)
        
        //The circle
        let circle = CAShapeLayer()
        circle.contentsScale = UIScreen.main.scale
        circle.lineWidth = 2.0
        circle.fillColor = UIColor(red: 0.9, green: 0.85, blue: 0.93, alpha: 0.9).cgColor
        circle.strokeColor = UIColor.gray.cgColor
        let p = CGMutablePath()
        p.addEllipse(in: self.bounds.insetBy(dx: 3, dy: 3))
        circle.path = p
        transformLayer.addSublayer(circle)
        circle.bounds = self.bounds
        circle.position = CGPoint(x: self.bounds.midX,y: self.bounds.midY)
        circle.zPosition = 10
        
        for i in 0...12 {
            let t:CAShapeLayer = CAShapeLayer()
            t.contentsScale = UIScreen.main.scale
            t.lineWidth = 2.0
            t.fillColor = UIColor(red: 0.9, green: 0.0, blue: 0.0, alpha: 0.9).cgColor
            t.strokeColor = UIColor.gray.cgColor
            let p:CGMutablePath = CGMutablePath()
            t.bounds = CGRect(x: 0,y: 0,width: 40,height: 40)
            p.addEllipse(in: t.bounds.insetBy(dx: 10, dy: 10))
            t.path = p
            
            t.position = CGPoint(x: circle.bounds.midX,
                                 y: circle.bounds.midY)
            let vert:CGFloat = circle.bounds.midY / t.bounds.height
            t.anchorPoint = CGPoint(x: 0.5, y: vert)
            let rot:CGFloat = (.pi/6)*CGFloat(i)
            t.transform = CATransform3DMakeRotation(rot, 0, 0, 1)
            circle.addSublayer(t)
        }
        
        // "peg"
        let peg = CAShapeLayer()
        peg.contentsScale = UIScreen.main.scale
        peg.bounds = CGRect(x: 0,y: 0,width: 1.5,height: 10)
        let p2 = CGMutablePath()
        p2.addRect(peg.bounds)
        peg.path = p2
        //CGPathRelease(p2)
        peg.fillColor = UIColor.black.cgColor
        peg.anchorPoint = CGPoint(x: 0.5,y: 0.5)
        peg.position = CGPoint(x: transformLayer.bounds.midX  ,  y: transformLayer.bounds.midY )
        transformLayer.addSublayer(peg)
        //Makes the peg perpendicular to the plane of the circle
        peg.setValue(.pi/2.0, forKeyPath: "transform.rotation.x")
        peg.setValue(.pi/2.0, forKeyPath: "transform.rotation.z")
        
        peg.zPosition = 15
        
        //Minute Hand
        self.minuteHand.contentsScale = UIScreen.main.scale
        let f1 =  CGRect(x: 0,y: 0,width: 0.04*w,height: 0.5*h)
        self.minuteHand.frame = f1
        self.minuteHand.setColor(UIColor.green)
        circle.addSublayer(self.minuteHand)
        self.minuteHand.setNeedsDisplay()
        self.minuteHand.position = CGPoint(x: circle.bounds.midX,
                                      y: circle.bounds.midY)
        self.minuteHand.zPosition = 20
        
        //Hour hand
        self.hourHand.contentsScale = UIScreen.main.scale
        let f2 =  CGRect(x: 0,y: 0,width: 0.06*w,height: 0.4*h)
        self.hourHand.frame = f2
        self.hourHand.setColor(UIColor.blue)
        circle.addSublayer(self.hourHand)
        self.hourHand.setNeedsDisplay()
        self.hourHand.position = CGPoint(x: circle.bounds.midX,
                                    y: circle.bounds.midY)
        self.hourHand.zPosition = 15
        
        self.hourHand.setAffineTransform(CGAffineTransform(rotationAngle: .pi/2.0))
        
        
    }
    
    func changeTime(_ angle:CGFloat){
        self.minuteHand.transform = CATransform3DRotate(self.minuteHand.transform, angle, 0, 0, 1)
        self.hourHand.transform = CATransform3DRotate(self.hourHand.transform, angle/12.0, 0, 0, 1)  
    }
    
    func rotateClock() {
        self.rotationLayer.anchorPoint = CGPoint(x: 1.0,y: 0.5)
        self.rotationLayer.position = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        self.rotationLayer.transform = CATransform3DMakeRotation(.pi/3.0, 0, 1, 0)
    }

}
