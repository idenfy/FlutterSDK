import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

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

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
