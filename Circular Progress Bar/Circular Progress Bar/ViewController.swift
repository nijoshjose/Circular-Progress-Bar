//
//  ViewController.swift
//  Circular Progress Bar
//
//  Created by Dooth Developer 10 on 23/03/19.
//  Copyright © 2019 Dooth Developer 10. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!

    var timer: Timer?
    var startTime = 0
    var endTime = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
    }

    @objc func updateTime() {
        if endTime > startTime {
        endTime -= 1
        timeLabel.text = "\(endTime)"
        } else {
            timer?.invalidate()
        }
    }

}

