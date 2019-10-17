//
//  AbstractViewController.swift
//  MuscleGun
//
//  Created by Admin on 10/17/19.
//  Copyright © 2019 ItWorksinUA. All rights reserved.
//

import UIKit

class AbstractViewController: UIViewController {
    
    func message(text: String) {
        let alert = UIAlertController(title: "Error", message: "\(text)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
