//
//  ViewController.swift
//  MuscleGun
//
//  Created by Admin on 10/17/19.
//  Copyright © 2019 ItWorksinUA. All rights reserved.
//

import UIKit
import QRCodeReader
import AVFoundation

class QRCodeViewController: UIViewController {
    
    @IBOutlet weak var previewView: QRCodeReaderView! {
        didSet {
            previewView.setupComponents(with: QRCodeReaderViewControllerBuilder {
                $0.reader                 = reader
                $0.showTorchButton        = false
                $0.showSwitchCameraButton = false
                $0.showCancelButton       = false
                $0.showOverlayView        = true
                $0.rectOfInterest         = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
            })
        }
    }
    lazy var reader: QRCodeReader = QRCodeReader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
            if response {
                self.startScan()
            } else {
                
            }
        }
    }
    
    @IBAction func toggleTorch(_ sender: Any) {
        reader.toggleTorch()
    }
    
    private func checkScanPermissions() -> Bool {
        do {
            return try QRCodeReader.supportsMetadataObjectTypes()
        } catch {
            let alert = UIAlertController(title: "Error", message: "Reader not supported by the current device", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            
            return false
        }
    }
    
    func startScan() {
        guard checkScanPermissions(), !reader.isRunning else { return }
        reader.didFindCode = { result in
            print("Completion with result: \(result.value) of type \(result.metadataType)")
            DeviceCommunicationManager.shared.deviceSerial = result.value
            if DeviceCommunicationManager.shared.connect() {
                
            } else {
                let alert = UIAlertController(title: "Error", message: "Can not connect to device", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        reader.startScanning()
    }
}

