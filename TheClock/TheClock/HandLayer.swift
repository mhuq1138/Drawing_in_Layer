//
//  HandLayer.swift
//  TheClock
//
//  Created by Mazharul Huq on 8/8/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class HandLayer: CALayer {
    var circleColor:UIColor!
    
    func setColor(_ color:UIColor){
        circleColor = color
    }
    
    override func draw(in con:CGContext) {
        
        let w = self.bounds.size.width
        let h = self.bounds.size.height
        //The hand is drawn by joining lines along the shape of the hand
        
        con.move(to: CGPoint(x: 0.35*w, y: h))
        con.addLine(to: CGPoint(x: 0.30*w, y: 0.5*h))
        con.addLine(to: CGPoint(x: 0.0, y: 0.40*h))
        con.addLine(to: CGPoint(x: 0.35*w, y: 0.30*h))
        con.addLine(to: CGPoint(x: 0.49*w, y: 0))
        con.addLine(to: CGPoint(x: 0.51*w, y: 0))
        con.addLine(to: CGPoint(x: 0.65*w, y: 0.3*h))
        con.addLine(to: CGPoint(x: w, y: 0.4*h))
        con.addLine(to: CGPoint(x: 0.65*w, y: 0.5*h))
        con.addLine(to: CGPoint(x: 0.65*w, y: h))
        con.closePath()
        con.setStrokeColor(UIColor.black.cgColor)
        con.setLineWidth(2)
        con.strokePath()
        //A CAShapeLayer is created for a circular path
        let circle:CAShapeLayer = CAShapeLayer()
        circle.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: w, height: w), cornerRadius: 0.5*w).cgPath
        
        circle.bounds = CGRect(x: 0, y: 0, width: w, height: w)
        circle.position = CGPoint(x: 0.5*w,y: 0.85*h);
        circle.fillColor = circleColor.cgColor
        self.addSublayer(circle)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.85  )
    }
}

