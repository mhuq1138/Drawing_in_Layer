//
//  DisplayLayer.swift
//  DrawIntoLayerWithSubclassMethods
//
//  Created by Mazharul Huq on 7/31/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class DisplayLayer: CALayer {
    override func display() {
        let w = self.bounds.size.width
        let h = self.bounds.size.height
        
        let renderer = UIGraphicsImageRenderer(size: self.bounds.size)
        let image = renderer.image{ con in
            
            con.cgContext.addRect(CGRect(x: 0.0, y: 0.0, width: w , height: h ))
            con.cgContext.setStrokeColor(UIColor.red.cgColor)
            con.cgContext.setLineWidth(8.0)
            con.cgContext.strokePath()
        }
        self.contents = image.cgImage
        
        let im:UIImage = UIImage(named: "earth")!
        let lay = CALayer()
        lay.frame = CGRect(x: 20.0, y: 20.0, width: w - 40.0, height: h - 40.0)
        lay.contents = im.cgImage
        lay.contentsGravity = CALayerContentsGravity.center
        self.addSublayer(lay)
    }
}
