//
//  BiometricType.swift
//  SwiftUIComponents
//
//  Created by Moi Gutierrez on 6/22/22.
//

import Foundation
import SwiftUI
#if !os(tvOS)
import LocalAuthentication

import SwiftUtilities

public struct BiometricType: View {

    static let biometricType = LAContext().biometryType

    public var image: Image {
                
        switch BiometricType.biometricType {
        case .none: return SwiftUI.Image(systemName: "circle.slash")
        case .touchID: return SwiftUI.Image(systemName: "touchid")
        case .faceID: return SwiftUI.Image(systemName: "faceid")
        @unknown default: return SwiftUI.Image(systemName: "circle.slash")
        }
    }
    
    public static var name: String? {
        switch BiometricType.biometricType {
        case .none: return nil
        case .touchID: return "Touch Id"
        case .faceID: return "Face Id"
        @unknown default: return nil
        }
    }
    
    public var body: some View {
        image
    }
    
    public init() {}
}
#endif
