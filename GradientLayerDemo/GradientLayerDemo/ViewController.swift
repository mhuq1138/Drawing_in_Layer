//
//  ViewController.swift
//  GradientLayerDemo
//
//  Created by Mazharul Huq on 8/7/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UIView!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    
    let gradLayer = CAGradientLayer()
    var startPoint = CGPoint(x: 0.0, y: 0.0)
    var endPoint = CGPoint(x: 0.0, y: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradLayer.contentsScale = UIScreen.main.scale
        gradLayer.frame = CGRect(x: 30, y: 30, width: 300, height: 200)
        gradLayer.colors = [UIColor.red.cgColor, UIColor.green.cgColor,UIColor.yellow.cgColor, UIColor.blue.cgColor]
        gradLayer.locations = [0.0,0.3,0.7,1.0]
        gradLayer.startPoint = startPoint
        gradLayer.endPoint = endPoint
        display.layer.addSublayer(gradLayer)
    }
    
    @IBAction func changeStartPoint(_ sender: Any) {
        let slider = sender as! UISlider
        startPoint.x = CGFloat(slider.value)
        gradLayer.startPoint = startPoint
        startLabel.text = String(format: "(%.1f, 0.0)", slider.value)
    }
    
    @IBAction func changeEndPoint(_ sender: Any) {
        let slider = sender as! UISlider
        endPoint.y = CGFloat(slider.value)
        gradLayer.endPoint = endPoint
        endLabel.text = String(format: "(0.0,%.1f)", slider.value)
    }
    
}

