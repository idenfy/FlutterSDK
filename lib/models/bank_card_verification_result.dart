class BankCardVerificationResult {
  final BankCardVerificationStatus bankCardVerificationStatus;

  BankCardVerificationResult({required this.bankCardVerificationStatus});

  factory BankCardVerificationResult.fromJson(Map<String, dynamic> json) {
    return BankCardVerificationResult(
      bankCardVerificationStatus: BankCardVerificationStatus.values.firstWhere(
        (e) => e.name == json['bankCardVerificationStatus'],
        orElse: () => BankCardVerificationStatus.FAILED,
      ),
    );
  }
}

enum BankCardVerificationStatus {
  SUCCESS,
  FAILED,
  EXIT,
}
