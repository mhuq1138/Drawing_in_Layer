//
//  ViewController.swift
//  DrawUsingContentsProperty
//
//  Created by Mazharul Huq on 7/29/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let layer1 = CALayer()
    let layer2 = CALayer()
    let layer3 = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label1 = UILabel(frame: CGRect(x: 10, y: 30, width: 200, height: 20))
        label1.text = "Image from File:"
        self.view.addSubview(label1)
        
        self.layer1.frame = CGRect(x: 50, y: 50, width: 300, height: 160)
        self.layer1.backgroundColor = UIColor.white.cgColor
        self.view.layer.addSublayer(layer1)
        
        let label2 = UILabel(frame: CGRect(x: 10, y: 220, width: 200, height: 20))
        label2.text = "Image Drawn in Context:"
        self.view.addSubview(label2)
        
        self.layer2.frame = CGRect(x: 50, y: 250, width: 320, height: 160)
        self.layer2.backgroundColor = UIColor(red: 0.2, green: 0.8, blue: 0.7, alpha: 1.0).cgColor
        self.view.layer.addSublayer(layer2)
        
        let label3 = UILabel(frame: CGRect(x: 10, y: 460, width: 300, height: 20))
        label3.text = "Image Drawn with Bezier Path:"
        self.view.addSubview(label3)
        
        self.layer3.frame = CGRect(x: 50, y: 490, width: 320, height: 160)
        self.layer3.backgroundColor = UIColor(red: 0.7, green: 0.8, blue: 0.4, alpha: 1.0).cgColor
        self.view.layer.addSublayer(layer3)
        
        self.displayImage()
        self.drawImageInContext()
        self.drawImageInBezierPath()
    }
    
    func displayImage(){
        let image:UIImage = UIImage(named: "earth")!
        self.layer1.contents = image.cgImage //The image must be CGImage
        self.layer1.contentsGravity = CALayerContentsGravity.center
    }
    
    func drawImageInContext(){
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 150, height: 80))
        let image = renderer.image { ctx in
            let rectangle = CGRect(x: 25, y: 15, width: 100, height: 50)
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.yellow.cgColor)
            ctx.cgContext.setLineWidth(4)
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        self.layer2.contents = image.cgImage
    }
    
    func drawImageInBezierPath(){
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 120, height: 80))
        let image = renderer.image { ctx in
            let path = UIBezierPath(arcCenter: CGPoint(x: 60, y: 40), radius: 15, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
            UIColor.blue.setFill()
            path.fill()
        }
        self.layer3.contents = image.cgImage
        self.layer3.contentsGravity = CALayerContentsGravity.center
    }
}



