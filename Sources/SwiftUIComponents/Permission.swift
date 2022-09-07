//
//  Permissions.swift
//  SwiftUtilities
//
//  Created by Moi Gutierrez on 8/22/22.
//

import Foundation

import CloudyLogs
import PermissionsKit

/*
#if BluetoothPermission
#if NotificationPermission
#if FaceIDPermission
#if CameraPermission
#if PhotoLibraryPermission
#if MicrophonePermission
#if CalendarPermission
#if ContactsPermission
#if RemindersPermission
#if SpeechRecognizerPermission
#if LocationWhenInUsePermission
#if LocationAlwaysPermission
#if MotionPermission
#if MediaLibraryPermission
#if TrackingPermission
#if SiriPermission
#if HealthPermission
*/

/*
 Configuration file example:
 
 // Permissions
 BluetoothPermission         = YES
 NotificationPermission      = YES
 FaceIDPermission            = YES
 CameraPermission            = NO
 PhotoLibraryPermission      = NO
 MicrophonePermission        = NO
 CalendarPermission          = NO
 ContactsPermission          = NO
 RemindersPermission         = NO
 SpeechRecognizerPermission  = NO
 LocationWhenInUsePermission = YES
 LocationAlwaysPermission    = YES
 MotionPermission            = NO
 MediaLibraryPermission      = NO
 TrackingPermission          = NO
 SiriPermission              = NO
 HealthPermission            = NO
 
 */

import BluetoothPermission
import NotificationPermission
import FaceIDPermission

// TOOO: figure out a way to conditionally compile enums for swift package
//#if BluetoothPermission
//import BluetoothPermission
//#endif
//#if NotificationPermission
//import NotificationPermission
//#endif
//#if FaceIDPermission
//import FaceIDPermission
//#endif
//#if CameraPermission
//import CameraPermission
//#endif
//#if PhotoLibraryPermission
//import PhotoLibraryPermission
//#endif
//#if MicrophonePermission
//import MicrophonePermission
//#endif
//#if CalendarPermission
//import CalendarPermission
//#endif
//#if ContactsPermission
//import ContactsPermission
//#endif
//#if RemindersPermission
//import RemindersPermission
//#endif
//#if SpeechRecognizerPermission
//import SpeechRecognizerPermission
//#endif
//#if LocationWhenInUsePermission
//import LocationWhenInUsePermission
//#endif
//#if LocationAlwaysPermission
//import LocationAlwaysPermission
//#endif
//#if MotionPermission
//import MotionPermission
//#endif
//#if MediaLibraryPermission
//import MediaLibraryPermission
//#endif
//#if TrackingPermission
//import TrackingPermission
//#endif
//#if SiriPermission
//import SiriPermission
//#endif
//#if HealthPermission
//import HealthPermission
//#endif

