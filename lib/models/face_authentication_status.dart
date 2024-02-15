/// Face authentication status, provided by an automated platform
enum FaceAuthenticationStatus {
  ///The user completed face authentication flow and the authentication status, provided by an automated platform, is SUCCESS.
  SUCCESS,

  ///The user completed face authentication flow and the authentication status, provided by an automated platform, is FAILED.
  FAILED,

  ///The user did not complete face authentication flow and the authentication status, provided by an automated platform, is EXIT.
  EXIT
}
