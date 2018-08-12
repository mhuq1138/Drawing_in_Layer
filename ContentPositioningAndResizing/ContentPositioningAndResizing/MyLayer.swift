//
//  MyLayer.swift
//  ContentPositioningAndResizing
//
//  Created by Mazharul Huq on 8/2/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class MyLayer: CALayer {
    override func draw(in con: CGContext) {
        let w = self.bounds.size.width
        let h = self.bounds.size.height
        //Horizontal red line
        con.setStrokeColor(UIColor.red.cgColor)
        con.setLineWidth(30.0)
        con.move(to: CGPoint(x: 10.0, y: h/2.0))
        con.addLine(to: CGPoint(x: 2.0*w/3.0 , y: h/2.0))
        con.strokePath()
        //Arrow head
        con.setStrokeColor(UIColor.blue.cgColor)
        con.setLineWidth(3.0)
        con.move(to: CGPoint(x: 2.0*w/3.0, y: h/2.0 - 20.0))
        
        con.addLine(to: CGPoint(x: 2.0*w/3.0 + 20.0, y: h/2.0 ))
        con.addLine(to: CGPoint(x: 2.0*w/3.0 , y: h/2.0 + 20.0 ))
        con.closePath()
        con.strokePath()
    }
}