/*
 
 ****** INFO.plist keys ****************************************
 
 Calendar :
 Key      :  Privacy - Calendars Usage Description
 Value  :  $(PRODUCT_NAME) calendar events

 Reminder :
 Key      :   Privacy - Reminders Usage Description
 Value  :   $(PRODUCT_NAME) reminder use

 Contact :
 Key       :   Privacy - Contacts Usage Description
 Value    :  $(PRODUCT_NAME) contact use

 Photo :
 Key       :  Privacy - Photo Library Usage Description
 Value   :  $(PRODUCT_NAME) photo use

 Bluetooth Sharing :
 Key       :  Privacy - Bluetooth Peripheral Usage Description
 Value   :  $(PRODUCT_NAME) Bluetooth Peripheral use

 Microphone :
 Key        :  Privacy - Microphone Usage Description
 Value    :  $(PRODUCT_NAME) microphone use

 Camera :
 Key       :  Privacy - Camera Usage Description
 Value   :  $(PRODUCT_NAME) camera use

 Location :
 Key      :  Privacy - Location Always Usage Description
 Value  :  $(PRODUCT_NAME) location use

 Key       :  Privacy - Location When In Use Usage Description
 Value   :  $(PRODUCT_NAME) location use

 Heath :
 Key      :  Privacy - Health Share Usage Description
 Value  :  $(PRODUCT_NAME) heath share use

 Key      :  Privacy - Health Update Usage Description
 Value  :  $(PRODUCT_NAME) heath update use

 HomeKit :
 Key      :  Privacy - HomeKit Usage Description
 Value  :  $(PRODUCT_NAME) home kit use

 Media Library :
 Key      :  Privacy - Media Library Usage Description
 Value  :  $(PRODUCT_NAME) media library use

 Motion :
 Key      :  Privacy - Motion Usage Description
 Value  :  $(PRODUCT_NAME) motion use

 Speech Recognition :
 Key      :  Privacy - Speech Recognition Usage Description
 Value  :  $(PRODUCT_NAME) speech use

 SiriKit  :
 Key      :  Privacy - Siri Usage Description
 Value  :  $(PRODUCT_NAME) siri use

 TV Provider :
 Key      :  Privacy - TV Provider Usage Description
 Value  :  $(PRODUCT_NAME) tvProvider use

 */

/*
 
 ****** INFO.plist keys RAW ****************************************

 <key>NSVideoSubscriberAccountUsageDescription</key>
 <string>to learn</string>
 <key>NSMotionUsageDescription</key>
 <string>to learn</string>
 <key>NSHomeKitUsageDescription</key>
 <string>to learn</string>
 <key>NSLocationWhenInUseUsageDescription</key>
 <string>to learn</string>
 <key>NSHealthShareUsageDescription</key>
 <string>to learn</string>
 <key>NSMicrophoneUsageDescription</key>
 <string>to learn</string>
 <key>NSPhotoLibraryUsageDescription</key>
 <string>to learn</string>
 <key>NSRemindersUsageDescription</key>
 <string>to learn</string>
 <key>NSAppleMusicUsageDescription</key>
 <string>to learn</string>
 <key>NSSpeechRecognitionUsageDescription</key>
 <string>to learn</string>
 <key>NSSiriUsageDescription</key>
 <string>to learn</string>
 <key>NSUserTrackingUsageDescription</key>
 <string>to learn</string>
 <key>NSLocationAlwaysUsageDescription</key>
 <string>to learn</string>
 <key>NSFallDetectionUsageDescription</key>
 <string>to learn</string>
 <key>NSFaceIDUsageDescription</key>
 <string>to learn</string>
 <key>NSDocumentsFolderUsageDescription</key>
 <string>to learn</string>
 <key>NSContactsUsageDescription</key>
 <string>to learn</string>
 <key>NSBluetoothPeripheralUsageDescription</key>
 <string>to learn</string>
 <key>NSBluetoothAlwaysUsageDescription</key>
 <string>to learn</string>
 <key>NSAppleEventsUsageDescription</key>
 <string>to learn</string>
 <key>NSFileProviderDomainUsageDescription</key>
 <string>to learn</string>
 <key>NSCalendarsUsageDescription</key>
 <string>to learn</string>
 <key>NSCameraUsageDescription</key>
 <string>to learn</string>
 */

public enum Permission: CaseIterable, Hashable {
        
    case bluetooth
    case notification
    case faceId

//#if BluetoothPermission
//    case bluetooth
//#endif
//#if NotificationPermission
//    case notification
//#endif
//#if FaceIDPermission
//    case faceId
//#endif
//#if CameraPermission
//    case camera
//#endif
//#if PhotoLibraryPermission
//    case photoLibrary
//#endif
//#if MicrophonePermission
//    case microphone
//#endif
//#if CalendarPermission
//    case calendar
//#endif
//#if ContactsPermission
//    case contacts
//#endif
//#if RemindersPermission
//    case reminders
//#endif
//#if SpeechRecognizerPermission
//    case speechRecognizer
//#endif
//#if LocationWhenInUsePermission
//    case locationWhenInUse
//#endif
//#if LocationAlwaysPermission
//    case locationAlways
//#endif
//#if MotionPermission
//    case motion
//#endif
//#if MediaLibraryPermission
//    case mediaLibrary
//#endif
//#if TrackingPermission
//    case tracking
//#endif
//#if SiriPermission
//    case siri
//#endif
//#if HealthPermission
//#if os(iOS) && PERMISSIONSKIT_HEALTH
//    case health
//#endif
//#endif
    

