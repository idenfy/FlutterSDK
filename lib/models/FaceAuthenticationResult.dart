import 'FaceAuthenticationStatus.dart';
import 'IdenfyIdentificationResult.dart';

class FaceAuthenticationResult {
  final FaceAuthenticationStatus faceAuthenticationStatus;

  FaceAuthenticationResult(this.faceAuthenticationStatus);

  factory FaceAuthenticationResult.fromJson(dynamic json) {
    return FaceAuthenticationResult(EnumTransform.valueOf(
        FaceAuthenticationStatus.values, json['faceAuthenticationStatus']));
  }
}
