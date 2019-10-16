//
//  DeviceCommunicationManager.swift
//  MuscleGun
//
//  Created by Admin on 10/17/19.
//  Copyright © 2019 ItWorksinUA. All rights reserved.
//

import UIKit

class DeviceCommunicationManager: NSObject {
    static let shared = DeviceCommunicationManager()
    var deviceSerial: String?
    override init(){}
    
    func connect() -> Bool{
        guard let _ = deviceSerial else {
            return false
        }
        return true
    }
}
