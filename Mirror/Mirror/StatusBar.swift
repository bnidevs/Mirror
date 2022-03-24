//
//  StatusBar.swift
//  AutoCam
//
//  Created by Bill Ni on 3/24/22.
//

import Foundation
import AppKit
import AVFoundation

class StatusBarController {
    
    private var statusBar: NSStatusBar
    private var statusItem: NSStatusItem
    private var popover: NSPopover
    private var feedObj: AVCaptureSession
    
    init(_ popover: NSPopover, feedIn: AVCaptureSession) {
        self.popover = popover
        statusBar = NSStatusBar.init()
        statusItem = statusBar.statusItem(withLength: 28.0)
        feedObj = feedIn
        
        if let statusBarButton = statusItem.button {
            statusBarButton.image = NSImage(imageLiteralResourceName: "MenuBarIcon")
            statusBarButton.image?.size = NSSize(width: 30.0, height: 20.0)
            statusBarButton.image?.isTemplate = false
            statusBarButton.action = #selector(togglePopover(sender:))
            statusBarButton.target = self
        }
    }
    
    @objc func togglePopover(sender: AnyObject) {
        if(popover.isShown) {
            hidePopover(sender)
        }
        else {
            showPopover(sender)
        }
    }
    
    func showPopover(_ sender: AnyObject) {
        if let statusBarButton = statusItem.button {
            popover.show(relativeTo: statusBarButton.bounds, of: statusBarButton, preferredEdge: NSRectEdge.maxY)
        }
        feedObj.startRunning()
    }
    
    func hidePopover(_ sender: AnyObject) {
        popover.performClose(sender)
        feedObj.stopRunning()
    }
}
