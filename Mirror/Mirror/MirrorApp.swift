//
//  MirrorApp.swift
//  Mirror
//
//  Created by Bill Ni on 3/24/22.
//

import SwiftUI
import AVFoundation

class AppData: ObservableObject {
    @Published var feed: AVCaptureSession = AVCaptureSession()
    @Published var camDevice: AVCaptureDevice = AVCaptureDevice.default(for: .video)!
    @Published var statusBar: StatusBarController?
}

@main
struct MirrorApp: App {
    
    @ObservedObject var appdata: AppData = AppData.init()
    
    var body: some Scene {
        WindowGroup {
            VStack {
                
            }
        }
    }
    
    init(){
        checkAccess()
        setup(feedObj: appdata.feed, camDeviceObj: appdata.camDevice)
        
        let popover = NSPopover.init()
        
        let contentView = ContentView(camfeed: $appdata.feed)
        popover.contentViewController = NSHostingController(rootView: contentView)
        appdata.statusBar = StatusBarController.init(popover, feedIn: appdata.feed)
    }
}
