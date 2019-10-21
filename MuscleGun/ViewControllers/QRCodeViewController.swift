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

class QRCodeViewController: AbstractViewController {
    
    @IBOutlet weak var previewView: QRCodeReaderView! {
        didSet {
            previewView.setupComponents(with: QRCodeReaderViewControllerBuilder {
                $0.reader                 = reader
                $0.showTorchButton        = false
                $0.showSwitchCameraButton = false
                $0.showCancelButton       = false
                $0.showOverlayView        = true
                $0.rectOfInterest         = CGRect(x: -1, y: -1, width: 1, height: 1)
            })
        }
    }
    lazy var reader: QRCodeReader = QRCodeReader()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
            if response {
                DispatchQueue.main.async {
                    self.startScan()
                }
            } else {
                
            }
        }
    }
    
    @IBAction func onClickToggleTorch(_ sender: Any) {
        reader.toggleTorch()
    }
    
    @IBAction func onClickEnterKeyb(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func checkScanPermissions() -> Bool {
        do {
            return try QRCodeReader.supportsMetadataObjectTypes()
        } catch {
            self.message(text: "Reader not supported by the current device")
            return false
        }
    }
    
    func startScan() {
        guard checkScanPermissions(), !reader.isRunning else { return }
        reader.didFindCode = { result in
            print("Completion with result: \(result.value) of type \(result.metadataType)")
            DeviceCommunicationManager.shared.connect(serial: result.value)
            self.performSegue(withIdentifier: "showDeviceControl", sender: nil)
        }
        
        reader.startScanning()
    }
}

