# DialKit SDK Documentation

## Overview
DialKit is a comprehensive softphone SDK for iOS that enables voice calling, push notifications, and customizable UI components.

## Installation

### Swift Package Manager
1. In Xcode: **File → Add Packages**
2. Enter package URL: `https://github.com/ahmadraza738/DialKit`
3. Select version rule and add to your project

## Initialization

### Basic Setup
```swift
import UIKit
import DialKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Initialize the SDK
        SDKModule.shared.initializeSoftphone()
        
        // Configure license and features
        SDKModule.shared.license(
            license: "YOUR_LICENSE_KEY",
            maxConcurrentCalls: 3,
            voicemailEnabled: true,
            pushNotificationsEnabled: true,
            userAgentOverride: "Your App Name"
        )
        
        // Register account configuration
        SDKModule.shared.registerXML(xml: AccountXML.xml)
        
        // Setup push notifications
        PushNotifications.shared.setup(application: application)
        
        // Set log delegate for debugging
        SDKModule.shared.setLogDelegate(self)
        
        return true
    }
}
```

## Making Phone Calls

### Basic Call Setup
```swift
func makeCall(to number: String) {
    SDKModule.shared.placeCall(number)
}
```

### Call with Contact Information
```swift
func makeCallWithContactInfo(number: String, contactName: String, avatarURL: String? = nil) {
    let contactInfo = DialKit.ContactInfo(
        fullName: contactName,
        number: number,
        avatarUrl: avatarURL
    )
    
    // Store for call history if needed
    AppPreferences.shared.storeLastDialedNumber(number)
    
    // Place the call
    SDKModule.shared.placeCall(number, contactInfo)
}
```

## UI Customization

### Complete Theme Configuration
```swift
func configureSDKTheme() {
    let theme = SDKTheme.shared
    
    // Call Screen Back Button
    theme.buttonStyle(for: .callScreen_backBtn)
        .setImage(UIImage(named: "back_icon"))
        .setCornerRadius(22)
    
    // Call Screen Transfer Button
    theme.buttonStyle(for: .callScreen_transferBtn)
        .setImage(UIImage(named: "transfer_icon"))
    
    // Audio Route Button (Speaker, Headset, Bluetooth)
    theme.buttonStyle(for: .callScreen_audioBtn)
        .setAudioImage(UIImage(named: "audio_normal"), type: .normal)
        .setAudioImage(UIImage(named: "speaker"), type: .speaker)
        .setAudioImage(UIImage(named: "headset"), type: .headset)
        .setAudioImage(UIImage(named: "bluetooth"), type: .bluetooth)
    
    // Mute Button
    theme.buttonStyle(for: .callScreen_muteBtn)
        .setImage(UIImage(named: "unmute"), for: .selected)
        .setImage(UIImage(named: "mute"), for: .normal)
    
    // Add/Merge Call Button
    theme.buttonStyle(for: .callScreen_addCallBtn)
        .setAddCallImage(UIImage(named: "add_call"), type: .add)
        .setAddCallImage(UIImage(named: "merge_calls"), type: .merge)
    
    // Keypad Button
    theme.buttonStyle(for: .callScreen_keypadBtn)
        .setImage(UIImage(named: "keypad"))
    
    // Hold Button
    theme.buttonStyle(for: .callScreen_holdBtn)
        .setImage(UIImage(named: "unhold"), for: .selected)
        .setImage(UIImage(named: "hold"), for: .normal)
    
    // End Call Button
    theme.buttonStyle(for: .callScreen_endBtn)
        .setImage(UIImage(named: "end_disabled"), for: .disabled)
        .setImage(UIImage(named: "end_highlighted"), for: .highlighted)
        .setImage(UIImage(named: "end_normal"), for: .normal)
    
    // Background Images
    theme.imageStyle(for: .callScreen_backgroundImage)
        .setImage(UIImage(named: "call_background"))
    
    theme.imageStyle(for: .inCallKeypadVC_backgroundImage)
        .setImage(UIImage(named: "keypad_background"))
    
    // Visual Effects
    theme.visualEffectStyle(for: .inCallKeypadVC_visualEffect)
        .setBlurStyle(.dark)
}
```

## Push Notifications Setup

### APNS Configuration
```swift
extension AppDelegate {
    // MARK: - APNS Forwarding
    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        print("{ARPN} didRegisterForRemoteNotificationsWithDeviceToken\(deviceToken)")
        PushNotifications.shared.didRegisterForRemoteNotifications(deviceToken: deviceToken)
    }
    
    func application(
        _ application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError error: Error
    ) {
        print("{ARPN} didFailToRegisterForRemoteNotificationsWithError\(error)")
        PushNotifications.shared.didFailToRegister(error: error)
    }
    
    func application(
        _ application: UIApplication,
        didReceiveRemoteNotification userInfo: [AnyHashable : Any],
        fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
    ) {
        print("{ARPN} didReceiveRemoteNotification\(userInfo)")
        PushNotifications.shared.didReceiveRemoteNotification(userInfo: userInfo, completionHandler: completionHandler)
    }
    
    // MARK: - Siri / Call intents
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity) -> Bool {
        print("{ARPN} userActivity\(userActivity)")
        return PushNotifications.shared.continueUserActivity(userActivity)
    }
}
```

## Logging and Debugging

### Implement Log Delegate
```swift
extension AppDelegate: SDKLogDelegate {
    func sdkDidLog(message: String, tag: String, file: String, function: String, line: Int) {
        print("[DialKit] [\(tag)] \(file).\(function):\(line) - \(message)")
    }
}
```

## Contact Information Structure

### ContactInfo Model
```swift
// Create contact information for calls
let contactInfo = DialKit.ContactInfo(
    fullName: "John Doe",           // Contact's full name
    number: "+1234567890",          // Phone number
    avatarUrl: "https://example.com/avatar.jpg"  // Optional avatar URL
)
```

## License Configuration

### License Options
```swift
SDKModule.shared.license(
    license: "your_license_key_here",    // Required: Your license key
    maxConcurrentCalls: 3,               // Maximum simultaneous calls
    voicemailEnabled: true,              // Enable voicemail features
    pushNotificationsEnabled: true,      // Enable push notifications
    userAgentOverride: "My Business App" // Custom user agent string
)
```

## Best Practices

1. **Initialize early** in `didFinishLaunchingWithOptions`
2. **Configure theme** before presenting any call UI
3. **Handle push notifications** for background calling
4. **Use ContactInfo** for better user experience
5. **Implement logging** for debugging purposes

## Troubleshooting

- Ensure proper license key configuration
- Check push notification capabilities in project settings
- Verify network connectivity for SIP registration
- Monitor logs through `SDKLogDelegate`

This documentation provides a comprehensive guide for integrating and customizing the DialKit SDK in your iOS application.

## Mannual Integration

Download XCFramework:
https://github.com/ahmadraza738/DialKit/releases/download/1.0.2/DialKit.xcframework.zip

Current Version: 1.0.2
