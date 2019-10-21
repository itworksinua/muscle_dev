//
//  DeviceControlViewController.swift
//  MuscleGun
//
//  Created by Admin on 10/19/19.
//  Copyright © 2019 ItWorksinUA. All rights reserved.
//

import UIKit

class DeviceControlViewController: UIViewController {
    @IBOutlet weak var btnPower: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    @IBOutlet weak var lblExplanation: UILabel!
    @IBOutlet weak var lblTimer: UILabel!
    var stateActive = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initUI()
    }
    
    func initUI() {
        btnPower.layer.shadowColor = UIColor.init(named: "highlight")?.cgColor
        btnPower.layer.shadowOffset = CGSize(width: 0, height: 0)
        btnPower.layer.shadowOpacity = 1
        btnPower.layer.shadowRadius = 0.0
        btnStop.isHidden = true
        lblTimer.isHidden = true
        lblExplanation.isHidden = false
    }
    
    @IBAction func onClickStop(_ sender: Any) {
        let alertController = UIAlertController(title: "", message: "Are you sure you would like to end your session? Your credits will not be saved.", preferredStyle: .alert)
                
        let action1 = UIAlertAction(title: "No", style: .default) { (action:UIAlertAction) in
        }
        
        let action2 = UIAlertAction(title: "Yes", style: .default) { (action:UIAlertAction) in
            self.navigationController?.popViewController(animated: true)
        }

        alertController.addAction(action1)
        alertController.addAction(action2)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func onClickPowerButton(_ sender: Any) {
        self.changeButtonState()
    }
    
    func changeButtonState() {
        stateActive = !stateActive
        switch stateActive {
        case true:
            btnPower.layer.shadowRadius = 45.0
            btnStop.isHidden = false
            lblTimer.isHidden = false
            lblExplanation.isHidden = true
        case false:
            btnPower.layer.shadowRadius = 0
            btnStop.isHidden = true
            lblTimer.isHidden = true
            lblExplanation.isHidden = false
        }
    }
}
