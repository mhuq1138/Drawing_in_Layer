//
//  ViewController.swift
//  DrawingRelatedLayerProperties
//
//  Created by Mazharul Huq on 8/1/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myView: UIView!
    @IBOutlet var opacityLabel: UILabel!
    let layer = CALayer()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let w = self.myView.bounds.size.width
        let h = self.myView.bounds.size.height
        self.layer.frame = CGRect(x: 0, y: 0, width: w, height: h)
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.contentsScale = UIScreen.main.scale
        self.layer.backgroundColor = UIColor.green.cgColor
        self.layer.contents = UIImage(named: "one")?.cgImage
        self.layer.contentsGravity = CALayerContentsGravity.center
        self.myView.layer.addSublayer(self.layer)
    }
    

    @IBAction func changeScale(_ sender: Any) {
        let seg = sender as! UISegmentedControl
        if seg.selectedSegmentIndex == 0{
            self.layer.contentsScale = UIScreen.main.scale
        }
        else{
            self.layer.contentsScale = CGFloat(seg.selectedSegmentIndex)
        }
    }
    
    @IBAction func isOpaqueChanged(_ sender: Any) {
        let sw = sender as! UISwitch
        self.layer.isOpaque = sw.isOn
        self.layer.setNeedsDisplay()
        if !sw.isOn{
           self.layer.contents = UIImage(named: "one")?.cgImage
           self.layer.contentsGravity = CALayerContentsGravity.center
        }
    }
    
    @IBAction func opacityChanged(_ sender: Any) {
        let slider = sender as! UISlider
        self.layer.opacity = slider.value
        self.opacityLabel.text = String(format: "%0.2f", arguments: [slider.value])
    }
    
    @IBAction func changeBackgroundColorTapped(_ sender: Any) {
        if self.layer.backgroundColor == UIColor.green.cgColor{
            self.layer.backgroundColor = UIColor.yellow.cgColor
        }
        else{
            self.layer.backgroundColor = UIColor.green.cgColor
        }
    }
    
}

