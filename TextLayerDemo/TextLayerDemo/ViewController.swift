//
//  ViewController.swift
//  TextLayerDemo
//
//  Created by Mazharul Huq on 8/2/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UIView!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    let textLayer = CATextLayer()
    let helveticaFont = UIFont(name: "Helvetica", size: 16.0)
    let noteworthyFont = UIFont(name: "Noteworthy-Light", size: 16.0)
    let baseFontSize:CGFloat = 20.0
    var rotateFlag = true
    var positionFlag = true
    let initialString = "Welcome to iOS 11"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
    }
    
    func initialize(){
        display.layer.addSublayer(textLayer)
        textLayer.contentsScale = UIScreen.main.scale
        textLayer.string = initialString
        textLayer.fontSize = baseFontSize
        textLayer.font = helveticaFont
        textLayer.bounds = CGRect(x: 0, y: 0, width: 250, height: 250)
        textLayer.position = CGPoint(x: 20, y: 20)
        textLayer.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        textLayer.alignmentMode = CATextLayerAlignmentMode.left
        textLayer.foregroundColor = UIColor.blue.cgColor
        textLayer.masksToBounds = true
    }
    
    
    @IBAction func selectFont(_ sender: Any) {
        let seg = sender as! UISegmentedControl
        textLayer.fontSize = baseFontSize
        slider.value = 1.0
        sizeLabel.text = "\(Int(slider.value * 100.0))%"
        if seg.selectedSegmentIndex == 0{
            textLayer.font = helveticaFont
        }
        else{
            textLayer.font = noteworthyFont
        }
    }
    
    @IBAction func changeFontSize(_ sender: Any) {
        let slider = sender as! UISlider
        sizeLabel.text = "\(Int(slider.value * 100.0))%"
        textLayer.fontSize = baseFontSize * CGFloat(slider.value)
    }
    
    @IBAction func changeFontColor(_ sender: Any) {
        if textLayer.foregroundColor == UIColor.red.cgColor{
            textLayer.foregroundColor = UIColor.blue.cgColor
        }
        else{
            textLayer.foregroundColor = UIColor.red.cgColor
        }
    }
    
    @IBAction func changeText(_ sender: Any) {
        var string = ""
        if (textLayer.string as! String) == initialString{
            for _ in 0..<20{
                string += initialString + "\n"
            }
            textLayer.string = string
        }
        else{
            textLayer.string = initialString
        }
    }
    
    @IBAction func changeTextPosition(_ sender: Any) {
        if positionFlag {
            textLayer.position = CGPoint(x: 150, y: 100)
            positionFlag = false
        }
        else{
            textLayer.position = CGPoint(x: 20, y: 20)
            positionFlag = true
        }
    }
    
    @IBAction func rotateText(_ sender: Any) {
        if rotateFlag {
            textLayer.transform = CATransform3DMakeRotation(0.47, 0, 0, 1)
            rotateFlag = false
        }
        else{
            textLayer.transform = CATransform3DIdentity
            rotateFlag = true
        }
    }
    @IBAction func resetTapped(_ sender: Any) {
        self.initialize()
    }
    
}




