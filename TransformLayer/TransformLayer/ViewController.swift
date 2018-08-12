//
//  ViewController.swift
//  TransformLayer
//
//  Created by Mazharul Huq on 8/11/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayView: UIView!
    
    let transformLayer = CATransformLayer()
    let bottomLayer = CALayer()
    let textLayer = CATextLayer()
    let topLayer = CALayer()
    var zPositionDelta:CGFloat = 10.0
    var angle:CGFloat = 30.0
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        var transform = CATransform3DIdentity
        transform.m34 = -1.0/500.0
        self.displayView.layer.sublayerTransform = transform
        
        self.transformLayer.frame = CGRect(x: 0, y: 0, width: 150, height: 100)
        self.transformLayer.position = CGPoint(x: 150.0, y: self.displayView.bounds.midY)
        self.displayView.layer.addSublayer(self.transformLayer)
        
        bottomLayer.bounds = self.transformLayer.bounds
        bottomLayer.backgroundColor = UIColor.blue.cgColor
        bottomLayer.position = CGPoint(x: self.transformLayer.bounds.midX, y: self.transformLayer.bounds.midY)
        bottomLayer.zPosition = 5.0
        self.transformLayer.addSublayer(bottomLayer)
        
        textLayer.bounds = bottomLayer.bounds
        textLayer.fontSize = 50
        textLayer.foregroundColor = UIColor.green.cgColor
        textLayer.string = "Hello"
        self.transformLayer.addSublayer(textLayer)
        textLayer.position = CGPoint(x: self.transformLayer.bounds.midX, y: self.transformLayer.bounds.midY)
        textLayer.zPosition = 5.0 + self.zPositionDelta
        
        topLayer.bounds = self.transformLayer.bounds
        topLayer.backgroundColor = UIColor.red.cgColor
        topLayer.position = CGPoint(x: self.transformLayer.bounds.midX, y: self.transformLayer.bounds.midY)
        topLayer.zPosition = 5.0 + 2.0*self.zPositionDelta
        self.transformLayer.addSublayer(topLayer)
        self.transformLayer.anchorPoint = CGPoint(x: 1.0,y: 0.5)
        self.rotate(angle: angle)
    }
    
    func resetZPosition(){
        self.textLayer.zPosition = 5.0 + self.zPositionDelta
        self.topLayer.zPosition = 5.0 + 2.0*self.zPositionDelta
    }
    
    func rotate(angle:CGFloat){
        self.transformLayer.transform = CATransform3DMakeRotation(.pi*angle/180.0, 0, 1, 0)
    }

    @IBAction func chooseDifference(_ sender: Any) {
        let seg = sender as! UISegmentedControl
        self.transformLayer.transform = CATransform3DIdentity
        switch seg.selectedSegmentIndex{
        case 0:
            self.zPositionDelta = 20.0
        case 1:
            self.zPositionDelta = 40.0
        case 2:
            self.zPositionDelta = 80.0
        default:
            break
        }
        self.resetZPosition()
        self.rotate(angle: angle)
    }
    
    @IBAction func changeAngle(_ sender: Any) {
        let seg = sender as! UISegmentedControl
        switch seg.selectedSegmentIndex{
        case 0:
            self.angle = 30.0
        case 1:
            self.angle = 60.0
        case 2:
            self.angle = 120.0
        default:
            break
        }
        self.rotate(angle: angle)
    }
}

