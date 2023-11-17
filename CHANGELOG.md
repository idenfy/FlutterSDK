## 2.4.1
* iOS SDK updated to 8.2.4
* Android SDK updated to 8.2.8
* Face authentication session, virtual camera detection improvements

## 2.4.0
* iOS SDK updated to 8.2.3
* Added camera initialization error alert
* Added questionnaire file upload validations
* Updated Face Liveness version
* Small UI glitch and bug fixes

## 2.3.9
* Android SDK updated to 8.2.7
* Added camera initialization error alert
* Updated Face Liveness version
* Jcenter repository removed
* Bug fixes

## 2.3.8
* Android SDK updated to 8.2.6
* Face authentication virtual camera detection improvements (Better detection rate)
* Fixed a face detection crash, when GMS are missing.
* minSdkVersion increased to API 24

## 2.3.7
* iOS SDK updated to 8.2.2
* Deployment target raised to iOS 12
* Minor HU translation fixes

## 2.3.6
* Android SDK updated to 8.2.1
* minSdkVersion decreased to API 21
* Face authentication virtual camera detection will work from API 26
* HU translations fix

## 2.3.5
* Android SDK updated to 8.2.0
* iOS SDK updated to 8.2.1
* Added Android virtual camera checks in Face Authentication (Will result in a failed authentication)
* Increased Android minSdkVersion raised to API 26
* Added KYC questionnaire Color question
* Added KYC questionnaire conditions. [More](/mobile/Android/android-sdk#custom-kyc-questionnaire)
* Added NFC optional feature. [More](/mobile/Android/android-sdk#nfc-optional)
* Increased photo resolution
* Improved pdf files validation
* Fixed minor UI fixes

## 2.3.4
* Android SDK updated to 8.1.7.1
* iOS SDK updated to 8.1.9
* Fixed HU translations

## 2.3.3
* Android SDK updated to 8.1.7
* iOS SDK updated to 8.1.8
* Fixed back button states in country & document selections
* Fixed camera permission view descriptions

## 2.3.2
* Android SDK updated to 8.1.6
* iOS SDK updated to 8.1.7
* Face Detection now validates small faces. [More](https://documentation.idenfy.com/mobile/Android/android-sdk#face-detection)
* Fixed face detection error handling on Android
* Fixed a crash on iOS Face authentication when camera permissions are denied
* Fixed issued country view titles on iOS

## 2.3.1
* iOS, Android SDK's updated to 8.1.0
* Added an option to skip Camera On Boarding View on Face authentication. [More](https://documentation.idenfy.com/other-fraud/FaceAuthentication)

## 2.3.0
* iOS SDK updated to 8.0.0
* Android SDK updated to 8.0.1
* Added Face authentication using face matching & passive liveness. [More](https://documentation.idenfy.com/other-fraud/FaceAuthentication)

## 2.2.1
* iOS SDK updated to 7.9.1
* Fixed an issue with document video frames being mixed up

## 2.2.0
* Android, iOS SDK's updated to 7.9.0
* Face Liveness detection version updated
* Android CameraX version updated
* SK translations fixed
* Removed Android external storage permission
* Screen now stays awake in manual review
* Various cases with process death handled in Android
* Swedish Social Security card document type added
* iOS Lottie version updated
* Various UI bugs fixed

## 2.1.0
* Android, iOS SDK's updated to 7.8.1
* Removed Android Fotoaparat library (our fallback camera) since it is no longer compatible with AGP 7.4+
* Added document camera rectangle visibility setting. [More](https://documentation.idenfy.com/UI/AndroidUICustomization#document-camera-rectangle-visibility)

## 2.0.9
* Android, iOS SDK's updated to 7.8.0
* Updated CameraX library
* IdenfyInstructionsType.DRAWER option is now deprecated. [More](https://documentation.idenfy.com/UI/AndroidUICustomization#adding-instructions-in-camera-session)
* Czech translation fixes
* Added image upload from device size limit

## 2.0.8
* Android SDK updated to 7.7.9
* Updated Lottie dependency, removed usages of a deleted **lottie_scale** function

## 2.0.7
* Android SDK updated to 7.7.8
* iOS SDK updated to 7.7.7
* Updated Border Crossing, Asylum Residence Permit, Provisional Drivers License translations
* Logging updates

## 2.0.6
* Android SDK updated to 7.7.7
* iOS SDK updated to 7.7.6
* Face Authentication EXIT status will always be returned, even if SDK was not closed properly

## 2.0.5
* Android, iOS SDK's updated to 7.7.5
* Updated National passport translations
* Opacity changed for document selection continue button disabled state
* Android NFC Reading feature moved to a separate module. [Details](https://documentation.idenfy.com/mobile/Android/android-sdk#nfc-support)

## 2.0.4
* Android SDK updated to 7.7.3
* iOS SDK updated to 7.7.4
* Added Address Card document type
* Updated Android CameraX library
* Updated Document Recognition [feature](https://documentation.idenfy.com/mobile/Android/android-sdk#document-recognition)

## 2.0.3
* iOS SDK updated to 7.7.3
* Using a stable version (3.5.0) of lottie-ios since the new one is crashing
* Changed default WKWebView zoom in privacy policy [feature](https://documentation.idenfy.com/mobile/iOS/ios-sdk#custom-privacy-policy)

## 2.0.2
* Android, iOS SDK's updated to 7.7.2
* Added Thai, Indonesian, Hindi, Hungarian [locales](https://documentation.idenfy.com/mobile/Android/android-sdk#localization)
* Fixed ID Card translations in Czech [locale](https://documentation.idenfy.com/mobile/Android/android-sdk#localization)
* iOS UIWebView migrated to WKWebView in privacy policy [feature](https://documentation.idenfy.com/mobile/iOS/ios-sdk#custom-privacy-policy)

## 2.0.1

* Android SDK updated to 7.7.1
* Added Slovak [locale](https://documentation.idenfy.com/mobile/Android/android-sdk#localization)
* [Document recognition](https://documentation.idenfy.com/mobile/Android/android-sdk#document-recognition) feature files moved to a separate module, to decrease main SDK size.

## 2.0.0

* IOS SDK updated to 7.7.1
* Android SDK updated to 7.7.0
* Added custom KYC questionnaire feature. [More](https://documentation.idenfy.com/mobile/iOS/ios-sdk#custom-kyc-questionnaire)
* Added custom privacy policy feature. [More](https://documentation.idenfy.com/mobile/iOS/ios-sdk#custom-privacy-policy)
* Added Ukrainian, Portuguese, Vietnamese [locales](https://documentation.idenfy.com/mobile/iOS/ios-sdk#localization)
* Updated document issuing country list
* Updated Kotlin (1.6.21), Compose (1.2.0-rc02) versions in Android
* CompileSdkVersion raised to API 33 in Android
* Bug fixes

## 1.9.4

* IOS SDK updated to 7.6.4
* Language selection fix on face authentication screen
* Android SDK updated to 7.6.3
* Photo result detail cards are now optional (No need to override them in the XML)
* Face authentication views set as optional for easier customisation

## 1.9.3

* IOS SDK updated to 7.6.3
* Static version of the SDK is build with xCode 14
* Removed old code for <iOS 11 versions
* SDK uses the latest version of lottie-ios

## 1.9.2

* Android SDK updated to 7.6.1
* Fixed an IMPORTANT cameraX bug for document step

## 1.9.1

* IOS SDK updated to 7.6.2
* CoreNFC framework set to optional, due to compile errors on IOS lower than 13
* Fixed a memory leak

## 1.9.0

* Android and IOS SDK's updated to 7.6.0
* Added new document auto capture feature (Please contact support@idenfy.com for more information)
* New NFC reading animations and icons. [Details](https://documentation.idenfy.com/mobile/Android/android-sdk#nfc-support)
* Device language is now used as a fallback [locale](https://documentation.idenfy.com/mobile/Android/android-sdk#localization)
* Updated document camera on boarding instructions video
* Updated Dutch translations
* iDenfy splash screen slogan shown only in English
* Android camera onboarding screen was rebuild due to performance issues
* The minimum version of IOS SDK is increased to IOS 11
* IOS SDK bitcode is now disabled. Because of Apple [deprecation](https://developer.apple.com/documentation/xcode-release-notes/xcode-14-release-notes)
* Updated 3D liveness version
* Bug fixes

## 1.8.1

* Android SDK updated to 7.5.1
* Fixed a bug with uploading photos from device storage

## 1.8.0

* IOS, Android SDK's updated to 7.5.0
* Updated Face Authentication flow, from now existing users will able use face authentication flow as well

## 1.7.3

* IOS SDK updated to 7.4.3
* NFC Reading now supports PACE reading method
* Android SDK updated to 7.4.2
* Added Dutch translations
* Bug fixes

## 1.7.2

* IOS SDK updated to 7.4.2
* Bug fixes

## 1.7.1

* Code formatting
* IOS SDK updated to 7.4.1
* Bug fixes

## 1.7.0

* Android SDK updated to 7.4.1
* IOS SDK updated to 7.4.0
* New Face Authentication feature introduced. More on this feature, read [here](https://documentation.idenfy.com/other-fraud/FaceAuthentication).
* Bug fixes

## 1.6.0

* Android and IOS SDK's updated to 7.2.1
* New Camera OnBoarding view with static instruction list. All possible onboarding view variations are explained [here](https://documentation.idenfy.com/UI/AndroidUICustomization#camera-onboarding-view).
* Urjanet utility bill service now supporting Multi-Factor authentication
* Support email added to manual review screen
* Minor UI changes to the iDenfy IOS loading HUD
* Bug fixes

## 1.5.0

* Android and IOS SDK's updated to 7.1.0
* New suspected screen and callbacks handling, if needed. Read [here](https://documentation.idenfy.com/callbacks/ResultCallback#verification-status-table)
* New internet disconnect feature and handling. More about this can be found here: [Android](https://documentation.idenfy.com/mobile/Android/android-sdk#internet-disconnect), [IOS](https://documentation.idenfy.com/mobile/IOS/ios-sdk#internet-disconnect)
* Major change to the onboarding screen. A new onboarding screen appears before every step to provide maximum guidance.
  Manual results waiting screen UI/UX update. The screen is more informative and easier to understand the verification progress.
  A new cancel window change. The user can contact our support team if he wants assistance.
  New documents support, e.g. VISA and added confirmation button in document selection.
  Full flow with the latest UI changes is visible here: [Android](https://documentation.idenfy.com/mobile/Android/android-sdk#full-flow-starting-v7), [IOS](https://documentation.idenfy.com/mobile/Android/android-sdk#full-flow-starting-v7)
* New views are created with Jetpack Compose in Android! Read our [customization capabilities](/UI/AndroidUICustomization#customization-by-providing-your-own-implementations-of-jetpack-compose-composables).
* Also the minimum Android version was raised to API 21.
* Increased Kotlin version to 1.5.31

## 1.4.0

* IOS SDK 6.7.0 version, which brings arm64 architecture to the simulator. From now on the plugin works for all devices. 
  Also the next version will have minimum IOS deployment target raised to 10.
  
## 1.3.0

* Android SDK updated to 5.3.2 and IOS SDK updated to 6.6.3, fixed IOS compile issue for Example Application

## 1.2.0

* Android SDK updated to 5.3.0 and IOS SDK updated to 6.6.0

## 1.1.1

* Updated to latest iDenfy SDK. Migrated to jitpack.io, instead of bintray. More about this can be found [here](https://github.com/idenfy/Documentation/blob/master/pages/ANDROID-SDK.md#2-adding-the-sdk-dependency)

## 1.1.0

* Updated to latest iDenfy SDK. Migrated to jitpack.io, instead of bintray. More about this can be found [here](https://github.com/idenfy/Documentation/blob/master/pages/ANDROID-SDK.md#2-adding-the-sdk-dependency)

## 1.0.0

* iDenfy Flutter SDK initial release
