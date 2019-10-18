//
//  DeviceNumberViewController.swift
//  MuscleGun
//
//  Created by Admin on 10/17/19.
//  Copyright © 2019 ItWorksinUA. All rights reserved.
//

import UIKit

class DeviceNumberViewController: AbstractViewController {
    
    @IBOutlet weak var serialNumberText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension DeviceNumberViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let str = textField.text, str.count > 0 {
            DeviceCommunicationManager.shared.connect(serial: str)
            textField.resignFirstResponder()
            self.performSegue(withIdentifier: "showDeviceControl", sender: nil)
        }
        return false
    }
}
