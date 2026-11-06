import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:idenfy_sdk_flutter/models/idenfy_settings.dart';

import 'models/bank_card_verification_result.dart';
import 'models/face_authentication_result.dart';
import 'models/idenfy_bank_card_verification_ui_settings.dart';
import 'models/idenfy_face_auth_ui_settings.dart';
import 'models/idenfy_identification_status.dart';
import 'models/information_update_result.dart';

class IdenfySdkFlutter {
  static const MethodChannel _channel =
      const MethodChannel('idenfy_sdk_flutter');

  /// Function to start identity verification session
  /// @param token Generated identity verification token
  static Future<IdenfyIdentificationResult> start(String token,
      {IdenfySettings? idenfySettings}) async {
    final dynamic result = await _channel.invokeMethod(
        'start', <String, dynamic>{
      'authToken': token,
      'idenfySettings': idenfySettings?.toJson()
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

  /// Function to start request update session
  /// @param token Generated request update token
  static Future<InformationUpdateResult> startRequestUpdate(String token,
      {IdenfySettings? idenfySettings}) async {
    final dynamic result = await _channel.invokeMethod(
        'startRequestUpdate', <String, dynamic>{
      'authToken': token,
      'idenfySettings': idenfySettings?.toJson()
    });
    InformationUpdateResult informationUpdateResult =
        InformationUpdateResult.fromJson(jsonDecode(result));
    return informationUpdateResult;
  }

  /// Function to start bank card verification session
  /// @param token Generated bank card verification token
  /// @param withImmediateRedirect Whether immediate redirect feature should be enabled
  /// @param idenfyBankCardVerificationUISettings Additional bank card verification session settings
  static Future<BankCardVerificationResult> startBankCardVerification(
      String token, bool withImmediateRedirect,
      {IdenfyBankCardVerificationUISettings?
          idenfyBankCardVerificationUISettings}) async {
    final dynamic result = await _channel
        .invokeMethod('startBankCardVerification', <String, dynamic>{
      'authToken': token,
      'withImmediateRedirect': withImmediateRedirect,
      'idenfyBankCardVerificationUISettings':
          idenfyBankCardVerificationUISettings?.toJson()
    });
    BankCardVerificationResult bankCardVerificationResult =
        BankCardVerificationResult.fromJson(jsonDecode(result));
    return bankCardVerificationResult;
  }

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
