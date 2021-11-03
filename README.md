## Table of contents
- [Getting started](#getting-started)
    - [1. Obtaining an authentication token](#1-obtaining-an-authentication-token)
    - [2. Availability information & new project setup](#2-availability-information--new-project-setup)
    - [3. Adding iDenfy Flutter SDK](#3-adding-idenfy-flutter-sdk)
        - [3.1 Configuring Android project](#31-configuring-android-project)
            - [3.2 Configuring IOS project](#32-configuring-ios-project)
    - [4. Adding iDenfy Flutter SDK manually](#4-adding-idenfy-flutter-sdk-manually)
        - [4.1 Configuring Android project](#41-configuring-android-project)
            - [4.2 Configuring IOS project](#42-configuring-ios-project)
*   [Usage](#usage)
*   [Callbacks](#callbacks)
*   [Additional customization](#additional-customization)
*   [SDK Integration tutorials](#sdk-integration-tutorials)


## Getting started

The @idenfy/idenfy_sdk_flutter is an official Flutter plugin, which provides an easier integration of iDenfy KYC services.

### 1. Obtaining an authentication token

The SDK requires token for starting initialization. [Token generation guide](https://github.com/idenfy/Documentation/blob/master/pages/GeneratingIdentificationToken.md)

### 2. Availability information & new project setup

Minimum required versions by the platform:

**IOS - 11.0 (Can be configured for 10.0, but will require Xcode 12.5.1)**

**Android - API 19**

If you are starting a new Flutter project you can follow [Flutter install guide](https://flutter.dev/docs/get-started/install).
Once the setup is completed successfully, you can add iDenfy SDK dependencies.

### 3. Adding iDenfy Flutter SDK

To add iDenfy SDK plugin, open your project's `pubspec.yaml` file and append it with the latest iDenfy SDK flutter plugin:
```yaml
dependencies:
  idenfy_sdk_flutter: ^1.4.0
```

#### 3.1 Configuring Android project
Please make sure to enable multidex in `app/build.gradle`:
```gradle
android {
  defaultConfig {
     multiDexEnabled true
  }
}
```

#### 3.2 Configuring IOS project
`NSCameraUsageDescription` must be provided in the application's `Info.plist` file:
```xml
<key>NSCameraUsageDescription</key>
<string>Required for document and facial capture</string>
```

Install the pods:
```shell
cd ios
pod install
cd ..
```
### 4. Adding iDenfy Flutter SDK manually
For more customization, you can use our sample in this repository

#### 4.1 Configuring Android Project

Please make sure you use the latest iDenfy SDK dependency in `build/gradle` file:

```gradle
dependencies {
    implementation "idenfySdk:com.idenfy.idenfySdk:x.y.z"
}
```

Having done that, sync gradle project files.

#### 4.2 Configuring IOS Project

#### 1. Installing dependency
Please make sure you use the latest iDenfy SDK dependency in `idenfy_sdk_flutter.podspec` file:
```xml
s.dependency 'iDenfySDK/iDenfyLiveness', 'x.y.z'
```

#### 2. Updating post install script
Navigate to the ios/Podfile file and edit the post_install script.
```shell
post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == "ZIPFoundation" || target.name == "lottie-ios"
      target.build_configurations.each do |config|
        config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      end
    end
    if target.name == "idenfy_sdk_flutter"
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
      end
    end
    flutter_additional_ios_build_settings(target)
  end
end
```
This script ensures that both "ZIPFoundation" and  "lottie-ios" have module stability as well as IOS 11.0 support, which is required for the NFC feature.
#### 3. Running pod install
After that, install the pods:
```shell
cd ios
pod install
cd ..
```

If you face compiling issues, like "using bridging headers with module interfaces is unsupported" you should set **Build libraries for distribution** to NO in your app build settings.

The example IOS app has the correct configuration.

## Usage

Firstly, import idenfysdkflutter.dart file:
```javascript
import 'package:idenfy_sdk_flutter/idenfy_sdk_flutter.dart';
```

After successful integration you should be able to call IdenfySdkFlutter.start method.

If the project is not successfully compiled or runtime issues occur, make sure you have followed the steps. For better understanding you may check the sample app in this repository.

Once you have an authentication token, which can be retrieved with following code, found in the example app, you can call IdenfySdkFlutter.start:

```javascript
  Future<String> getAuthTokenRequest() async {
      final response = await http.post(
        Uri.https(Constants.BASE_URL, '/api/v2/token'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Basic ' + base64Encode(utf8.encode('${Constants.apiKey}:${Constants.apiSecret}')),
        },
        body: jsonEncode(<String, String> {
          "clientId": Constants.clientId,
        }),
      );
      if (response.statusCode == 201) {
        return jsonDecode(response.body)["authToken"];
      } else {
        throw Exception('Failed to fetch token');
      }
    }

  Future<void> initIdenfySdk() async {
      IdenfyIdentificationResult idenfySDKresult;
      Exception localException;
      try {
      String authToken = await getAuthTokenRequest();
        idenfySDKresult = await IdenfySdkFlutter.start(authToken);
      } on Exception catch(e) {
        localException = e;
      }

      setState(() {
        _idenfySDKresult = idenfySDKresult;
        exception = localException;
      });
    }
```
Please make sure to provide your cliendId, apikey and apisecret constants, they can be found in `constants.dart` file:
```javascript
const String BASE_URL = 'ivs.idenfy.com';
const String clientId = 'idenfySampleClientID';
const String apiKey = 'PUT_YOUR_IDENFY_API_KEY_HERE';
const String apiSecret = 'PUT_YOUR_IDENFY_API_SECRET_HERE';
```

Calling IdenfySdkFlutter.start with provided authToken:


```javascript
  Future<void> initIdenfySdk() async {
    IdenfyIdentificationResult idenfySDKresult;
    String authToken = "TOKEN"
    try {
        idenfySDKresult = await IdenfySdkFlutter.start(authToken);
    } on PlatformException {
    }

    setState(() {
        _idenfySDKresult = idenfySDKresult;
    });
```
## Callbacks

Callback from the SDK can be retrieved from IdenfySdkFlutter.start future:
````javascript
try {
    idenfySDKresult = await IdenfySdkFlutter.start(authToken);
} on PlatformException {
}

setState(() {
    _idenfySDKresult = idenfySDKresult;
});
````
Result is an `IdenfyIdentificationResult` class with `AutoIdentificationStatus` and `ManualIdentificationStatus` enums:

```javascript
class IdenfyIdentificationResult {
    AutoIdentificationStatus autoIdentificationStatus;
    ManualIdentificationStatus manualIdentificationStatus;
}
```

Information about the IdenfyIdentificationResult **autoIdentificationStatus** statuses:

|Name            |Description
|-------------------|------------------------------------
|`APPROVED`   |The user completed an identification flow and the identification status, provided by an automated platform, is APPROVED.
|`FAILED`|The user completed an identification flow and the identification status, provided by an automated platform, is FAILED.
|`UNVERIFIED`   |The user did not complete an identification flow and the identification status, provided by an automated platform, is UNVERIFIED.

Information about the IdenfyIdentificationResult **manualIdentificationStatus** statuses:

|Name            |Description
|-------------------|------------------------------------
|`APPROVED`   |The user completed an identification flow and was verified manually while waiting for the manual verification results in the iDenfy SDK. The identification status, provided by a manual review, is APPROVED.
|`FAILED`|The user completed an identification flow and was verified manually while waiting for the manual verification results in the iDenfy SDK. The identification status, provided by a manual review, is FAILED.
|`WAITING`|The user completed an identification flow and started waiting for the manual verification results in the iDenfy SDK. Then he/she decided to stop waiting and pressed a "BACK TO ACCOUNT" button. The manual identification review is **still ongoing**.
|`INACTIVE`   |The user was only verified by an automated platform, not by a manual reviewer. The identification performed by the user can still be verified by the manual review if your system uses the manual verification service.

*Note
The manualIdentificationStatus status always returns INACTIVE status, unless your system implements manual identification callback, but does not create **a separate waiting screen** for indicating about the ongoing manual identity verification process.
For better customization we suggest using the [immediate redirect feature ](#customizing-results-callbacks-v2-optional). As a result, the user will not see an automatic identification status, provided by iDenfy service. The SDK will be closed while showing loading indicators.

## Additional customization
Currently, @idenfy/idenfysdk_flutter_plugin does not provide customization options via Dart code directly. For any additional SDK customization, you need to use the sample in this repository and edit native code inside of the plugin.

We suggest creating a fork of this repository. After editing the code, you can include the plugin in the following way:
```yaml
dependencies:
  idenfy_sdk_flutter: ^1.4.0
    git: https://github.com/your_repo/FlutterSDK.git
```

**Android customization:**
Follow [Android native SDK](https://github.com/idenfy/Documentation/blob/master/pages/ANDROID-SDK.md#customizing-sdk-v2-optional) guide and edit **IdenfysdkFlutterPlugin.kt**.

**IOS customization:**
Follow [IOS native SDK guide](https://github.com/idenfy/Documentation/blob/master/pages/ios-sdk.md#customizing-sdk-v2-optional) and edit **SwiftIdenfysdkFlutterPlugin.swift**.

## SDK Integration tutorials
For more information visit [SDK integration tutorials](https://github.com/idenfy/Documentation/blob/master/pages/tutorials/mobile-sdk-tutorials.md).








