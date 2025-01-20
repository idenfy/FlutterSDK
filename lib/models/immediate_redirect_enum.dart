/// Idenfy immediate redirect enum
enum ImmediateRedirectEnum {
  /**
   *  Immediate redirect won't happen in any case.
   */
  none,
  /**
   * Immediate redirect will happen for error with identifiers:
      - TOO_MANY_REATTEMPTS_IDENTIFIER
      - ASSERTION_ERROR_IDENTIFIER
      - TOKEN_NOT_VALID_IDENTIFIER
   */
  partial,
  /**
   * Immediate redirect will always happen.
   */
  full
}
