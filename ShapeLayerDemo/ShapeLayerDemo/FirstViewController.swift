//
//  FirstViewController.swift
//  ShapeLayerDemo
//
//  Created by Mazharul Huq on 8/6/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var displayView: UIView!
    @IBOutlet var angleLabel: UILabel!
    @IBOutlet var slider: UISlider!
    
    let lineLayer = CAShapeLayer()
    let arcLayer = CAShapeLayer()
    var linePath = UIBezierPath()
    var arcPath = UIBezierPath()
    var lineFill = true
    var arcFill = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize paths
        self.linePath.move(to: CGPoint(x: 10.0, y: 20.0))
        self.linePath.addLine(to: CGPoint(x: 200.0, y: 20.0))
        self.lineLayer.path = self.linePath.cgPath
        self.displayView.layer.addSublayer(self.lineLayer)
        self.lineLayer.strokeColor = UIColor.red.cgColor
        self.lineLayer.fillColor = UIColor.clear.cgColor
        self.lineLayer.lineWidth = 3.0
        
        self.arcPath.addArc(withCenter: CGPoint(x: 250, y: 150), radius: 80, startAngle: 0, endAngle: 2.0 * CGFloat( slider.value) * .pi, clockwise: true)
        self.displayView.layer.addSublayer(self.arcLayer)
        self.arcLayer.path = arcPath.cgPath
        self.arcLayer.lineWidth = 2
        self.arcLayer.strokeColor = UIColor.blue.cgColor
        self.arcLayer.fillColor = UIColor.clear.cgColor
    }

    @IBAction func addCurveTapped(_ sender: Any) {
        self.linePath.addCurve(to: CGPoint(x: 10.0, y: 150.0), controlPoint1: CGPoint(x: 100.0, y: 200.0), controlPoint2: CGPoint(x: 20.0, y: 80.0))
        self.lineLayer.path = self.linePath.cgPath
    }
    
    @IBAction func fillLineTapped(_ sender: Any) {
        if self.lineFill {
            self.lineLayer.fillColor = UIColor.green.cgColor
            self.lineFill = false
        }
        else{
            self.lineLayer.fillColor = UIColor.clear.cgColor
            self.lineFill = true
        }
    }
    
    @IBAction func arcAngleChanged(_ sender: Any) {
        let path = UIBezierPath()
        
        path.addArc(withCenter: CGPoint(x: 250, y: 150), radius: 80, startAngle: 0, endAngle: 2.0 * CGFloat( self.slider.value) * .pi, clockwise: true)
        arcLayer.path = path.cgPath
        self.angleLabel.text = String(format: "%.0f", 360 * CGFloat( self.slider.value) )
    }
    
    
    @IBAction func fillArcTapped(_ sender: Any) {
        if self.arcFill{
            self.arcLayer.fillColor = UIColor.orange.cgColor
            self.arcFill = false
        }
        else{
            self.arcLayer.fillColor = UIColor.clear.cgColor
            self.arcFill = true
        }
    }
    
}

