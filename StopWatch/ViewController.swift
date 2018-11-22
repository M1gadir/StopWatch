//
//  ViewController.swift
//  StopWatch
//
//  Created by My Macbook on 20/11/18.
//  Copyright © 2018 TB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
var stopWatchTimer = Timer()
    var currentTime = 0
    
    @IBOutlet weak var minutes: UILabel!
    @IBOutlet weak var Seconds: UILabel!
    @IBOutlet weak var StartBut: UIButton!
    @IBOutlet weak var StopBut: UIButton!
    @IBOutlet weak var PasBut: UIButton!
    
    @IBAction func Start(_ sender: Any) {
        StartBut.isHidden = true
        PasBut.isHidden = false
        StopBut.isEnabled = true
        
        stopWatchTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTime)), userInfo: nil, repeats: true)
    }
    @IBAction func pause(_ sender: Any) {
        StartBut.isHidden = false
        PasBut.isHidden = true
        //stopping the timer
        
        stopWatchTimer.invalidate()
    }
    @IBAction func Stop(_ sender: Any) {
        
        PasBut.isHidden = true
        StartBut.isHidden = false
        StopBut.isHidden = false
        
        currentTime = 0
        minutes.text = "0"
        Seconds.text = "0"
        
        stopWatchTimer.invalidate()
    }
    
    @objc func updateTime() {
        currentTime += 1
        minutes.text = "\(currentTime / 60)"
        Seconds.text = "\(currentTime % 60)"
       
        if currentTime == 3600 {
            //3600 second which is equals on one hour...
            //when it hit 3600 after that come back in zero
        currentTime = 0
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
            PasBut.isHidden = true
            StopBut.isEnabled = false
    }


}

