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
    - [5. Troubleshooting compile errors](#5-troubleshooting-compile-errors)
*   [Usage](#usage)
*   [Callbacks](#callbacks)
*   [Additional customization](#additional-customization)
*   [SDK Integration tutorials](#sdk-integration-tutorials)


## Getting started

The @idenfy/idenfy_sdk_flutter is an official Flutter plugin, which provides an easier integration of iDenfy KYC services.

### 1. Obtaining an authentication token

The SDK requires token for starting initialization. [Token generation guide](https://github.com/idenfy/Documentation/blob/master/pages/GeneratingIdentificationToken.md)

### 2. Availability information & new project setup

**Since Apple is [deprecating Bitcode](https://developer.apple.com/documentation/xcode-release-notes/xcode-14-release-notes), iDenfy IOS SDK now has bitcode disabled as well. If you run into compile errors due to disabled bitcode, please make sure:**
1. Your application has bitcode disabled in the project setttings
2. Your Podfile contains the following code:
```shell
post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == "lottie-ios"
      target.build_configurations.each do |config|
        config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      end
    end
    if target.name == "idenfy_sdk_flutter"
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
        config.build_settings['ENABLE_BITCODE'] = 'NO'
      end
    end
    flutter_additional_ios_build_settings(target)
  end
end
```

Minimum required versions by the platform:

**IOS - 12.0**

**Android - API 24**

If you are starting a new Flutter project you can follow [Flutter install guide](https://flutter.dev/docs/get-started/install).
Once the setup is completed successfully, you can add iDenfy SDK dependencies.

### 3. Adding iDenfy Flutter SDK

To add iDenfy SDK plugin, open your project's `pubspec.yaml` file and append it with the latest iDenfy SDK flutter plugin:
```yaml
dependencies:
  idenfy_sdk_flutter: ^2.4.0
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

Configure your application's `gradle.properties` file:
```gradle
android.useAndroidX=true
android.enableJetifier=true
//For gradle 7+
android.jetifier.ignorelist=bcprov
//otherwise
android.jetifier.blacklist=bcprov
```

Make sure you are using Kotlin >= 1.5.31 version (Since 1.5 version of iDenfy package)

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
    if target.name == "lottie-ios"
      target.build_configurations.each do |config|
        config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      end
    end
    if target.name == "idenfy_sdk_flutter"
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
        config.build_settings['ENABLE_BITCODE'] = 'NO'
      end
    end
    flutter_additional_ios_build_settings(target)
  end
end
```
This script ensures that "lottie-ios" have module stability as well as IOS 12.0 support, which is required for the NFC feature.
#### 3. Running pod install
After that, install the pods:
```shell
cd ios
pod install
cd ..
```

If you face compiling issues, like "using bridging headers with module interfaces is unsupported" you should set **Build libraries for distribution** to NO in your app build settings.

The example IOS app has the correct configuration.

### 5. Troubleshooting compile errors

#### IOS

If your application uses **Objective-C bridging headers** you might face the following compile error:
**using bridging headers with module interfaces is unsupported.
Command CompileSwiftSources failed with a nonzero exit code**.


<img alt="Embed & Sign" width="700" src={useBaseUrl('img/mobile/idenfy_ios_compile_error.png')} />

To solve this error, you should try these steps:
#### 1. You should set ```Build libraries for distribution``` to ```NO``` in your Runner app build settings.

#### 2. Change post_install script in the Runner app Podfile to the following:
```ruby
post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name == "lottie-ios"
          target.build_configurations.each do |config|
            config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
        end
      end
    end
end
```

If your application has bitcode disabled and your build faces a compile error, due to enabled bitcode on any of our pods. You should try this step:
#### 1. Change post_install script to the following:
```ruby
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'NO'
        end
    end
end
```

#### Android
If this error occurs:

Failed to transform bcprov-jdk15on-1.69.jar (org.bouncycastle:bcprov-jdk15on:1.69) to match attributes {artifactType=android-java-res, org.gradle.category=library, org.gradle.libraryelements=jar, org.gradle.status=release, org.gradle.usage=java-runtime}.

Be sure to add the following lines to your application's `gradle.properties` file:
```gradle
//For gradle 7+
android.jetifier.ignorelist=bcprov
//otherwise
android.jetifier.blacklist=bcprov
```

##### Proguard rules

If you use code obfuscation for Android with a proguard-rules.pro file. You should update it with [ours](https://github.com/idenfy/Documentation/blob/master/resources/sdk/android/Proguard/proguard-rules.pro), otherwise some unexpected behaviour might occur.

## Usage

### Identity verification flow
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
const FaceAuthenticationMethod faceAuthenticationMethod = FaceAuthenticationMethod.ACTIVE_LIVENESS;
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

### Face authentication flow

More on this flow, read [here](https://documentation.idenfy.com/other-fraud/FaceAuthentication).

Firstly, import idenfysdkflutter.dart file:
```javascript
import 'package:idenfy_sdk_flutter/idenfy_sdk_flutter.dart';
```

After successful integration you should be able to call IdenfySdkFlutter.startFaceAuth method.

If the project is not successfully compiled or runtime issues occur, make sure you have followed the steps. For better understanding you may check the sample app in this repository.

Firsty, you should check for the authentication status, whether the face authentication can be performed. Having checked that, you will receive a token status:

| Name             | Description                                                                                                                                      |
|------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| `ENROLLMENT`     | The user must perform an enrollment, since the identification was performed with an older face tec version (Before face authentication update)   |
| `AUTHENTICATION` | The user can authenticate by face                                                                                                                |
| `IDENTIFICATION` | The user must perform an identification

ENROLLMENT only applies to ACTIVE_LIVENESS authentication method and from a user perspective is identical to AUTHENTICATION, although ENROLLMENT is basically registration for authentication - whichever face client used for enrollment, that face will then work for subsequent authentications.

Enrollment is recommended to be used for these cases:
1. Client was on-boarded using an old version of the SDK and therefore not registered for authentication.
2. Client failed an automated liveliness check during on-boarding and therefore was not registered for authentication.
3. Client is registered for authentication, but for whatever reason wishes to change the face used for authentication.

Everything can be done with following code, found in the example app:

```javascript
  Future<String> getFaceAuthTokenType(String scanref, FaceAuthenticationMethod authenticationMethod) async {
    final queryParameters = {
      'method': authenticationMethod.name,
    };
    final response = await http.get(
      Uri.https(Constants.BASE_URL,
          '/identification/facial-auth/$scanref/check-status/', queryParameters),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization':
            'Basic ${base64Encode(utf8.encode('${Constants.apiKey}:${Constants.apiSecret}'))}',
      },
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["type"];
    } else {
      throw Exception('Failed to fetch token type');
    }
  }

  Future<String> getFaceAuthTokenRequest(String scanref, String tokenType, FaceAuthenticationMethod authenticationMethod) async {
    final response = await http.post(
      Uri.https(Constants.BASE_URL, '/partner/authentication-info'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Basic ' +
            base64Encode(
                utf8.encode('${Constants.apiKey}:${Constants.apiSecret}')),
      },
      body: jsonEncode(<String, String>{
        "scanRef": scanref,
        "type": tokenType,
        "method": authenticationMethod.name
      }),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["token"];
    } else {
      throw Exception('Failed to fetch token');
    }
  }

  Future<void> initIdenfyFaceAuth(String scanref) async {
    FaceAuthenticationMethod authenticationMethod = Constants.faceAuthenticationMethod;
  
    FaceAuthenticationResult? faceAuthenticationResult;
    Exception? localException;
    try {
      String faceAuthTokenType = await getFaceAuthTokenType(scanref, authenticationMethod);
      String token = "";
      switch (faceAuthTokenType) {
        case 'AUTHENTICATION':
          //The user can authenticate by face
          token = await getFaceAuthTokenRequest(scanref, faceAuthTokenType, authenticationMethod);
          break;
        case 'ENROLLMENT':
          //The user must perform an enrollment, since the identification was performed with an older face tec version
          token = await getFaceAuthTokenRequest(scanref, faceAuthTokenType, authenticationMethod);
          break;
        default:
          //The user must perform an identification
          break;
      }
      faceAuthenticationResult =
          await IdenfySdkFlutter.startFaceAuth(token, false);
    } on Exception catch (e) {
      localException = e;
    }

    setState(() {
      _faceAuthenticationResult = faceAuthenticationResult;
      exception = localException;
      _textFieldController.clear();
    });
  }
```

An additional bool can be passed to the function to set the immediate redirect feature. 
This sets whether the results from iDenfy SDK should be received immediately without any additional result pages

```javascript
IdenfySdkFlutter.startFaceAuth(token, true);
```

Face authentication UI settings class can be passed to modify the face authentication flow:

```javascript
      IdenfyFaceAuthUISettings settings = IdenfyFaceAuthUIBuilder()
          .withLanguageSelection(true)
          .withOnBoardingView(true)
          .build();

      faceAuthenticationResult = await IdenfySdkFlutter.startFaceAuth(
          token, false,
          idenfyFaceAuthUISettings: settings);
```

Please make sure to provide your cliendId, apikey and apisecret constants, they can be found in `constants.dart` file:
```javascript
const String BASE_URL = 'ivs.idenfy.com';
const String clientId = 'idenfySampleClientID';
const String apiKey = 'PUT_YOUR_IDENFY_API_KEY_HERE';
const String apiSecret = 'PUT_YOUR_IDENFY_API_SECRET_HERE';
const FaceAuthenticationMethod faceAuthenticationMethod = FaceAuthenticationMethod.ACTIVE_LIVENESS;
```

## Callbacks

### Identity verification flow
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
Result is an `IdenfyIdentificationResult` class with `AutoIdentificationStatus`, `ManualIdentificationStatus` enums and additional `SuspectedIdentificationStatus`:

```javascript
class IdenfyIdentificationResult {
    AutoIdentificationStatus autoIdentificationStatus;
    ManualIdentificationStatus manualIdentificationStatus;
    SuspectedIdentificationStatus suspectedIdentificationStatus;
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

Information about the IdenfyIdentificationResult **suspectedIdentificationStatus** statuses:

|Name            |Description
|-------------------|------------------------------------
|`autoSuspected`   |The user completed an identification flow and the identification status, provided by an automated platform, is SUSPECTED.
|`manualSuspected`|The user completed an identification flow and the identification status, provided by a manual reviewer, is SUSPECTED.

*Note
The manualIdentificationStatus status always returns INACTIVE status, unless your system implements manual identification callback, but does not create **a separate waiting screen** for indicating about the ongoing manual identity verification process.
For better customization we suggest using the [immediate redirect feature ](#customizing-results-callbacks-v2-optional). As a result, the user will not see an automatic identification status, provided by iDenfy service. The SDK will be closed while showing loading indicators.

### Face authentication flow
Callback from the SDK can be retrieved from IdenfySdkFlutter.startFaceAuth future:
````javascript
    FaceAuthenticationResult? faceAuthenticationResult;
    try {
      faceAuthenticationResult = await IdenfySdkFlutter.startFaceAuth(token, false);
    } on Exception catch (e) {
    }

    setState(() {
      _faceAuthenticationResult = faceAuthenticationResult;
    });
````
Result is an `FaceAuthenticationResult` class with `FaceAuthenticationStatus` enum:

```javascript
class FaceAuthenticationResult {
    FaceAuthenticationStatus faceAuthenticationStatus;
}
```

Information about the FaceAuthenticationResult **faceAuthenticationStatus** statuses:

|Name            |Description
|-------------------|------------------------------------
|`SUCCESS`   |The user completed face authentication flow and the authentication status, provided by an automated platform, is SUCCESS.
|`FAILED`|The user completed face authentication flow and the authentication status, provided by an automated platform, is FAILED.
|`EXIT`   |The user did not complete face authentication flow and the authentication status, provided by an automated platform, is EXIT.

## Additional customization
Currently, @idenfy/idenfysdk_flutter_plugin does not provide customization options via Dart code directly. For any additional SDK customization, you need to use the sample in this repository and edit native code inside of the plugin.

We suggest creating a fork of this repository. After editing the code, you can include the plugin in the following way:
```yaml
dependencies:
  idenfy_sdk_flutter: ^2.4.0
    git: https://github.com/your_repo/FlutterSDK.git
```

**Android customization:**

Most common Android customization is changing SDK colors or editing our views. Everything can be achieved by overrding our color names, layouts:

To change the **colors**:
1. Open your Android application values folder (yourapplication/app/src/main/res/values)
2. Create either a new idenfy_colors.xml or add our defined colors to your existing colors.xml file like so:
```xml
<resources>
    <color name="idenfyMainColorV2">#7CFC00</color>
    <color name="idenfyMainDarkerColorV2">#7CFC00</color>
    <color name="idenfySecondColorV2">#000000</color>
    <color name="idenfyBackgroundColorV2">#FFFFFF</color>
</resources>
```
Our common color names can be found in [this repository](https://github.com/idenfy/Documentation/blob/master/resources/sdk/android/colors/colors_v2.xml) along with [specific screen colors](https://github.com/idenfy/Documentation/blob/master/resources/sdk/android/colors/colors.zip)

To edit the **Toolbar** or change styles (Text sizes, colors) for specific views:
1. Open your Android application values folder (yourapplication/app/src/main/res/values)  
   <img src="doc/images/idenfy_img_example_styles.png" width="300"/>
2. Create either a new idenfy_styles.xml or add our defined styles to your existing styles.xml file like so:

```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <style name="idenfyAppBarLayoutBackButtonStyle">
        <item name="android:tint">
            @color/idenfyMainColorV2
        </item>
    </style>

    <style name="idenfyAppBarLayoutIdenfyLogoStyle">
        <item name="android:tint">
            @color/idenfyMainColorV2
        </item>
    </style>

    <style name="idenfyAppBarLayoutLanguageSelectionButtonStyle">
        <item name="android:tint">
            @color/idenfyMainColorV2
        </item>
    </style>

    <style name="idenfyAppBarLayoutCloseButtonStyle">
        <item name="android:tint">
            @color/idenfyMainColorV2
        </item>
    </style>

    <style name="idenfyDocumentSelectionViewDescriptionStyle" parent="android:Widget.TextView">
        <item name="android:textColor">@color/idenfyDocumentSelectionViewDescriptionTextColor</item>
        <item name="android:textSize">13sp</item>
    </style>

    <style name="idenfyDocumentSelectionViewDocumentRecyclerViewItemTitleStyle" parent="android:Widget.TextView">
        <item name="android:textColor">
            @color/idenfyDocumentSelectionViewRecyclerViewItemTitleTextColor
        </item>
        <item name="android:textSize">13sp</item>
    </style>

    <style name="idenfyDocumentSelectionViewButtonStyle" parent="android:Widget.Button">
        <item name="android:textColor">
            @color/idenfyDocumentSelectionViewContinueButtonDisabledTextColor
        </item>
        <item name="android:textSize">12sp</item>
    </style>
</resources>
```

All our styles can be found in [here](https://github.com/idenfy/Documentation/blob/master/resources/sdk/android/styles/styles.zip).

To edit our **layouts**:
1. Open or create your Android application layout folder (yourapplication/app/src/main/res/layout) and copy our layout xml files here  
   <img src="doc/images/idenfy_img_example_layout.png" width="300"/>
2. Change the fonts, views however you want. Just make sure you **Do not remove ids of the components** and **keep same layout names**, otherwise this will cause runtime crashes or the layouts won't be overridden.

Our layouts can be found [here](https://github.com/idenfy/Documentation/blob/master/resources/sdk/android/layouts/layouts.zip)

To edit common **IdenfySettings** use the **IdenfysdkFlutterPlugin.kt** file like so:

```kotlin
class IdenfySdkFlutterPlugin: FlutterPlugin, MethodCallHandler, ActivityAware, PluginRegistry.ActivityResultListener {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var activity: Activity
  //Is nullable after proccess death.
  private var mResult: Result?=null

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "idenfy_sdk_flutter")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method == "start") {
      mResult = result

      //Liveness UI Settings
      val idenfyLivenessUISettingsV2 = IdenfyLivenessUISettings()
      idenfyLivenessUISettingsV2.livenessCancelButtonImage = R.drawable.buttonImage
      idenfyLivenessUISettingsV2.livenessReadyScreenButtonBorderColor = R.color.idenfyBlack
      idenfyLivenessUISettingsV2.livenessFrameWidth = 1

      //Idenfy UI Settings
      val idenfyUISettingsV2 =
        IdenfyUISettingsV2.IdenfyUIBuilderV2()
          .withInstructions(IdenfyInstructionsType.DIALOG)
          .withLivenessUISettings(idenfyLivenessUISettingsV2)
          .withConfirmationView(IdenfyOnBoardingViewTypeEnum.MULTIPLE_STATIC)
          .build()

      //Idenfy Settings
      val idenfySettingsV2 = IdenfySettingsV2.IdenfyBuilderV2()
        .withAuthToken(call.argument<String>("authToken")!!)
        .withIdenfyUISettingsV2(idenfyUISettingsV2)
        .withLogging(IdenfySDKLoggingSettings.IdenfySDKLoggingEnum.FULL)
        .build()

      IdenfyController.getInstance().initializeIdenfySDKV2WithManual(this.activity, IdenfyController.IDENFY_REQUEST_CODE, idenfySettingsV2)
    } else if (call.method == "startFaceAuth") {
      mResult = result
      val faceAuthenticationInitialization = FaceAuthenticationInitialization(call.argument<String>("token")!!, call.argument<Boolean>("withImmediateRedirect")!!)
      IdenfyController.getInstance().initializeFaceAuthenticationSDKV2(this.activity, IdenfyController.IDENFY_REQUEST_CODE, faceAuthenticationInitialization)
    } else {
      //result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    this.activity = binding.activity
    binding.addActivityResultListener(this)
  }

  override fun onDetachedFromActivityForConfigChanges() {
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
  }

  override fun onDetachedFromActivity() {
  }

  override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
    if (requestCode == IdenfyController.IDENFY_REQUEST_CODE) {
      when (resultCode) {
        IdenfyController.IDENFY_IDENTIFICATION_RESULT_CODE -> {
          val idenfyIdentificationResult: IdenfyIdentificationResult = data!!.getParcelableExtra(IdenfyController.IDENFY_IDENTIFICATION_RESULT)!!
          val jsonString = Gson().toJson(idenfyIdentificationResult)
          mResult?.success(jsonString)
        }
        IdenfyController.IDENFY_FACE_AUTHENTICATION_RESULT_CODE -> {
          val faceAuthenticationResult: FaceAuthenticationResult = data!!.getParcelableExtra(IdenfyController.IDENFY_FACE_AUTHENTICATION_RESULT)!!
          val jsonString = Gson().toJson(faceAuthenticationResult)
          mResult?.success(jsonString)
        }
      }
    } else {
      //mResult?.notImplemented()
    }
    return true
  }
}
```


Fore more extensive customization, please caerfully follow our [Android native SDK](https://documentation.idenfy.com/UI/AndroidUICustomization) guide and edit **IdenfysdkFlutterPlugin.kt** even further.

**IOS customization:**

Most common IOS customization is changing SDK colors, fonts or providing custom views. For that, here is an example of the **SwiftIdenfySdkFlutterPlugin.swift** class:

```swift
public class SwiftIdenfySdkFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "idenfy_sdk_flutter", binaryMessenger: registrar.messenger())
    let instance = SwiftIdenfySdkFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "getPlatformVersion" {
          result("iOS " + UIDevice.current.systemVersion)
        } else if call.method == "start" {
            if let arguments = call.arguments as? [String: Any],
               let authToken = arguments["authToken"] as? String {

                //Changing common iDenfy colors
                IdenfyCommonColors.idenfyMainColorV2 = UIColor.green
                IdenfyCommonColors.idenfyMainDarkerColorV2 = UIColor.green
                IdenfyCommonColors.idenfySecondColorV2 = UIColor.black
                IdenfyCommonColors.idenfyBackgroundColorV2 = UIColor.white
                
                //Customizing Tooblar
                IdenfyToolbarUISettingsV2.idenfyDefaultToolbarLogoIconTintColor = UIColor.blue
                IdenfyToolbarUISettingsV2.idenfyDefaultToolbarBackIconTintColor = UIColor.blue
                IdenfyToolbarUISettingsV2.idenfyLanguageSelectionToolbarLanguageSelectionIconTintColor = UIColor.yellow
                IdenfyToolbarUISettingsV2.idenfyLanguageSelectionToolbarCloseIconTintColor = UIColor.blue
                IdenfyToolbarUISettingsV2.idenfyCameraPreviewSessionToolbarBackIconTintColor = UIColor.white
                
                //Changing specific screen colors (Every screen has its own UI Settings class)
                IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewBackgroundColor = UIColor.white
                IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewTitleTextColor = UIColor.black
                IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewDocumentTableViewCellBorderColor = UIColor.brown
                
                //Changeing specific screen fonts (Every screen has its own UI Settings class)
                IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewTitleFont = UIFont.systemFont(ofSize: 20)
                IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewDocumentTypeFont = UIFont.systemFont(ofSize: 14)
                IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewDocumentTypeHighlightedFont = UIFont.boldSystemFont(ofSize: 14)
                
                //Changing face liveness UI colors
                let livenessSettings = IdenfyLivenessUISettings()
                livenessSettings.livenessFrameColor = UIColor.red
                livenessSettings.livenessIdentificationOvalProgressColor1 = UIColor.white
                livenessSettings.livenessIdentificationOvalProgressColor2 = UIColor.white
                livenessSettings.livenessFeedbackBackgroundColor = UIColor.green
                livenessSettings.livenessFrameBackgroundColor = UIColor.yellow
                livenessSettings.livenessReadyScreenForegroundColor = UIColor.gray
                livenessSettings.livenessReadyScreenBackgroundColors = [UIColor.blue]
                livenessSettings.livenessReadyScreenTextBackgroundColor = UIColor.systemPink
                livenessSettings.livenessReadyScreenButtonBorderColor = UIColor.red
                livenessSettings.livenessReadyScreenButtonBackgroundNormalColor = UIColor.orange
                livenessSettings.livenessReadyScreenButtonBackgroundHighlightedColor = UIColor.blue
                livenessSettings.livenessReadyScreenButtonBackgroundDisabledColor = UIColor.black
                livenessSettings.livenessResultScreenForegroundColor = UIColor.red
                livenessSettings.livenessResultScreenIndicatorColor = UIColor.yellow
                livenessSettings.livenessResultScreenUploadProgressFillColor = UIColor.green
                livenessSettings.livenessResultScreenUploadProgressTrackColor = UIColor.black
                livenessSettings.livenessIdentificationProgressStrokeColor = UIColor.blue

                //Configuring IdenfyUISettings
                let idenfyUISettingsV2 = IdenfyUIBuilderV2()
                    .withInstructions(IdenfyInstructionsEnum.dialog)
                    .withLivenessUISettings(livenessSettings)
                    .withOnBoadringViewType(IdenfyOnBoardingViewTypeEnum.multipleStatic)
                    .withIdenfyDocumentSelectionType(IdenfyDocumentSelectionTypeEnum.navigateOnContinueButton)
                    .withImmediateRedirect(ImmediateRedirectEnum.none)
                    .build()

                //Configuring IdenfySettings
                let idenfySettingsV2 = IdenfyBuilderV2()
                    .withAuthToken(authToken)
                    .withUISettingsV2(idenfyUISettingsV2)
                    .build()

                //Passsing custom views to the SDK (Every screen has a Viewable, a protocol your custom view must adopt)
                let idenfyViewsV2: IdenfyViewsV2 = IdenfyViewsBuilderV2()
                    .withSplashScreenV2View(SplashScreenV2View())
                    .withProviderSelectionView(ProviderSelectionViewV2())
                    .withProviderCellView(ProviderCell.self)
                    .withProviderLoginView(ProviderLoginViewV2())
                    .withMFAMethodSelectionView(MFAMethodSelectionViewV2())
                    .withMFAGeneralView(MFAGeneralViewV2())
                    .withMFACaptchaView(MFACaptchaViewV2())
                    .withNFCRequiredView(NFCRequiredViewV2())
                    .withIssuedCountryView(IssuedCountryViewV2())
                    .withCountrySelectionView(CountrySelectionViewV2())
                    .withCountryCellView(CountryCell.self)
                    .withLanguageSelectionView(LanguageSelectionViewV2())
                    .withLanguageCellView(LanguageCell.self)
                    .withDocumentSelectionView(DocumentSelectionViewV2())
                    .withDocumentCellView(DocumentCell.self)
                    .withConfirmationView(ConfirmationViewV2())
                    .withDynamicCameraOnBoardingView(DynamicCameraOnBoardingViewV2())
                    .withStaticCameraOnBoardingView(StaticCameraOnBoardingViewV2())
                    .withCameraOnBoardingInstructionDescriptionsCellView(InstructionDescriptionsCellV2.self)
                    .withConfirmationViewDocumentStepCellView(DocumentStepCell.self)
                    .withCameraPermissionView(CameraPermissionViewV2())
                    .withDrawerContentView(DrawerContentViewV2())
                    .withUploadPhotoView(UploadPhotoViewV2())
                    .withDocumentCameraView(DocumentCameraViewV2())
                    .withCameraWithRectangleResultViewV2(DocumentCameraResultViewV2())
                    .withPdfResultView(PdfResultViewV2())
                    .withFaceCameraView(FaceCameraViewV2())
                    .withCameraWithoutRectangleResultViewV2(FaceCameraResultViewV2())
                    .withNFCReadingView(NFCReadingViewV2())
                    .withNFCReadingTimeOutView(NFCReadingTimeOutViewV2())
                    .withIdentificationResultsView(IdentificationResultsViewV2())
                    .withIdentificationResultsStepCellView(ResultsStepCell.self)
                    .withIdentificationSuccessResultsView(IdentificationSuccessResultsViewV2())
                    .withIdentificationSuspectedResultsView(IdentificationSuspectedResultsViewV2())
                    .withManualReviewingStatusWaitingView(ManualReviewingStatusWaitingViewV2())
                    .withManualReviewingStatusFailedView(ManualReviewingStatusFailedViewV2())
                    .withManualReviewingStatusApprovedView(ManualReviewingStatusApprovedViewV2())
                    .withAdditionalSupportView(AdditionalSupportViewV2())
                    .withFaceAuthenticationSplashScreenV2View(FaceAuthenticationSplashScreenV2View())
                    .withFaceAuthenticationResultsViewV2(FaceAuthenticationResultsViewV2())
                    .build()

                let idenfyController = IdenfyController.shared
                idenfyController.initializeIdenfySDKV2WithManual(idenfySettingsV2: idenfySettingsV2, idenfyViewsV2: idenfyViewsV2)
                let idenfyVC = idenfyController.instantiateNavigationController()

                UIApplication.shared.keyWindow?.rootViewController?.present(idenfyVC, animated: true, completion: nil)

                idenfyController.handleIdenfyCallbacksWithManualResults(idenfyIdentificationResult: {
                    idenfyIdentificationResult
                    in
                    do {
                        let jsonEncoder = JSONEncoder()
                        let jsonData = try jsonEncoder.encode(idenfyIdentificationResult)
                        let string = String(data: jsonData, encoding: String.Encoding.utf8)
                        result(string)
                    } catch {
                    }
                })
            }
        } else if call.method == "startFaceAuth" {
            if let arguments = call.arguments as? [String: Any],
               let withImmediateRedirect = arguments["withImmediateRedirect"] as? Bool,
               let authenticationToken = arguments["token"] as? String {
            let idenfyController = IdenfyController.shared
            let faceAuthenticationInitialization = FaceAuthenticationInitialization(authenticationToken: authenticationToken, withImmediateRedirect: withImmediateRedirect)
            idenfyController.initializeFaceAuthentication(faceAuthenticationInitialization: faceAuthenticationInitialization)
            let idenfyVC = idenfyController.instantiateNavigationController()

            UIApplication.shared.keyWindow?.rootViewController?.present(idenfyVC, animated: true, completion: nil)
            
            idenfyController.handleIdenfyCallbacksForFaceAuthentication(faceAuthenticationResult: { faceAuthenticationResult in
                do {
                    let jsonEncoder = JSONEncoder()
                    let jsonData = try jsonEncoder.encode(faceAuthenticationResult)
                    let string = String(data: jsonData, encoding: String.Encoding.utf8)
                    result(string)
                } catch {
                }
            })
            }
        }
    }
}

```

UISettings classes for the rest of the screens can be found in our [repository](https://github.com/idenfy/Documentation/tree/master/resources/sdk/ios/uicustomization).

Fore more extensive customization, please caerfully follow our [IOS native SDK guide](https://documentation.idenfy.com/UI/IOSUICustomization) and edit **SwiftIdenfysdkFlutterPlugin.swift** even further.

## SDK Integration tutorials
For more information visit: [IOS SDK integration tutorial](https://documentation.idenfy.com/tutorials/mobile-sdk/IosSampleProjectTutorial) and [Android SDK integration tutorial](https://documentation.idenfy.com/tutorials/mobile-sdk/AndroidSampleProjectTutorial)






