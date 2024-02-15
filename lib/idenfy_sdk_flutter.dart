import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import 'models/face_authentication_result.dart';
import 'models/idenfy_face_auth_ui_settings.dart';
import 'models/idenfy_identification_status.dart';

class IdenfySdkFlutter {
  static const MethodChannel _channel =
      const MethodChannel('idenfy_sdk_flutter');

  /// Function to start identity verification session
  /// @param token Generated identity verification token
  static Future<IdenfyIdentificationResult> start(String token) async {
    final dynamic result =
        await _channel.invokeMethod('start', <String, String>{
      'authToken': token,
    });
    IdenfyIdentificationResult idenfyIdentificationResult =
        IdenfyIdentificationResult.fromJson(jsonDecode(result));
    return idenfyIdentificationResult;
  }

  /// Function to start face authentication session
  /// @param token Generated identity verification token
  /// @param withImmediateRedirect Whether immediate redirect feature should be enabled
  /// @param idenfyFaceAuthUISettings Additional face authentication session settings
  static Future<FaceAuthenticationResult> startFaceAuth(
      String token, bool withImmediateRedirect,
      {IdenfyFaceAuthUISettings? idenfyFaceAuthUISettings}) async {
    final dynamic result =
        await _channel.invokeMethod('startFaceAuth', <String, dynamic>{
      'token': token,
      'withImmediateRedirect': withImmediateRedirect,
      'idenfyFaceAuthUISettings': idenfyFaceAuthUISettings?.toJson()
    });
    FaceAuthenticationResult faceAuthenticationResult =
        FaceAuthenticationResult.fromJson(jsonDecode(result));
    return faceAuthenticationResult;
  }

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
