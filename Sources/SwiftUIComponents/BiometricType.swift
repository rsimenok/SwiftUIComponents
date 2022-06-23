//
//  BiometricType.swift
//  SwiftUIComponents
//
//  Created by Moi Gutierrez on 6/22/22.
//

import Foundation
import SwiftUI
import LocalAuthentication

import SwiftUtilities

public struct BiometricType: View {
    
//    var biometricType: LAContext.BiometricType
    
    var image: Image {
        
        let biometricType = LAContext().biometryType
        
        switch biometricType {
        case .none: return SwiftUI.Image(systemName: "circle.slash")
        case .touchID: return SwiftUI.Image(systemName: "touchid")
        case .faceID: return SwiftUI.Image(systemName: "faceid")
        @unknown default: return SwiftUI.Image(systemName: "circle.slash")
        }
    }
    
    public var body: some View {
        image
    }
    
    public init() {}
}
