//
//  DelegateDisplayLayer.swift
//  DrawIntoLayerWithDelegateMethods
//
//  Created by Mazharul Huq on 7/31/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class DelegateDisplayLayer: NSObject, CALayerDelegate {
    func display(_ layer: CALayer){
        let renderer = UIGraphicsImageRenderer(size: layer.bounds.size)
        let image = renderer.image{ con in
            
            con.cgContext.addRect(CGRect(x: 0.0, y: 0.0, width: layer.bounds.width , height: layer.bounds.height ))
            con.cgContext.setStrokeColor(UIColor.blue.cgColor)
            con.cgContext.setLineWidth(8.0)
            con.cgContext.strokePath()
        }
        layer.contents = image.cgImage
        
        let im:UIImage = UIImage(named: "earth")!
        let lay = CALayer()
        lay.frame = CGRect(x: 20.0, y: 20.0, width: layer.bounds.width - 40.0, height: layer.bounds.height - 40.0)
        lay.contents = im.cgImage
        lay.contentsGravity = CALayerContentsGravity.center
        layer.addSublayer(lay)
        
    }
    
}

