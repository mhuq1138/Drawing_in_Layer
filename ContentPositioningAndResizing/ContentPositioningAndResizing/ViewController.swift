//
//  ViewController.swift
//  ContentPositioningAndResizing
//
//  Created by Mazharul Huq on 8/2/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var viewForLayer: UIView!
    
    var layer:CALayer!
    let earth = UIImage(named: "earth")?.cgImage
    var chooseImage = 0
    var contentsGravity = CALayerContentsGravity.center
    var contentsRect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
    var contentsCenter = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.layer = CALayer()
        layer.contents = earth
        self.setupLayer()
        self.viewForLayer.layer.addSublayer(layer)
    }
    
    func setupLayer(){
        layer.frame = viewForLayer.bounds
        layer.contentsGravity = self.contentsGravity
        layer.isGeometryFlipped = false
        layer.cornerRadius = 0.0
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.white.cgColor
        layer.backgroundColor = UIColor.cyan.cgColor
        layer.shadowOpacity = 0.75
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 3.0
        layer.magnificationFilter = CALayerContentsFilter.linear
        layer.contentsRect = self.contentsRect
        layer.contentsCenter = self.contentsCenter
        if self.chooseImage == 1{
            self.layer.setNeedsDisplay()
        }
    }
    
    @IBAction func chooseImage(_ sender: Any) {
        let seg = sender as? UISegmentedControl
        if self.layer.superlayer == self.viewForLayer.layer{
            layer.removeFromSuperlayer()
        }
        switch seg?.selectedSegmentIndex{
        case 0:
            self.layer = CALayer()
            layer.frame = viewForLayer.bounds
            layer.contents = earth
            self.chooseImage = 0
        case 1:
            self.layer = MyLayer()
            layer.frame = viewForLayer.bounds
            self.chooseImage = 1
            
        default:
            break
        }
        self.setupLayer()
        self.viewForLayer.layer.addSublayer(layer)
    }
    
    @IBAction func contentsGravityChanged(_ sender: Any) {
        let seg = sender as? UISegmentedControl
        switch seg?.selectedSegmentIndex{
        case 0:
            self.contentsGravity = CALayerContentsGravity.center
        case 1:
            self.contentsGravity = CALayerContentsGravity.left
        case 2:
            self.contentsGravity = CALayerContentsGravity.right
        case 3:
            self.contentsGravity = CALayerContentsGravity.resize
        default:
            self.contentsGravity = CALayerContentsGravity.center
        }
        setupLayer()
    }
    
    @IBAction func contentsRectChanged(_ sender: Any) {
        let seg = sender as? UISegmentedControl
        switch seg?.selectedSegmentIndex{
        case 0:
            self.contentsRect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        case 1:
            self.contentsRect = CGRect(x: 0.4, y: 0.3, width: 0.5, height: 0.8)
            
        default:
            self.contentsRect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        }
        setupLayer()
    }
    
    
    @IBAction func contentsCenterChanged(_ sender: Any) {
        let seg = sender as? UISegmentedControl
        switch seg?.selectedSegmentIndex{
        case 0:
            self.contentsCenter = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        case 1:
            self.contentsCenter = CGRect(x: 0.4, y: 0.4, width: 0.2, height: 0.2)
            
        default:
            self.contentsCenter = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        }
        setupLayer()
    }
    
}


