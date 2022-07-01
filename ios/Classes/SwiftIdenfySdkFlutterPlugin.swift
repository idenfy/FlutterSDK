import Flutter
import UIKit
import iDenfySDK
import idenfycore

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

                let idenfySettingsV2 = IdenfyBuilderV2()
                    .withAuthToken(authToken)
                    .build()

                let idenfyController = IdenfyController.shared
                idenfyController.initializeIdenfySDKV2WithManual(idenfySettingsV2: idenfySettingsV2)
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
        } else if call.method == "startFaceReauth" {
            if let arguments = call.arguments as? [String: Any],
               let withImmediateRedirect = arguments["withImmediateRedirect"] as? Bool,
               let reauthenticationToken = arguments["token"] as? String {
            let idenfyController = IdenfyController.shared
            let faceReauthenticationInitialization = FaceReauthenticationInitialization(reauthenticationToken: reauthenticationToken, withImmediateRedirect: withImmediateRedirect)
            idenfyController.initializeFaceReauthentication(faceReauthenticationInitialization: faceReauthenticationInitialization)
            let idenfyVC = idenfyController.instantiateNavigationController()

            UIApplication.shared.keyWindow?.rootViewController?.present(idenfyVC, animated: true, completion: nil)
            
            idenfyController.handleIdenfyCallbacksForFaceReauthentication(faceReauthenticationResult: { faceReauthenticationResult in
                do {
                    let jsonEncoder = JSONEncoder()
                    let jsonData = try jsonEncoder.encode(faceReauthenticationResult)
                    let string = String(data: jsonData, encoding: String.Encoding.utf8)
                    result(string)
                } catch {
                }
            })
            }
        }
    }
}
