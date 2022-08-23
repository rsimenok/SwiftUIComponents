//
//  Permissions.swift
//  SwiftUtilities
//
//  Created by Moi Gutierrez on 8/22/22.
//

import Foundation

import CloudyLogs
import PermissionsKit
import NotificationPermission
import BluetoothPermission
import FaceIDPermission

public enum Permission: String, CaseIterable {
    
    case bluetooth
    case notification
    case faceId
    
    public var permission: PermissionsKit.Permission {
        switch self {
        case .bluetooth: return PermissionsKit.Permission.bluetooth
        case .notification: return PermissionsKit.Permission.notification
        case .faceId: return PermissionsKit.Permission.faceID
        }
    }
    
    public var isAuthorized: Bool {
        
        let isAuthorized = self.permission.status == .authorized
        
        Logger.log("Permission: \(permission) isAuthorized: \(isAuthorized), status: \(permission.status)")
        
        return isAuthorized
    }
    
    public static func checkAllPermissionsAuthorizationStatus() {
        
        for permission in Permission.allCases {
            Logger.log("Permission: \(permission.permission.kind.name): authorized: \(permission.permission.status)")
        }
    }
    
    public static func logAllPermissions() {
        
        for permission in Permission.allCases {
            
            switch permission {
                
            case .bluetooth:
                let key = PermissionsKit.Permission.bluetooth.usageDescriptionKey
                let status = PermissionsKit.Permission.bluetooth.status
                Logger.log("Permission: \(permission.permission.kind.name): key: \(String(describing: key)), status: \(status)")
                
            case .notification:
                let authorized = PermissionsKit.Permission.notification.authorized
                Logger.log("Permission: \(permission.permission.kind.name): authorized: \(authorized)")
                
            case .faceId:
                let authorized = PermissionsKit.Permission.faceID.authorized
                Logger.log("Permission: \(permission.permission.kind.name): authorized: \(authorized)")
            }
        }
    }
}