    public var permission: PermissionsKit.Permission {
        switch self {
        case .bluetooth: return PermissionsKit.Permission.bluetooth
        case .notification: return PermissionsKit.Permission.notification
        case .faceId: return PermissionsKit.Permission.faceID
//#if BluetoothPermission
//        case .bluetooth: return PermissionsKit.Permission.bluetooth
//#endif
//#if NotificationPermission
//        case .notification: return PermissionsKit.Permission.notification
//#endif
//#if FaceIDPermission
//        case .faceId: return PermissionsKit.Permission.faceID
//#endif
//#if CameraPermission
//        case .camera: return PermissionsKit.Permission.camera
//#endif
//#if PhotoLibraryPermission
//        case .photoLibrary: return PermissionsKit.Permission.photoLibrary
//#endif
//#if MicrophonePermission
//        case .microphone: return PermissionsKit.Permission.microphone
//#endif
//#if CalendarPermission
//        case .calendar: return PermissionsKit.Permission.calendar
//#endif
//#if ContactsPermission
//        case .contacts: return PermissionsKit.Permission.contacts
//#endif
//#if RemindersPermission
//        case .reminders: return PermissionsKit.Permission.reminders
//#endif
//#if SpeechRecognizerPermission
//        case .speechRecognizer: return PermissionsKit.Permission.speech
//#endif
//#if LocationWhenInUsePermission
//        case .locationWhenInUse: return PermissionsKit.Permission.locationWhenInUse
//#endif
//#if LocationAlwaysPermission
//        case .locationAlways: return PermissionsKit.Permission.locationAlways
//#endif
//#if MotionPermission
//        case .motion: return PermissionsKit.Permission.motion
//#endif
//#if MediaLibraryPermission
//        case .mediaLibrary: return PermissionsKit.Permission.mediaLibrary
//#endif
//#if TrackingPermission
//        case .tracking: return PermissionsKit.Permission.tracking
//#endif
//#if SiriPermission
//        case .siri: return PermissionsKit.Permission.siri
//#endif
//#if HealthPermission
//#if os(iOS) && PERMISSIONSKIT_HEALTH
//        case .health: return PermissionsKit.Permission.health
//#endif
//#endif
        }
    }
    
    public var name: String {
        switch self {
        case .bluetooth: return "bluetooth"
        case .notification: return "notification"
        case .faceId: return "faceId"
//#if BluetoothPermission
//        case .bluetooth: return "bluetooth"
//#endif
//#if NotificationPermission
//        case .notification: return "notification"
//#endif
//#if FaceIDPermission
//        case .faceId: return "faceId"
//#endif
//#if CameraPermission
//        case .camera: return "camera"
//#endif
//#if PhotoLibraryPermission
//        case .photoLibrary: return "photoLibrary"
//#endif
//#if MicrophonePermission
//        case .microphone: return "microphone"
//#endif
//#if CalendarPermission
//        case .calendar: return "calendar"
//#endif
//#if ContactsPermission
//        case .contacts: return "contacts"
//#endif
//#if RemindersPermission
//        case .reminders: return "reminders"
//#endif
//#if SpeechRecognizerPermission
//        case .speechRecognizer: return "speechRecognizer"
//#endif
//#if LocationWhenInUsePermission
//        case .locationWhenInUse: return "locationWhenInUse"
//#endif
//#if LocationAlwaysPermission
//        case .locationAlways: return "locationAlways"
//#endif
//#if MotionPermission
//        case .motion: return "motion"
//#endif
//#if MediaLibraryPermission
//        case .mediaLibrary: return "mediaLibrary"
//#endif
//#if TrackingPermission
//        case .tracking: return "tracking"
//#endif
//#if SiriPermission
//        case .siri: return "siri"
//#endif
//#if HealthPermission
//#if os(iOS) && PERMISSIONSKIT_HEALTH
//        case .health: return "health"
//#endif
//#endif
//        default: break
        }
    }
    
