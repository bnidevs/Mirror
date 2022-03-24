//
//  Camera.swift
//  AutoCam
//
//  Created by Bill Ni on 3/23/22.
//

import Foundation
import AVFoundation
import AppKit

func setup(feedObj: AVCaptureSession, camDeviceObj: AVCaptureDevice) {
    
    do {
        
        let videoInput = try AVCaptureDeviceInput(device: camDeviceObj)
        
        if feedObj.canAddInput(videoInput){
            feedObj.addInput(videoInput)
        }
        
        feedObj.startRunning()
        
    } catch {
        
        NSApp.terminate(nil)
        
    }
    
}

//func zoom(factor: CGFloat, device: AVCaptureDevice) {
//    device.ramp(toVideoZoomFactor: factor, withRate: 2)
//}
