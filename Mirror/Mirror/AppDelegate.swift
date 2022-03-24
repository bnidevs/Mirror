//
//  AppDelegate.swift
//  AutoGIF Spooler
//
//  Created by Bill Ni on 2/12/22.
//

import Foundation
import Cocoa
import SwiftUI
import AVFoundation

class AppData: ObservableObject {
    @Published var feed: AVCaptureSession = AVCaptureSession()
    @Published var camDevice: AVCaptureDevice = AVCaptureDevice.default(for: .video)!
    @Published var statusBar: StatusBarController?
}

class AppDelegate: NSObject, NSApplicationDelegate {
    
    var popover = NSPopover.init()
    
    @ObservedObject var appdata: AppData = AppData.init()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        checkAccess()
        setup(feedObj: appdata.feed, camDeviceObj: appdata.camDevice)
        
        let popover = NSPopover.init()
        
        let contentView = ContentView(camfeed: $appdata.feed)
        popover.contentViewController = NSHostingController(rootView: contentView)
        appdata.statusBar = StatusBarController.init(popover, feedIn: appdata.feed)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        
    }
}
