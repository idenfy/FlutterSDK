/// Identification status, provided by an automated platform
enum AutoIdentificationStatus {
  ///The user completed an identification flow and the identification status, provided by an automated platform, is APPROVED.
  APPROVED,

  ///The user completed an identification flow and the identification status, provided by an automated platform, is FAILED.
  FAILED,

  ///The user did not complete an identification flow and the identification status, provided by an automated platform, is UNVERIFIED.
  UNVERIFIED
}
