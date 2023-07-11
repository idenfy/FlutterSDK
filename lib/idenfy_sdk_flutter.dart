import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:idenfy_sdk_flutter/models/FaceAuthenticationResult.dart';

import 'models/IdenfyFaceAuthUISettings.dart';
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
