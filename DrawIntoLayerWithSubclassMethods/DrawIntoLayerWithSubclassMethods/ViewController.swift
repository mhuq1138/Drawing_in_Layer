//
//  ViewController.swift
//  DrawIntoLayerWithSubclassMethods
//
//  Created by Mazharul Huq on 7/31/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let layer1 = DisplayLayer()
    let layer2 = DrawLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label1 = UILabel(frame: CGRect(x: 10, y: 50, width: 200, height: 20))
        label1.text = "Using display() method:"
        self.view.addSubview(label1)
        
        self.layer1.needsDisplayOnBoundsChange = true
        layer1.frame = CGRect(x: 50, y: 80, width: 300, height: 200)
        layer1.backgroundColor = UIColor.white.cgColor
        view.layer.addSublayer(layer1)
        //self.layer1.setNeedsDisplay()
        
        let label2 = UILabel(frame: CGRect(x: 10, y: 320, width: 200, height: 20))
        label2.text = "Using draw(in:) method:"
        self.view.addSubview(label2)
        
        layer2.frame = CGRect(x: 50, y: 350, width: 300, height: 200)
        layer2.backgroundColor = UIColor.white.cgColor
        view.layer.addSublayer(layer2)
        self.layer2.setNeedsDisplay()
    }
}

