//
//  DelegateDrawLayer.swift
//  DrawIntoLayerWithDelegateMethods
//
//  Created by Mazharul Huq on 7/31/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class DelegateDrawLayer: NSObject, CALayerDelegate {
    func draw(_ layer: CALayer, in ctx: CGContext) {
        print("Called")
        ctx.setLineWidth(5.0)
        ctx.setStrokeColor(UIColor.red.cgColor)
        ctx.addRect(CGRect(x: 10.0, y: 10.0, width: 280.0, height: 200.0))
        ctx.strokePath()
        
        //Note that the following line is essential
        //only to draw an image from file
        UIGraphicsPushContext(ctx)
        let image: UIImage = UIImage(named: "earth")!
        let x = (290.0 - image.size.width)/2.0
        let y = (210.0 - image.size.height)/2.0
        image.draw(at: CGPoint(x: x, y: y))
        UIGraphicsPopContext()
    }
}

