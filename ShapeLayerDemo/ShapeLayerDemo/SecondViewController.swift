//
//  SecondViewController.swift
//  ShapeLayerDemo
//
//  Created by Mazharul Huq on 8/6/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var display: UIView!
    @IBOutlet weak var fillSwitch: UISwitch!
    @IBOutlet weak var fillOption: UISegmentedControl!
    @IBOutlet var slider: UISlider!
    
    let circleLayer = CAShapeLayer()
    let rectangleLayer = CAShapeLayer()
    let complexLayer = CAShapeLayer()
    var height:CGFloat = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circleLayer.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 100, height: height)).cgPath
        circleLayer.position = CGPoint(x: 20,y: 40);
        circleLayer.fillColor = UIColor.red.cgColor
        circleLayer.strokeColor = UIColor.blue.cgColor
        circleLayer.strokeStart = 0.0
        circleLayer.strokeEnd = 1.0
        circleLayer.lineWidth = 2
        display.layer.addSublayer(circleLayer)
        
        self.rectangleLayer.path = UIBezierPath(rect: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 100.0)).cgPath
        self.rectangleLayer.position = CGPoint(x: 20,y: 180);
        self.rectangleLayer.fillColor = UIColor.red.cgColor
        self.rectangleLayer.strokeColor = UIColor.blue.cgColor
        self.rectangleLayer.strokeStart = 0.0
        self.rectangleLayer.strokeEnd = 1.0
        self.rectangleLayer.lineWidth = 2
        display.layer.addSublayer(self.rectangleLayer)
        
        let p = UIBezierPath()
        p.move(to: CGPoint(x: 150, y: 30))
        p.addLine(to: CGPoint(x: 300, y: 30))
        p.addLine(to: CGPoint(x: 300, y: 120))
        p.addLine(to: CGPoint(x: 200, y: 120))
        p.addLine(to: CGPoint(x: 200, y: 80))
        p.addLine(to: CGPoint(x: 250, y: 80))
        p.addLine(to: CGPoint(x: 250, y: 160))
        p.addLine(to: CGPoint(x: 150, y: 160))
        p.addLine(to: CGPoint(x: 150, y: 30))
        p.close()
        
        complexLayer.path = p.cgPath
        complexLayer.fillColor = UIColor.green.cgColor
        complexLayer.strokeColor = UIColor.red.cgColor
        complexLayer.lineWidth = 8.0
        complexLayer.fillColor = UIColor.clear.cgColor
        complexLayer.fillRule = CAShapeLayerFillRule.nonZero
        complexLayer.lineJoin = CAShapeLayerLineJoin.miter
        display.layer.addSublayer(complexLayer)
        
    }
    
    @IBAction func strokeEndsChanged(_ sender: Any) {
        let slider = sender as! UISlider
        self.circleLayer.strokeEnd = CGFloat(slider.value)
        self.rectangleLayer.strokeEnd = CGFloat(slider.value)
    }
    
    @IBAction func fillSwitchOn(_ sender: Any) {
        
        if fillSwitch.isOn{
            fillOption.selectedSegmentIndex = 0
            complexLayer.fillRule = CAShapeLayerFillRule.nonZero
            complexLayer.fillColor = UIColor.green.cgColor
        }
        else{
            fillOption.selectedSegmentIndex = -1
            complexLayer.fillColor = UIColor.clear.cgColor
        }
    }
    
    @IBAction func fillOptionChanged(_ sender: Any) {
        let seg = sender as! UISegmentedControl
        
        if seg.selectedSegmentIndex == 0{
            complexLayer.fillRule = CAShapeLayerFillRule.nonZero
            complexLayer.fillColor = UIColor.green.cgColor
        }
        else{
            complexLayer.fillRule = CAShapeLayerFillRule.evenOdd
            complexLayer.fillColor = UIColor.blue.cgColor
        }
        
    }
    
    @IBAction func lineJoinOptionChanged(_ sender: Any) {
        let seg = sender as! UISegmentedControl
        switch seg.selectedSegmentIndex{
        case 0:
            complexLayer.lineJoin = CAShapeLayerLineJoin.miter
        case 1:
            complexLayer.lineJoin = CAShapeLayerLineJoin.round
        case 2:
            complexLayer.lineJoin = CAShapeLayerLineJoin.bevel
            
        default:
            complexLayer.lineJoin = CAShapeLayerLineJoin.miter
        }
    }
    
    @IBAction func turnIntoEllipse(_ sender: Any) {
        if height == 100.0{
            height = 80.0
        }
        else{
            height = 100.0
        }
        circleLayer.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 100, height: height)).cgPath
    }
}

