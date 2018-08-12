//
//  ViewController.swift
//  DrawIntoLayerWithDelegateMethods
//
//  Created by Mazharul Huq on 7/31/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var delegate1 = DelegateDrawLayer()
    var delegate2 = DelegateDisplayLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label1 = UILabel(frame: CGRect(x: 10, y: 50, width: 250, height: 20))
        label1.text = "Using draw(_:,in:) method:"
        self.view.addSubview(label1)
        let layer1 = CALayer()
        layer1.needsDisplayOnBoundsChange = true
        layer1.frame = CGRect(x: 40, y: 70, width: 320, height: 220)
        layer1.backgroundColor = UIColor.white.cgColor
        self.view.layer.addSublayer(layer1)
        layer1.delegate = self.delegate1
        
        let label2 = UILabel(frame: CGRect(x: 10, y: 300, width: 200, height: 20))
        label2.text = "Using display(_:) method:"
        self.view.addSubview(label2)
        let layer2 = CALayer()
        layer2.frame = CGRect(x: 30, y: 330, width: 320, height: 220)
        layer2.backgroundColor = UIColor.white.cgColor
        view.layer.addSublayer(layer2)
        layer2.setNeedsDisplay()
        layer2.delegate = self.delegate2
    }
}

