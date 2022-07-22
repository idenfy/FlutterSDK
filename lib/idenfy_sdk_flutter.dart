import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:idenfy_sdk_flutter/models/FaceReauthenticationResult.dart';

import 'models/IdenfyIdentificationResult.dart';

class IdenfySdkFlutter {
  static const MethodChannel _channel =
      const MethodChannel('idenfy_sdk_flutter');

  static Future<IdenfyIdentificationResult> start(String token) async {
    final dynamic result =
        await _channel.invokeMethod('start', <String, String>{
      'authToken': token,
    });
    IdenfyIdentificationResult idenfyIdentificationResult =
        IdenfyIdentificationResult.fromJson(jsonDecode(result));
    return idenfyIdentificationResult;
  }

  static Future<FaceReauthenticationResult> startFaceReauth(
      String token, bool withImmediateRedirect) async {
    final dynamic result = await _channel.invokeMethod(
        'startFaceReauth', <String, dynamic>{
      'token': token,
      'withImmediateRedirect': withImmediateRedirect
    });
    FaceReauthenticationResult faceReauthenticationResult =
        FaceReauthenticationResult.fromJson(jsonDecode(result));
    return faceReauthenticationResult;
  }

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
