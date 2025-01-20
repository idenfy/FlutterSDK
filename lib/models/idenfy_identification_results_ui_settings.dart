/// Identification results ui settings class
class IdenfyIdentificationResultsUISettingsV2 {
  bool isShowSuccessSpinnerImmediateRedirect = false;
  bool isShowErrorSpinnerImmediateRedirect = false;
  bool isAdditionalUploadingInformationVisible = false;

  IdenfyIdentificationResultsUISettingsV2(
      this.isShowSuccessSpinnerImmediateRedirect,
      this.isShowErrorSpinnerImmediateRedirect,
      this.isAdditionalUploadingInformationVisible);

  Map<String, dynamic> toJson() => {
        'isShowSuccessSpinnerImmediateRedirect':
            isShowSuccessSpinnerImmediateRedirect,
        'isShowErrorSpinnerImmediateRedirect':
            isShowErrorSpinnerImmediateRedirect,
        'isAdditionalUploadingInformationVisible':
            isAdditionalUploadingInformationVisible,
      };
}
