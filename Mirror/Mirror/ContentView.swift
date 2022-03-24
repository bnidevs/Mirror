//
//  ContentView.swift
//  AutoCam
//
//  Created by Bill Ni on 3/23/22.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @Binding var camfeed: AVCaptureSession
    
    var body: some View {
        VStack {
            HStack {
                Image(nsImage: NSImage(imageLiteralResourceName: "MenuBarIcon"))
                Text("irror")
                    .font(.system(size: 18, weight: .bold))
                    .padding([.leading], -9)
                    .padding([.top], 3)
                Spacer()
                Button("Quit", action: {NSApp.terminate(nil)})
            }.frame(width: 400, height: 25, alignment: .topLeading)
            PlayerContainerView(captureSession: camfeed)
            .frame(width: 400, height: 225, alignment: .center)
            .cornerRadius(5)
        }.frame(width: 420, height: 280, alignment: .center)
    }
}

class PlayerView: NSView {
    
    var previewLayer: AVCaptureVideoPreviewLayer?

    init(captureSession: AVCaptureSession) {
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        super.init(frame: .zero)

        setupLayer()
    }

    func setupLayer() {
        previewLayer?.frame = self.frame
        previewLayer?.contentsGravity = .resizeAspectFill
        previewLayer?.videoGravity = .resizeAspectFill
        previewLayer?.connection?.automaticallyAdjustsVideoMirroring = false
        previewLayer?.connection?.isVideoMirrored = true
        layer = previewLayer
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class PlayerContainerView: NSViewRepresentable {
    typealias NSViewType = PlayerView

    let captureSession: AVCaptureSession

    init(captureSession: AVCaptureSession) {
        self.captureSession = captureSession
    }

    func makeNSView(context: Context) -> PlayerView {
        return PlayerView(captureSession: captureSession)
    }

    func updateNSView(_ nsView: PlayerView, context: Context) { }
}
