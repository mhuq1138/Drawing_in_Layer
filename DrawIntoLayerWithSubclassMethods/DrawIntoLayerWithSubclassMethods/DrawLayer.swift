//
//  DrawLayer.swift
//  DrawIntoLayerWithSubclassMethods
//
//  Created by Mazharul Huq on 7/31/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class DrawLayer: CALayer {
    override func draw(in ctx: CGContext) {
        let w = self.bounds.size.width
        let h = self.bounds.size.height
        ctx.setLineWidth(5.0)
        ctx.setStrokeColor(UIColor.blue.cgColor)
        ctx.addRect(CGRect(x: 10.0, y: 10.0, width: w - 20.0, height: h - 20.0))
        ctx.strokePath()
        
        //Note that the following line is essential
        //only to draw an image from file
        UIGraphicsPushContext(ctx)
        let image: UIImage = UIImage(named: "earth")!
        let x = (w - image.size.width)/2.0
        let y = (h - image.size.height)/2.0
        image.draw(at: CGPoint(x: x, y: y))
        UIGraphicsPopContext()
    }
}
