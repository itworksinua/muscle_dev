//
//  DeviceControlViewController.swift
//  MuscleGun
//
//  Created by Admin on 10/19/19.
//  Copyright © 2019 ItWorksinUA. All rights reserved.
//

import UIKit

class DeviceControlViewController: UIViewController {
    @IBOutlet weak var btn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        btn.layer.shadowColor = UIColor.init(named: "highlight")?.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 0)
        btn.layer.shadowOpacity = 1
        btn.layer.shadowRadius = 45.0
    }
    
}
