import 'FaceReauthenticationStatus.dart';
import 'IdenfyIdentificationResult.dart';

class FaceReauthenticationResult {
  final FaceReauthenticationStatus faceReauthenticationStatus;

  FaceReauthenticationResult(this.faceReauthenticationStatus);

  factory FaceReauthenticationResult.fromJson(dynamic json) {
    return FaceReauthenticationResult(EnumTransform.valueOf(
        FaceReauthenticationStatus.values, json['faceReauthenticationStatus']));
  }
}
