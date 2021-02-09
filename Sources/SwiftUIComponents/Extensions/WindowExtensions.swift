//
//  WindowExtensions.swift
//  SwiftUIComponents
//
//  Created by Moi Gutierrez on 7/31/20.
//

#if !os(macOS)

import UIKit

public extension NSNotification.Name {
    static let deviceDidShake = NSNotification.Name("DeviceDidShake")
}

extension UIWindow {

    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {

        super.motionEnded(motion, with: event)
        NotificationCenter.default.post(name: .deviceDidShake, object: event)
    }
}

#endif
