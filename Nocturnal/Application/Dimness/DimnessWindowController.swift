//
//  DimnessWindowController.swift
//  Nocturnal
//
//  Created by Joshua Jon on 25/11/19.
//  Copyright © 2019 Joshua Jon. All rights reserved.
//

import Cocoa

class DimnessWindowController: NSWindowController {
    var screen: NSScreen

    init(screen: NSScreen) {
        self.screen = screen
        let window = NSWindow(contentRect: screen.frame,  styleMask: [.borderless],backing: .buffered, defer: false)
        window.setFrame(screen.frame, display: true)
        window.alphaValue = CGFloat(Dimness.strength)
        window.ignoresMouseEvents = true
        window.backgroundColor = .green
//        window.contentBorderThickness(for: window.contentLayoutRect.)
        window.constrainFrameRect(window.frame, to: screen)
        window.level = NSWindow.Level(rawValue: Int(CGWindowLevelForKey(.screenSaverWindow)))
      //  window.level = .mainMenu + 1

        window.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary, .stationary, .ignoresCycle, .canJoinAllApplications]
        window.orderFrontRegardless()
        window.setFrame(screen.frame, display: true)
        super.init(window: window)

    }

    required convenience init(coder _: NSCoder) {
        self.init(screen: NSScreen.main!)
    }

    deinit {
        self.close()
    }

    func setAlphaValue(_ value: CGFloat) {
        if let window = self.window {
            window.alphaValue = value
        }
    }

    func setIsVisible(_ bool: Bool) {
        if let window = self.window {
            window.setIsVisible(bool)
        }
    }

    func fadeIn(_ duration: Double) {
        if let window = self.window {
            window.fadeInNew(duration: duration)
        }
    }

    func fadeOut(_ duration: Double) {
        if let window = self.window {
            window.fadeOutNew(duration: duration)
        }
    }
}
