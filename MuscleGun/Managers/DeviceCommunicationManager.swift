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
    var isConnected = false
    override init(){}
    
    func connect(serial: String){
        if isConnected {
            self.disconnect()
        }
        deviceSerial = serial
        isConnected = true
    }
    
    func disconnect() {
        isConnected = false
    }
}


