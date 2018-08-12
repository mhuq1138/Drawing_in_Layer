//
//  ViewController.swift
//  TheClock
//
//  Created by Mazharul Huq on 8/8/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var clockView: UIView!
    
    let clock: ClockLayer = ClockLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clock.contentsScale = UIScreen.main.scale
        let x = self.clockView.frame.width/2.0 - 100
        let y = self.clockView.frame.height/2.0 - 100
        
        self.clock.frame = CGRect(x: x, y: y, width: 200, height: 200)
        self.clockView.layer.addSublayer(clock)
        clock.setNeedsDisplay()
    }

    @IBAction func changeTimeTapped(_ sender: Any) {
        self.clock.changeTime(.pi/2.0)
    }
    
    @IBAction func rotateClockTapped(_ sender: Any) {
        self.clock.rotateClock()
    }
    
    
}

