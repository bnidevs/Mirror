//
//  Permissions.swift
//  AutoCam
//
//  Created by Bill Ni on 3/23/22.
//

import Foundation
import AVFoundation
import AppKit

func checkAccess() {
    switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized: // The user has previously granted access to the camera.
            break
        
        case .notDetermined: // The user has not yet been asked for camera access.
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if !granted {
                    NSApp.terminate(nil)
                }
            }
        
        case .denied: // The user has previously denied access.
            NSApp.terminate(nil)

        case .restricted: // The user can't grant access due to restrictions.
            NSApp.terminate(nil)
        
    @unknown default:
        NSApp.terminate(nil)
    }
}
