import 'face_authentication_status.dart';

/// Face authentication session result, that contains authentication status
class FaceAuthenticationResult {
  final FaceAuthenticationStatus faceAuthenticationStatus;

  FaceAuthenticationResult(this.faceAuthenticationStatus);

  factory FaceAuthenticationResult.fromJson(dynamic json) {
    return FaceAuthenticationResult(FaceAuthenticationStatus.values
        .byName(json['faceAuthenticationStatus']));
  }
}
