![AcquireIO](https://developers.acquire.io/media/data/acquire-logo.png)


[![CocoaPods](https://img.shields.io/badge/platforms-iOS-orange.svg?maxAge=2592000)](https://cocoapods.org/pods/AcquireIO-Core-Swift)
[![Language](https://img.shields.io/badge/languages-Swift-orange.svg?maxAge=2592000)](https://github.com/acquireio/AcquireIO-Core-Swift)



# Acquire SDK 

## Overview

👋 This is a repository of Cocoapods which are ad-hoc/beta releases of the AcquireIO frontend bundle iOS SDK.

## Features
  - Real-time Chat.
  - Audio/Video Chat (Note: Available only on CORE version).

## Requirements
  - iOS 10.0+
  - XCode 11.0+ 
  
The framework has been written in Swift 5.0, and we recommend use of Swift for the simplest and cleanest integration.

## Dependencies

The AcquireIO SDK has a dependency on [Socket.IO-Client-Swift](https://github.com/socketio/socket.io-client-swift). This dependency will be automatically included if installing via Cocoapods.

The SDK also includes the following third-party code:
  - [Socket.IO-Client-Swift](https://github.com/socketio/socket.io-client-swift) - Socket.IO-client for iOS/OS X.
  * [GoogleWebRTC](https://cocoapods.org/pods/GoogleWebRTC) - WebRTC SDK for iOS. (Applicable for CORE version only)

These dependencies are vendored and compiled into the SDK, this requires no action and is provided for information purposes only.


## Module Stability

Module stability is supported in Swift 5.1 (Xcode 11) and above. The advantage of this is that the SDK no longer needs to be recompiled for every new version of the Swift compiler.

**Acquire iOS SDK** is built with the "Build Libraries for Distribution" build setting enabled, which means that its dependencies must also be built in the same fashion. However, this is still not fully supported in Cocoapods as of December 2020, therefore some workarounds are required (see installation documentation for details).


## Repository contents

The framework package is provided via this repository, which contains the following:

   - README.md - This document!

   - AcquireIOSDK.xcframework - The AcquireIO framework in XCFramework format for iOS devices. You can add this to your project manually if you aren't using a dependency manager.
   - AcquireIO-Core-Swift.podspec - Required by Cocoapods. You do not need to do anything with this file.


## Installation 
### Using Cocoapods


1) Create a Podfile in your project's root directory, if it doesn't exist yet

2) Add the **AcquireIO-Core-Swift** in Podfile under your desired target:

   ```

   target :YourTargetName do
      pod 'AcquireIO-Core-Swift'
   end

   ```

3) Add the following to the bottom of your Podfile:

    ```

    post_install do |installer|
      installer.pods_project.targets.each do |target|
        if ['GoogleWebRTC', 'Socket.IO-Client-Swift', 'Starscream'].include? target.name
          target.build_configurations.each do |config|
              config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
          end
        end
      end
    end

    ```


4)  Run below command to install the SDK to your project 
        
      ```bash
  
      $ pod repo update && pod install

     ```

5)  Open your project using the generated *.xcworkspace file.


>  ###   **Note:** If you are new to CocoaPods, go to [CocoaPods](https://cocoapods.org/) to learn how to install it.

## Getting started

>  *Since iOS 10, it's mandatory to add before you access privacy-sensitive data like Camera, Microphone, and so on, you must ask for the authorization, or your app will crash when you access them.*

Open the file in your project named info.plist, right click it, opening as Source Code, paste this code below to it. Or you can open info.plist as Property List by default, click the add button, Xcode will give you the suggest completions while typing Privacy - with the help of keyboard and

Remember to write your description why you ask for this authorization, between <string> and </string>, or your app will be rejected by apple:
```
<!-- Camera -->
<key>NSCameraUsageDescription</key>
<string>$(PRODUCT_NAME) use camera for video chat</string>

<!-- Microphone -->
<key>NSMicrophoneUsageDescription</key>
<string>$(PRODUCT_NAME) use microphone for voice chat</string>

<!-- Photo Library -->
<key>NSPhotoLibraryUsageDescription</key>
<string>$(PRODUCT_NAME) send photo/video to agent</string>

```

Also, The AcquireIO SDK uses background mode Audio for when you are video/voice call to agent/visitor. If you have not enable then background voice will not work. When the UIBackgroundModes key contains the audio value, the system’s media frameworks automatically prevent the corresponding app from being suspended when it moves to the background

To allow your AcquireIO SDK to play audio in background, Enable it using below steps
1) Select your project file in the Navigator of Xcode.
2) From the Capabilities section, switch on the **Background Modes** subsection
3) Switch **ON** the Background Modes subsection. After background modes are listed, tick on the *Audio, Airplay & picture in picture*


## Setup and Configuration

* Our [installation guide](https://developers.acquire.io/getting-start-ios) contains full setup and initialisation instructions.
* Read ["Configuring AcquireIO for iOS"](https://developers.acquire.io/sdk-congifuration-example).
* Read our guide on [Push Notifications](https://developers.acquire.io/ios-push-notifications).
* Please contact us on [AcquireIO](https://acquire.io) with any questions you may have, we're only a message away!


## What about events, push notifications, company and user data?

AcquireIO for iOS has support for all these things. For full details please read our [documentation](https://developers.acquire.io/sdk-congifuration-example).



## Help & Support

If you have any questions or comments, you can reach us at [Acquire](https://github.com/Chirag-Acquire/)

## License
AcquireIO Cocoapods are distributed under [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html).