    public var status: String {
        switch self {
            
        case .bluetooth: return PermissionsKit.Permission.bluetooth.status.description
        case .notification: return PermissionsKit.Permission.notification.status.description
        case .faceId: return PermissionsKit.Permission.faceID.status.description
//#if BluetoothPermission
//        case .bluetooth: return Permission.bluetooth.status
//#endif
//#if NotificationPermission
//        case .notification: return Permission.notification.status
//#endif
//#if FaceIDPermission
//        case .faceId: return Permission.faceId.status
//#endif
//#if CameraPermission
//        case .camera: return Permission.camera.status
//#endif
//#if PhotoLibraryPermission
//        case .photoLibrary: return Permission.photoLibrary.status
//#endif
//#if MicrophonePermission
//        case .microphone: return Permission.microphone.status
//#endif
//#if CalendarPermission
//        case .calendar: return Permission.calendar.status
//#endif
//#if ContactsPermission
//        case .contacts: return Permission.contacts.status
//#endif
//#if RemindersPermission
//        case .reminders: return Permission.reminders.status
//#endif
//#if SpeechRecognizerPermission
//        case .speechRecognizer: return Permission.speechRecognizer.status
//#endif
//#if LocationWhenInUsePermission
//        case .locationWhenInUse: return Permission.locationWhenInUse.status
//#endif
//#if LocationAlwaysPermission
//        case .locationAlways: return Permission.locationAlways.status
//#endif
//#if MotionPermission
//        case .motion: return Permission.motion.status
//#endif
//#if MediaLibraryPermission
//        case .mediaLibrary: return Permission.mediaLibrary.status
//#endif
//#if TrackingPermission
//        case .tracking: return Permission.tracking.status
//#endif
//#if SiriPermission
//        case .siri: return Permission.siri.status
//#endif
//#if HealthPermission
//#if os(iOS) && PERMISSIONSKIT_HEALTH
//        case .health: return Permission.health.status
//#endif
//#endif
//        default: break
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
        
#if BluetoothPermission
        Logger.log("Permission: #BluetoothPermission")
#else
        Logger.log("Permission: no #if BluetoothPermission compiler configuration definition or value is false")
#endif
#if NotificationPermission
        Logger.log("Permission: #NotificationPermission")
#else
        Logger.log("Permission: no #if NotificationPermission compiler configuration definition or value is false")
#endif
#if FaceIDPermission
        Logger.log("Permission: #FaceIDPermission")
#else
        Logger.log("Permission: no #if FaceIDPermission compiler configuration definition or value is false")
#endif
#if CameraPermission
        Logger.log("Permission: #CameraPermission")
#else
        Logger.log("Permission: no #if CameraPermission compiler configuration definition or value is false")
#endif
#if PhotoLibraryPermission
        Logger.log("Permission: #PhotoLibraryPermission")
#else
        Logger.log("Permission: no #if PhotoLibraryPermission compiler configuration definition or value is false")
#endif
#if MicrophonePermission
        Logger.log("Permission: #MicrophonePermission")
#else
        Logger.log("Permission: no #if MicrophonePermission compiler configuration definition or value is false")
#endif
#if CalendarPermission
        Logger.log("Permission: #CalendarPermission")
#else
        Logger.log("Permission: no #if CalendarPermission compiler configuration definition or value is false")
#endif
#if ContactsPermission
        Logger.log("Permission: #ContactsPermission")
#else
        Logger.log("Permission: no #if ContactsPermission compiler configuration definition or value is false")
#endif
#if RemindersPermission
        Logger.log("Permission: #RemindersPermission")
#else
        Logger.log("Permission: no #if RemindersPermission compiler configuration definition or value is false")
#endif
#if SpeechRecognizerPermission
        Logger.log("Permission: #SpeechRecognizerPermission")
#else
        Logger.log("Permission: no #if SpeechRecognizerPermission compiler configuration definition or value is false")
#endif
#if LocationWhenInUsePermission
        Logger.log("Permission: #LocationWhenInUsePermission")
#else
        Logger.log("Permission: no #if LocationWhenInUsePermission compiler configuration definition or value is false")
#endif
#if LocationAlwaysPermission
        Logger.log("Permission: #LocationAlwaysPermission")
#else
        Logger.log("Permission: no #if LocationAlwaysPermission compiler configuration definition or value is false")
#endif
#if MotionPermission
        Logger.log("Permission: #MotionPermission")
#else
        Logger.log("Permission: no #if MotionPermission compiler configuration definition or value is false")
#endif
#if MediaLibraryPermission
        Logger.log("Permission: #MediaLibraryPermission")
#else
        Logger.log("Permission: no #if MediaLibraryPermission compiler configuration definition or value is false")
#endif
#if TrackingPermission
        Logger.log("Permission: #TrackingPermission")
#else
        Logger.log("Permission: no #if TrackingPermission compiler configuration definition or value is false or value is false")
#endif
#if SiriPermission
        Logger.log("Permission: #SiriPermission")
#else
        Logger.log("Permission: no #if SiriPermission compiler configuration definition or value is false")
#endif
#if HealthPermission
        Logger.log("Permission: #HealthPermission")
#else
        Logger.log("Permission: no #if HealthPermission compiler configuration definition or value is false")
#endif
        
        for permission in Permission.allCases {
            
            switch permission {
               
            case .bluetooth: let key = PermissionsKit.Permission.bluetooth.usageDescriptionKey; let status = PermissionsKit.Permission.bluetooth.status; Logger.log("Permission: \(permission.permission.kind.name): key: \(String(describing: key)), status: \(status)")
            case .notification: let authorized = PermissionsKit.Permission.notification.authorized; Logger.log("Permission: \(permission.permission.kind.name): authorized: \(authorized)")
            case .faceId: let authorized = PermissionsKit.Permission.faceID.authorized; Logger.log("Permission: \(permission.permission.kind.name): authorized: \(authorized)")
                
//#if BluetoothPermission
//            case .bluetooth: let key = PermissionsKit.Permission.bluetooth.usageDescriptionKey; let status = PermissionsKit.Permission.bluetooth.status; Logger.log("Permission: \(permission.permission.kind.name): key: \(String(describing: key)), status: \(status)")
//                #endif
//#if NotificationPermission
//            case .notification: let authorized = PermissionsKit.Permission.notification.authorized; Logger.log("Permission: \(permission.permission.kind.name): authorized: \(authorized)")
//                #endif
//#if FaceIDPermission
//            case .faceId: let authorized = PermissionsKit.Permission.faceID.authorized; Logger.log("Permission: \(permission.permission.kind.name): authorized: \(authorized)")
//                #endif
//#if CameraPermission
//            case .camera: Logger.log("Permission: \(permission.permission.kind.name): authorized: \(PermissionsKit.Permission.camera.authorized)")
//                #endif
//#if PhotoLibraryPermission
//            case .photoLibrary: Logger.log("Permission: \(permission.permission.kind.name): authorized: \(PermissionsKit.Permission.photoLibrary.authorized)")
//                #endif
//#if MicrophonePermission
//            case .microphone: Logger.log("Permission: \(permission.permission.kind.name): authorized: \(PermissionsKit.Permission.microphone.authorized)")
//                #endif
//#if CalendarPermission
//            case .calendar: Logger.log("Permission: \(permission.permission.kind.name): authorized: \(PermissionsKit.Permission.calendar.authorized)")
//                #endif
//#if ContactsPermission
//            case .contacts: Logger.log("Permission: \(permission.permission.kind.name): authorized: \(PermissionsKit.Permission.contacts.authorized)")
//                #endif
//#if RemindersPermission
//            case .reminders: Logger.log("Permission: \(permission.permission.kind.name): authorized: \(PermissionsKit.Permission.reminders.authorized)")
//                #endif
//#if SpeechRecognizerPermission
//            case .speechRecognizer: Logger.log("Permission: \(permission.permission.kind.name): authorized: \(PermissionsKit.Permission.speech.authorized)")
//                #endif
//#if LocationWhenInUsePermission
//            case .locationWhenInUse: Logger.log("Permission: \(permission.permission.kind.name): authorized: \(PermissionsKit.Permission.locationWhenInUse.authorized)")
//                #endif
//#if LocationAlwaysPermission
//            case .locationAlways: Logger.log("Permission: \(permission.permission.kind.name): authorized: \(PermissionsKit.Permission.locationAlways.authorized)")
//                #endif
//#if MotionPermission
//            case .motion: Logger.log("Permission: \(permission.permission.kind.name): authorized: \(PermissionsKit.Permission.motion.authorized)")
//                #endif
//#if MediaLibraryPermission
//            case .mediaLibrary: Logger.log("Permission: \(permission.permission.kind.name): authorized: \(PermissionsKit.Permission.mediaLibrary.authorized)")
//                #endif
//#if TrackingPermission
//            case .tracking: Logger.log("Permission: \(permission.permission.kind.name): authorized: \(PermissionsKit.Permission.tracking.authorized)")
//                #endif
//#if SiriPermission
//            case .siri: Logger.log("Permission: \(permission.permission.kind.name): authorized: \(PermissionsKit.Permission.siri.authorized)")
//                #endif
//#if HealthPermission
//#if os(iOS) && PERMISSIONSKIT_HEALTH
//            case .health: Logger.log("Permission: \(permission.permission.kind.name): authorized: \(PermissionsKit.Permission.health.authorized)")
//#endif
//#endif
            }
        }
    }
    
    public static func request(completion: @escaping ()->Void) {
        
        switch self {
#if BluetoothPermission
        case .bluetooth: return Permission.bluetooth.request
#endif
#if NotificationPermission
        case .notification: return Permission.notification.request
#endif
#if FaceIDPermission
        case .faceId: return Permission.faceId.request
#endif
#if CameraPermission
        case .camera: return Permission.camera.request
#endif
#if PhotoLibraryPermission
        case .photoLibrary: return Permission.photoLibrary.request
#endif
#if MicrophonePermission
        case .microphone: return Permission.microphone.request
#endif
#if CalendarPermission
        case .calendar: return Permission.calendar.request
#endif
#if ContactsPermission
        case .contacts: return Permission.contacts.request
#endif
#if RemindersPermission
        case .reminders: return Permission.reminders.request
#endif
#if SpeechRecognizerPermission
        case .speechRecognizer: return Permission.speechRecognizer.request
#endif
#if LocationWhenInUsePermission
        case .locationWhenInUse: return Permission.locationWhenInUse.request
#endif
#if LocationAlwaysPermission
        case .locationAlways: return Permission.locationAlways.request
#endif
#if MotionPermission
        case .motion: return Permission.motion.request
#endif
#if MediaLibraryPermission
        case .mediaLibrary: return Permission.mediaLibrary.request
#endif
#if TrackingPermission
        case .tracking: return Permission.tracking.request
#endif
#if SiriPermission
        case .siri: return Permission.siri.request
#endif
#if HealthPermission
#if os(iOS) && PERMISSIONSKIT_HEALTH
        case .health: return Permission.health.request
#endif
#endif
        default: break
        }
    }
}
