import 'dart:ui';

/// Color scheme for customizing iDenfy SDK UI colors.
/// Property names match the Android IdenfyColorScheme class.
/// Colors are passed as ARGB integers to platform channels.
class IdenfyColorScheme {
  // Base colors (colors_v2.xml)
  Color? idenfyBackgroundColorV2;
  Color? idenfyMainColorV2;
  Color? idenfyMainDarkerColorV2;
  Color? idenfySecondColorV2;
  Color? idenfyMainColor50percentV2;
  Color? idenfySecondColor6percentV2;
  Color? idenfySecondColor20percentV2;
  Color? idenfySecondColor50percentV2;
  Color? idenfySecondColor80percentV2;
  Color? idenfyInactiveColorV2;
  Color? idenfyStepSuccessColorV2;
  Color? idenfyStepErrorColorV2;
  Color? idenfyFaceOvalStrokeColor;
  Color? idenfyTakePhotoButtonBackgroundFocused;
  Color? idenfyTakePhotoButtonIconUnFocused;
  Color? idenfyTransparentCameraOverlayV2;
  Color? idenfyDrawerCurrentInstructionIndicatorColorV2;
  Color? idenfyDrawerInstructionControlsTintColorV2;
  Color? idenfyPhotoResultDetailsCardBackgroundColorV2;
  Color? idenfyRedColorV2;
  Color? idenfyErrorRedColorV2;
  Color? idenfyErrorLightRedColorV2;
  Color? idenfyGreenColorV2;
  Color? idenfyGrayColorV2;
  Color? idenfyTransparentCameraOverlay;
  Color? idenfyHelpSheetOverlay;
  Color? idenfyLivenessBackgroundColor;
  Color? idenfyBlack;
  Color? idenfyWhite;
  Color? idenfyWarningLightYellowV2;
  Color? idenfyWarningYellowV2;
  Color? idenfyBackgroundGreenV2;
  Color? idenfyBorderGreenV2;
  Color? idenfyPurpleColor;
  Color? idenfyPurpleTextColor;
  Color? idenfyPurpleBackgroundColor;
  Color? idenfyLightBlueColor;
  Color? idenfyBlueColor;
  Color? idenfyLightGrayColor;
  Color? idenfyBlackV2;

  // App Bar colors
  Color? idenfyDefaultAppBarBackgroundColor;
  Color? idenfyDefaultAppBarIconTintColor;
  Color? idenfyCameraPreviewSessionAppBarBackgroundColor;
  Color? idenfyCameraPreviewSessionAppBarBackButtonTintColor;
  Color? idenfyCameraPreviewSessionAppBarCameraFlashButtonTintColor;
  Color? idenfyCameraPreviewSessionAppBarBackButtonTextColor;
  Color? idenfyCameraPreviewSessionAppBarFaceNotDetectedAlertTintColor;
  Color? idenfyFaceAuthenticationCameraPreviewSessionAppBarCameraLanguageSelectionTintColor;
  Color? idenfyNoBackButtonAppBarBackgroundColor;
  Color? idenfyPhotoResultAppBarBackgroundColor;
  Color? idenfyPhotoResultAppBarBackButtonTextColor;
  Color? idenfyLanguageSelectionToolbarLanguageSelectionIconTintColor;
  Color? idenfyLanguageSelectionToolbarCloseIconTintColor;

  // Dialog Instructions colors
  Color? idenfyIdentificationResultsViewInstructionsAlertBackgroundColorV2;
  Color? idenfyIdentificationResultsViewInstructionsAlertLoadingSpinnerColor;
  Color? idenfyIdentificationResultsViewInstructionsAlertTitleTextColorV2;
  Color? idenfyIdentificationResultsViewInstructionsAlertContinueButtonTextColorV2;
  Color? idenfyIdentificationResultsViewInstructionsAlertProgressBarProgressColorV2;

  // Document Selection View colors
  Color? idenfyDocumentSelectionViewBackgroundColor;
  Color? idenfyDocumentSelectionViewTitleTextColor;
  Color? idenfyDocumentSelectionViewDescriptionTextColor;
  Color? idenfyDocumentSelectionViewRecyclerViewBorderColor;
  Color? idenfyDocumentSelectionViewRecyclerViewBackgroundColor;
  Color? idenfyDocumentSelectionViewRecyclerViewItemBackgroundColor;
  Color? idenfyDocumentSelectionViewRecyclerViewItemBorderColor;
  Color? idenfyDocumentSelectionViewRecyclerViewItemTitleTextColor;
  Color? idenfyDocumentSelectionViewRecyclerViewItemHighlightedTextColor;
  Color? idenfyDocumentSelectionViewRecyclerViewItemHighlightedBackgroundColor;
  Color? idenfyDocumentSelectionViewContinueButtonDisabledBackgroundColor;
  Color? idenfyDocumentSelectionViewContinueButtonDisabledTextColor;
  Color? idenfyDocumentSelectionViewContinueButtonEnabledTextColor;
  Color? idenfyDocumentSelectionViewLoadingSpinnerTintColor;

  // Face Authentication Results View colors
  Color? idenfyFaceAuthenticationResultsViewBackgroundColor;
  Color? idenfyFaceAuthenticationResultsCommonInformationTitleTextColor;
  Color? idenfyFaceAuthenticationResultsCommonInformationDescriptionTextColor;
  Color? idenfyFaceAuthenticationResultsContinueButtonTextColor;

  // Face Camera Session colors
  Color? idenfyFaceCameraPreviewSessionBackgroundColor;
  Color? idenfyFaceCameraPreviewSessionOvalOutsideColor;
  Color? idenfyFaceCameraPreviewSessionBottomActionButtonsViewBackgroundColor;
  Color? idenfyFaceCameraPreviewSessionTakePhotoButtonUnFocusedTintColor;
  Color? idenfyFaceCameraPreviewSessionTakePhotoButtonFocusedTintColor;
  Color? idenfyFaceCameraPreviewSessionTakePhotoButtonUnFocusedBackgroundColor;
  Color? idenfyFaceCameraPreviewSessionTakePhotoButtonFocusedBackgroundColor;
  Color? idenfyFaceCameraPreviewSessionFaceOvalColor;
  Color? idenfyFaceCameraPreviewSessionFaceOvalNotDetectedColor;
  Color? idenfyFaceCameraPreviewSessionFaceOvalLoadingColor;
  Color? idenfyFaceCameraPreviewSessionFaceDetectedColor;
  Color? idenfyFaceCameraPreviewTitleTextColor;
  Color? idenfyFaceCameraPreviewDescriptionTextColor;
  Color? idenfyFaceCameraPreviewSessionLivenessAccentColor;

  // Shared continue button text color (sets all continue/enabled button text colors on both platforms)
  Color? idenfyContinueButtonTextColor;
  Color? idenfyContinueButtonSpinnerColor;
  Color? idenfyRetakeButtonTextColor;

  // Photo Result shared colors (maps to both document and face photo result on Android, single property on iOS)
  Color? idenfyPhotoResultCardTitleColor;

  // Idenfy Buttons colors
  Color? idenfyGradientButtonColorStart;
  Color? idenfyGradientButtonColorEnd;
  Color? idenfyRetakeButtonBackgroundColor;
  Color? idenfyRetakeButtonBorderColor;

  // Identification Results View colors
  Color? idenfyIdentificationResultsViewBackgroundColor;
  Color? idenfyIdentificationResultsViewTitleTextColor;
  Color? idenfyIdentificationResultsViewDescriptionTextColor;
  Color? idenfyIdentificationResultsViewDocumentStepTitleTextColor;
  Color? idenfyIdentificationResultsViewDocumentStepLoadingStepDividerLoadingColor;
  Color? idenfyIdentificationResultsViewDocumentStepLoadingSpinnerAccentColor;
  Color? idenfyIdentificationResultsViewDocumentStepLoadingStepDividerSuccessColor;
  Color? idenfyIdentificationResultsViewDocumentStepLoadingStepDividerErrorColor;
  Color? idenfyIdentificationResultsViewDocumentStepScrollBarThumbColor;
  Color? idenfyIdentificationResultsViewRetakeButtonTextColor;
  Color? idenfyIdentificationResultsViewContentMaskForegroundColor;
  Color? idenfyIdentificationResultsViewSuccessStepTextColor;
  Color? idenfyIdentificationResultsViewErrorStepTextColorV2;
  Color? idenfyIdentificationResultsViewDocNotFoundAlertBackgroundColorV2;
  Color? idenfyIdentificationResultsViewDocNotFoundAlertTitleTextColorV2;
  Color? idenfyIdentificationResultsViewDocNotFoundAlertDescriptionTextColorV2;
  Color? idenfyIdentificationResultsViewDocNotFoundAlertDescriptionDocumentHighlightColorV2;
  Color? idenfyIdentificationResultsViewDocNotFoundAlertContinueButtonTextColorV2;
  Color? idenfyIdentificationResultsViewMrzNotFoundAlertBackgroundColorV2;
  Color? idenfyIdentificationResultsViewMrzNotFoundAlertTitleTextColorV2;
  Color? idenfyIdentificationResultsViewMrzNotFoundAlertDescriptionTextColorV2;
  Color? idenfyIdentificationResultsViewMrzNotFoundAlertContinueButtonTextColorV2;
  Color? idenfyIdentificationResultsViewMrzNotFoundAlertBackButtonTextColorV2;
  Color? idenfyIdentificationResultsViewMismatchTagsFoundAlertBackgroundColorV2;
  Color? idenfyIdentificationResultsViewMismatchTagsFoundAlertTitleTextColorV2;
  Color? idenfyIdentificationResultsViewMismatchTagsFoundAlertDescriptionTextColorV2;
  Color? idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonDisabledTextColorV2;
  Color? idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonDisabledBackgroundColorV2;
  Color? idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonEnabledTextColorV2;

  // Identification Success Results View colors
  Color? idenfyIdentificationSuccessResultsViewBackgroundColor;
  Color? idenfyIdentificationSuccessResultsViewTitleTextColor;
  Color? idenfyIdentificationSuccessResultsViewDescriptionTextColor;
  Color? idenfyIdentificationSuccessResultsViewIdentifiedTextColor;

  // Identification Suspected View colors
  Color? idenfyIdentificationSuspectedResultsViewTitleColor;
  Color? idenfyIdentificationSuspectedResultsViewDescriptionColor;
  Color? idenfyIdentificationSuspectedResultsViewDescriptionEmailColor;
  Color? idenfyIdentificationSuspectedResultsViewContinueButtonBackgroundColor;
  Color? idenfyIdentificationSuspectedResultsViewContinueButtonTitleColor;

  // Language Selection View colors
  Color? idenfyLanguageSelectionViewBackgroundColor;
  Color? idenfyLanguageSelectionViewTitleTextColor;
  Color? idenfyLanguageSelectionViewLanguageRecyclerViewBackgroundColor;
  Color? idenfyLanguageSelectionViewLanguageRecyclerViewBorderColor;
  Color? idenfyLanguageSelectionViewLanguageRecyclerViewItemBackgroundColor;
  Color? idenfyLanguageSelectionViewLanguageRecyclerViewItemBorderColor;
  Color? idenfyLanguageSelectionViewLanguageRecyclerViewItemTextColor;
  Color? idenfyLanguageSelectionViewLanguageRecyclerViewItemHighlightedTextColor;
  Color? idenfyLanguageSelectionViewLanguageRecyclerViewItemHighlightedBackgroundColor;

  // Manual Reviewing Status Approved View colors
  Color? idenfyManualReviewingStatusApprovedViewBackgroundColor;
  Color? idenfyManualReviewingStatusApprovedCommonInformationTitleTextColor;
  Color? idenfyManualReviewingStatusApprovedCommonInformationDescriptionTextColor;
  Color? idenfyManualReviewingStatusApprovedContinueButtonTextColor;

  // Manual Reviewing Status Failed View colors
  Color? idenfyManualReviewingStatusFailedViewBackgroundColor;
  Color? idenfyManualReviewingStatusFailedCommonInformationTitleTextColor;
  Color? idenfyManualReviewingStatusFailedCommonInformationDescriptionTextColor;
  Color? idenfyManualReviewingStatusFailedCommonInformationDescriptionSupportEmailTextColor;
  Color? idenfyManualReviewingStatusFailedContinueButtonTextColor;

  // Manual Reviewing Status Waiting View colors
  Color? idenfyManualReviewingStatusWaitingViewBackgroundColor;
  Color? idenfyManualReviewingStatusWaitingCommonInformationTitleTextColor;
  Color? idenfyManualReviewingStatusWaitingCommonInformationDescriptionTextColor;
  Color? idenfyManualReviewingStatusWaitingCommonReviewBoxFinishedBackgroundColor;
  Color? idenfyManualReviewingStatusWaitingCommonReviewBoxFinishedTitleColor;
  Color? idenfyManualReviewingStatusWaitingCommonReviewBoxFinishedTickImageTintColor;
  Color? idenfyManualReviewingStatusWaitingCommonReviewBoxWaitingBackgroundColor;
  Color? idenfyManualReviewingStatusWaitingCommonReviewBoxWaitingTitleColor;
  Color? idenfyManualReviewingStatusWaitingCommonReviewBoxWaitingSpinnerColor;
  Color? idenfyManualReviewingStatusWaitingCommonWaitingDurationTitleColor;
  Color? idenfyManualReviewingStatusWaitingCommonWaitingTimerBoxBackgroundColor;
  Color? idenfyManualReviewingStatusWaitingCommonWaitingTimerImageTintColor;
  Color? idenfyManualReviewingStatusWaitingCommonWaitingTimerTitleColor;
  Color? idenfyManualReviewingStatusWaitingBackToAccountButtonBackgroundColor;
  Color? idenfyManualReviewingStatusWaitingBackToAccountButtonTextColor;

  // NFC Reading Time Out View colors
  Color? idenfyNFCReadingTimeOutViewBackgroundColor;
  Color? idenfyNFCReadingTimeOutCommonInformationTitleTextColor;
  Color? idenfyNFCReadingTimeOutCommonInformationDescriptionTextColor;
  Color? idenfyNFCReadingTimeOutContinueButtonTextColor;

  // NFC Reading View colors
  Color? idenfyNFCReadingViewBackgroundColor;
  Color? idenfyNFCReadingCommonInformationTitleTextColor;
  Color? idenfyNFCReadingCommonInformationDescriptionTextColor;

  // NFC Required View colors
  Color? idenfyNFCRequiredViewBackgroundColor;
  Color? idenfyNFCRequiredCommonInformationTitleTextColor;
  Color? idenfyNFCRequiredCommonInformationDescriptionTextColor;
  Color? idenfyNFCRequiredContinueButtonTextColor;

  // Questionnaire View colors
  Color? idenfyQuestionnaireViewBackgroundColor;
  Color? idenfyQuestionnaireViewTitleTextColor;
  Color? idenfyQuestionnaireViewDescriptionTextColor;
  Color? idenfyQuestionnaireViewSectionTitleTextColor;
  Color? idenfyQuestionnaireViewSectionDescriptionTextColor;
  Color? idenfyQuestionnaireViewContinueButtonDisabledBackgroundColor;
  Color? idenfyQuestionnaireViewContinueButtonDisabledTextColor;
  Color? idenfyQuestionnaireViewContinueButtonEnabledTextColor;
  Color? idenfyQuestionnaireViewLoadingSpinnerTintColor;
  Color? idenfyQuestionnaireViewQuestionItemTitleTextColor;
  Color? idenfyQuestionnaireViewQuestionItemDescriptionTextColor;
  Color? idenfyQuestionnaireViewTextQuestionItemEditTextTitleColor;
  Color? idenfyQuestionnaireViewTextQuestionItemEditTextHintColor;
  Color? idenfyQuestionnaireViewTextQuestionItemEditTextHighlightedBorderColor;
  Color? idenfyQuestionnaireViewTextQuestionItemEditTextBackgroundColor;
  Color? idenfyQuestionnaireViewTextQuestionItemEditTextBorderColor;
  Color? idenfyQuestionnaireViewCheckBoxQuestionItemCheckBoxColor;
  Color? idenfyQuestionnaireViewCheckBoxQuestionItemCheckBoxDescriptionColor;
  Color? idenfyQuestionnaireViewCountryQuestionTrailingIconTintColor;
  Color? idenfyQuestionnaireViewDateQuestionTrailingIconTintColor;
  Color? idenfyQuestionnaireViewFileQuestionUploadIconTintColor;
  Color? idenfyQuestionnaireViewFileQuestionCancelIconTintColor;
  Color? idenfyQuestionnaireViewFileQuestionFilePickerPlaceHolderTextColor;
  Color? idenfyQuestionnaireViewImageQuestionUploadIconTintColor;
  Color? idenfyQuestionnaireViewImageQuestionCancelIconTintColor;
  Color? idenfyQuestionnaireViewImageQuestionImagePickerPlaceHolderTextColor;
  Color? idenfyQuestionnaireViewPasswordQuestionTrailingIconTintColor;
  Color? idenfyQuestionnaireViewRadioQuestionRadioButtonTintColor;
  Color? idenfyQuestionnaireViewRadioQuestionRadioButtonBackgroundColor;
  Color? idenfyQuestionnaireViewRadioQuestionRadioButtonTextColor;
  Color? idenfyQuestionnaireViewSelectMultiQuestionCheckBoxTintColor;
  Color? idenfyQuestionnaireViewSelectMultiQuestionCheckBoxTextColor;
  Color? idenfyQuestionnaireViewInputFieldErrorMessageTextColor;
  Color? idenfyQuestionnaireViewCountryMultiQuestionCountryPickerPlaceHolderTextColor;

  // Upload Photo View colors
  Color? idenfyUploadPhotoViewBackgroundColor;
  Color? idenfyUploadPhotoViewTitleTextColor;
  Color? idenfyUploadPhotoViewDescriptionTextColor;
  Color? idenfyUploadPhotoViewCroppingBorderColor;
  Color? idenfyUploadPhotoViewCroppingBackgroundColor;
  Color? idenfyUploadPhotoViewCroppingPhotoLoadingSpinnerColor;
  Color? idenfyUploadPhotoViewChooseAnotherPhotoButtonTextColor;
  Color? idenfyUploadPhotoViewContinuePhotoButtonTextColor;

  // Bank Verification View colors
  Color? idenfyBankVerificationViewBackgroundColor;
  Color? idenfyBankVerificationCommonInformationTitleTextColor;
  Color? idenfyBankVerificationCommonInformationDescriptionTextColor;
  Color? idenfyBankVerificationViewItemSelectionBorderColor;
  Color? idenfyBankVerificationViewItemSelectionBackgroundColor;
  Color? idenfyBankVerificationViewItemSelectionTextColor;
  Color? idenfyBankVerificationViewItemSelectionTrailingIconTintColor;
  Color? idenfyBankVerificationViewCheckBoxColor;
  Color? idenfyBankVerificationViewCheckBoxDescriptionColor;
  Color? idenfyBankVerificationViewCheckBoxInformationTrailingIconTintColor;
  Color? idenfyBankVerificationContinueButtonTextColor;
  Color? idenfyBankVerificationContinueButtonDisabledTextColor;
  Color? idenfyBankVerificationViewContinueButtonDisabledBackgroundColor;
  Color? idenfyBankVerificationContinueButtonEnabledTextColor;
  Color? idenfyBankVerificationViewSuccessStatusContainerBackgroundColor;
  Color? idenfyBankVerificationViewSuccessStatusContainerBorderColor;
  Color? idenfyBankVerificationViewFailedStatusContainerBackgroundColor;
  Color? idenfyBankVerificationViewFailedStatusContainerBorderColor;
  Color? idenfyBankVerificationViewSuccessStatusDescriptionIconTintColor;
  Color? idenfyBankVerificationViewBanksRecyclerViewItemBorderColor;
  Color? idenfyBankVerificationViewBanksRecyclerViewItemBackgroundColor;
  Color? idenfyBankVerificationViewBankRecyclerViewItemTextColor;
  Color? idenfyBankVerificationViewLoadingSpinnerTintColor;
  Color? idenfyBankVerificationViewContinueButtonLoadingSpinnerTintColor;

  // Camera Permission View colors
  Color? idenfyCameraPermissionViewBackgroundColor;
  Color? idenfyCameraPermissionViewTitleTextColor;
  Color? idenfyCameraPermissionViewDescriptionTextColor;
  Color? idenfyCameraPermissionViewGuidanceDescriptionTextColor;
  Color? idenfyCameraPermissionViewGoToSettingsButtonTextColor;

  // Camera Static Onboarding View colors
  Color? idenfyCameraOnBoardingViewBackgroundColor;
  Color? idenfyCameraOnBoardingViewLoadingSpinnerColor;
  Color? idenfyCameraStaticOnBoardingViewTitleColor;
  Color? idenfyCameraStaticOnBoardingViewDescriptionColor;
  Color? idenfyCameraStaticOnBoardingViewProgressBarBackgroundColor;
  Color? idenfyCameraStaticOnBoardingViewProgressBarForegroundColor;
  Color? idenfyCameraStaticOnBoardingViewVideoDescriptionsTitleColor;
  Color? idenfyCameraStaticOnBoardingViewVideoDescriptionsCircleImageTintColor;
  Color? idenfyCameraStaticOnBoardingViewVideoDescriptionsTextColor;
  Color? idenfyCameraStaticOnBoardingViewEnabledButtonTitleColor;
  Color? idenfyCameraStaticOnBoardingViewDisabledButtonBackgroundColor;
  Color? idenfyCameraStaticOnBoardingViewDisabledButtonTitleColor;
  Color? idenfyCameraStaticOnBoardingViewLoadingSpinnerColor;

  // Country Selection View colors
  Color? idenfyCountrySelectionViewBackgroundColor;
  Color? idenfyCountrySelectionViewTitleTextColor;
  Color? idenfyCountrySelectionViewDescriptionTextColor;
  Color? idenfyCountrySelectionViewCountrySearchBarBackgroundColor;
  Color? idenfyCountrySelectionViewCountrySearchBarHighlightedTextColor;
  Color? idenfyCountrySelectionViewCountrySearchBarTextColor;
  Color? idenfyCountrySelectionViewCountryRecyclerViewBackgroundColor;
  Color? idenfyCountrySelectionViewCountryRecyclerViewBorderColor;
  Color? idenfyCountrySelectionViewCountryRecyclerViewItemBackgroundColor;
  Color? idenfyCountrySelectionViewCountryRecyclerViewItemBorderColor;
  Color? idenfyCountrySelectionViewCountryRecyclerViewItemTextColor;
  Color? idenfyCountrySelectionViewCountryRecyclerViewItemHighlightedTextColor;
  Color? idenfyCountrySelectionViewCountryRecyclerViewItemHighlightedBackgroundColor;
  Color? idenfyCountrySelectionViewCountryRecyclerViewItemLoadingSpinnerTintColor;
  Color? idenfyCountryViewSelectionCountrySearchBarBorderColor;
  Color? idenfyCountrySelectionViewPredefinedCountryContinueButtonTextColor;

  // Document Photo Result View colors
  Color? idenfyDocumentPhotoResultViewBackgroundColor;
  Color? idenfyDocumentPhotoResultViewTitleTextColor;
  Color? idenfyDocumentPhotoResultViewDescriptionTextColor;
  Color? idenfyDocumentPhotoResultViewRetakePhotoButtonTextColor;
  Color? idenfyDocumentPhotoResultViewNextButtonTextColor;
  Color? idenfyDocumentPhotoResultViewPhotoLoadingSpinnerColor;
  Color? idenfyDocumentPhotoResultViewPhotoBorderColor;
  Color? idenfyDocumentPhotoResultViewAutoCaptureFailureCardImageColor;
  Color? idenfyDocumentPhotoResultViewAutoCaptureFailureCardTitleColor;
  Color? idenfyDocumentPhotoResultViewAutoCaptureFailureCardBackgroundColor;
  Color? idenfyDocumentPhotoResultViewBlurGlareWarningCardImageColor;
  Color? idenfyDocumentPhotoResultViewBlurGlareWarningCardTitleColor;
  Color? idenfyDocumentPhotoResultViewBlurGlareWarningCardBackgroundColor;

  // Email SMS Verification View colors
  Color? idenfyEmailSMSVerificationViewBackgroundColor;
  Color? idenfyEmailSMSVerificationCommonInformationTitleTextColor;
  Color? idenfyEmailSMSVerificationCommonInformationDescriptionTextColor;
  Color? idenfyEmailSMSVerificationPinCodeTextColor;
  Color? idenfyEmailSMSVerificationCodeInputRetryContainerBorderColor;
  Color? idenfyEmailSMSVerificationCodeInputRetryContainerBackgroundColor;
  Color? idenfyEmailSMSVerificationCodeInputFailedContainerBorderColor;
  Color? idenfyEmailSMSVerificationCodeInputFailedContainerBackgroundColor;
  Color? idenfyEmailSMSVerificationCodeInputSuccessContainerBorderColor;
  Color? idenfyEmailSMSVerificationCodeInputSuccessContainerBackgroundColor;
  Color? idenfyEmailSMSVerificationViewCodeStatusTitleTextColor;
  Color? idenfyEmailSMSVerificationViewCodeFailedStatusImageTintColor;
  Color? idenfyEmailSMSVerificationViewCodeSuccessStatusImageTintColor;
  Color? idenfyEmailSMSVerificationViewCodeExpirationTitleTextColor;
  Color? idenfyEmailSMSVerificationViewResendCodeTitleTextColor;
  Color? idenfyEmailSMSVerificationViewResendCodeTitleDisabledTextColor;
  Color? idenfyEmailSMSVerificationViewVerifyEmailSMSContainerBorderColor;
  Color? idenfyEmailSMSVerificationViewVerifyEmailSMSContainerBackgroundColor;
  Color? idenfyEmailSMSVerificationVerifyEmailSMSContainerTitleTextColor;
  Color? idenfyEmailSMSVerificationVerifyEmailSMSContainerDescriptionTextColor;
  Color? idenfyEmailSMSVerificationViewVerifyEmailSMSContainerImageTintColor;
  Color? idenfyEmailSMSVerificationEmailSMSInputEditTextBorderColor;
  Color? idenfyEmailSMSVerificationEmailSMSInputEditTextBackgroundColor;
  Color? idenfyEmailSMSVerificationViewEmailSMSInputEditTextTitleColor;
  Color? idenfyEmailSMSVerificationViewEmailSMSInputEditTextHintColor;
  Color? idenfyEmailSMSVerificationViewEmailSMSInputFieldErrorMessageTextColor;
  Color? idenfyEmailSMSVerificationContinueButtonTextColor;
  Color? idenfyEmailSMSVerificationContinueButtonDisabledTextColor;
  Color? idenfyEmailSMSVerificationViewContinueButtonDisabledBackgroundColor;
  Color? idenfyEmailSMSVerificationContinueButtonEnabledTextColor;
  Color? idenfyEmailSMSVerificationContinueButtonLoadingSpinnerTintColor;

  // Face Photo Result View colors
  Color? idenfyFacePhotoResultViewBackgroundColor;
  Color? idenfyFacePhotoResultViewTitleTextColor;
  Color? idenfyFacePhotoResultViewDescriptionTextColor;
  Color? idenfyFacePhotoResultViewRetakePhotoButtonTextColor;
  Color? idenfyFacePhotoResultViewNextButtonTextColor;
  Color? idenfyFacePhotoResultViewPhotoLoadingSpinnerColor;
  Color? idenfyFacePhotoResultViewPhotoBorderColor;

  // MFA Captcha Method View colors
  Color? idenfyMFACaptchaMethodViewBackgroundColor;
  Color? idenfyMFACaptchaMethodViewTitleTextColor;
  Color? idenfyMFACaptchaMethodViewDescriptionTextColor;
  Color? idenfyMFACaptchaMethodViewCaptchaEditTextBackgroundColor;
  Color? idenfyMFACaptchaMethodViewCaptchaEditTextTitleColor;
  Color? idenfyMFACaptchaMethodViewCaptchaEditTextBorderColor;
  Color? idenfyMFACaptchaMethodViewCaptchaEditTextHighlightedBorderColor;
  Color? idenfyMFACaptchaMethodViewCaptchaEditTextHintTitleColor;
  Color? idenfyMFACaptchaMethodViewCaptchaEditTextTopHintTitleColor;
  Color? idenfyMFACaptchaMethodViewContinueButtonTextColor;
  Color? idenfyMFACaptchaMethodViewContinueButtonLoadingSpinnerColor;

  // MFA General View colors
  Color? idenfyMFAGeneralViewBackgroundColor;
  Color? idenfyMFAGeneralViewTitleTextColor;
  Color? idenfyMFAGeneralViewDescriptionTextColor;
  Color? idenfyMFAGeneralViewEditTextBackgroundColor;
  Color? idenfyMFAGeneralViewEditTextTitleColor;
  Color? idenfyMFAGeneralViewEditTextBorderColor;
  Color? idenfyMFAGeneralViewEditTextHighlightedBorderColor;
  Color? idenfyMFAGeneralViewEditTextHintTitleColor;
  Color? idenfyMFAGeneralViewEditTextTopHintTitleColor;
  Color? idenfyMFAGeneralViewContinueButtonTextColor;
  Color? idenfyMFAGeneralViewContinueButtonLoadingSpinnerTintColor;

  // MFA Method Selection View colors
  Color? idenfyMFAMethodSelectionViewBackgroundColor;
  Color? idenfyMFAMethodSelectionViewTitleTextColor;
  Color? idenfyMFAMethodSelectionViewDescriptionTextColor;
  Color? idenfyMFAMethodSelectionViewTopHintTitleColor;
  Color? idenfyMFAMethodSelectionViewContinueButtonTextColor;
  Color? idenfyMFAMethodSelectionViewContinueButtonLoadingSpinnerTintColor;

  // Provider Login View colors
  Color? idenfyProviderLoginViewBackgroundColor;
  Color? idenfyProviderLoginViewTitleTextColor;
  Color? idenfyProviderLoginViewDescriptionTextColor;
  Color? idenfyProviderLoginViewUsernameAndPasswordEditTextBackgroundColor;
  Color? idenfyProviderLoginViewUsernameAndPasswordEditTextTitleColor;
  Color? idenfyProviderLoginViewUsernameAndPasswordEditTextBorderColor;
  Color? idenfyProviderLoginViewUsernameAndPasswordEditTextHighlightedBorderColor;
  Color? idenfyProviderLoginViewUsernameAndPasswordEditTextHintTitleColor;
  Color? idenfyProviderLoginViewUsernameAndPasswordEditTextTopHintTitleColor;
  Color? idenfyProviderLoginViewContinueButtonTextColor;
  Color? idenfyProviderLoginViewContinueButtonLoadingSpinnerTintColor;

  // Provider Selection View colors
  Color? idenfyProviderSelectionViewBackgroundColor;
  Color? idenfyProviderSelectionViewTitleTextColor;
  Color? idenfyProviderSelectionViewDescriptionTextColor;
  Color? idenfyProviderSelectionViewProviderSearchBarBackgroundColor;
  Color? idenfyProviderSelectionViewProviderSearchBarHighlightedTextColor;
  Color? idenfyProviderSelectionViewProviderSearchBarTextColor;
  Color? idenfyProviderSelectionViewProviderRecyclerViewBackgroundColor;
  Color? idenfyProviderSelectionViewProviderRecyclerViewBorderColor;
  Color? idenfyProviderSelectionViewProviderRecyclerViewItemBackgroundColor;
  Color? idenfyProviderSelectionViewProviderRecyclerViewItemBorderColor;
  Color? idenfyProviderSelectionViewProviderRecyclerViewItemTextColor;
  Color? idenfyProviderSelectionViewProviderRecyclerViewItemHighlightedTextColor;
  Color? idenfyProviderSelectionViewProviderRecyclerViewItemHighlightedBackgroundColor;
  Color? idenfyProviderViewSelectionProviderSearchBarBorderColor;
  Color? idenfyProviderSelectionViewProviderRecyclerViewItemLoadingSpinnerTintColor;

  // Additional Support View colors
  Color? idenfyAdditionalSupportViewBackgroundColor;
  Color? idenfyAdditionalSupportCommonInformationTitleTextColor;
  Color? idenfyAdditionalSupportCommonInformationDescriptionTextColor;
  Color? idenfyAdditionalSupportContinueButtonTextColor;

  // Country And Document Selection View colors
  Color? idenfyCountryAndDocumentSelectionViewBackgroundColor;
  Color? idenfyCountryAndDocumentSelectionViewTitleTextColor;
  Color? idenfyCountryAndDocumentSelectionViewDescriptionTextColor;
  Color? idenfyCountryAndDocumentSelectionViewItemSelectionBorderColor;
  Color? idenfyCountryAndDocumentSelectionViewItemSelectionBackgroundColor;
  Color? idenfyCountryAndDocumentSelectionViewItemSelectionTextColor;
  Color? idenfyCountryAndDocumentSelectionViewItemSelectionTrailingIconTintColor;
  Color? idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedBorderColor;
  Color? idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedBackgroundColor;
  Color? idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedTextColor;
  Color? idenfyCountryAndDocumentSelectionViewContinueButtonDisabledBackgroundColor;
  Color? idenfyCountryAndDocumentSelectionViewContinueButtonDisabledTextColor;
  Color? idenfyCountryAndDocumentSelectionViewContinueButtonEnabledTextColor;
  Color? idenfyCountryAndDocumentSelectionViewContinueButtonLoadingSpinnerTintColor;
  Color? idenfyCountryAndDocumentSelectionViewPhysicalDocumentTitleDividerColor;

  // Document Camera Preview Session colors
  Color? idenfyDocumentCameraPreviewSessionBackgroundColor;
  Color? idenfyDocumentCameraPreviewSessionBottomActionButtonsViewBackgroundColor;
  Color? idenfyDocumentCameraPreviewSessionTakePhotoButtonUnFocusedTintColor;
  Color? idenfyDocumentCameraPreviewSessionTakePhotoButtonFocusedTintColor;
  Color? idenfyDocumentCameraPreviewSessionTakePhotoButtonUnFocusedBackgroundColor;
  Color? idenfyDocumentCameraPreviewSessionTakePhotoButtonFocusedBackgroundColor;
  Color? idenfyDocumentCameraPreviewSessionAcceptedDocumentsSelectedCountryHighlightColor;
  Color? idenfyDocumentCameraPreviewTitleTextColor;
  Color? idenfyDocumentCameraPreviewDescriptionTextColor;

  // Privacy Policy View colors
  Color? idenfyPrivacyPolicyViewBackgroundColor;
  Color? idenfyPrivacyPolicyCommonInformationTitleTextColor;
  Color? idenfyPrivacyPolicyCommonInformationDescriptionTextColor;
  Color? idenfyPrivacyPolicyCardViewTextColor;
  Color? idenfyPrivacyPolicyCardViewBackgroundColor;
  Color? idenfyPrivacyPolicyCardViewArrowIconTintColor;
  Color? idenfyPrivacyPolicyCardViewIconTintColor;
  Color? idenfyPrivacyPolicyContinueButtonTextColor;
  Color? idenfyPrivacyPolicyContinueButtonLoadingSpinnerTintColor;
  Color? idenfyPartnerPrivacyPolicyDialogViewBackgroundColor;

  // Splash Screen View colors
  Color? idenfySplashScreenViewTitleTextColor;
  Color? idenfySplashScreenViewDescriptionTextColor;
  Color? idenfySplashScreenViewLoadingSpinnerTintColor;

  // Bottom Sheet colors
  Color? idenfyBottomSheetBackgroundColor;
  Color? idenfyBottomSheetDragHandleColor;
  Color? idenfyBottomSheetButtonTextColor;
  Color? idenfyBottomSheetTitleTextColor;
  Color? idenfyBottomSheetDateTimePickerAccentColor;
  Color? idenfyBottomSheetDateTimePickerActivatedColor;
  Color? idenfyBottomSheetDateTimePickerHighlightColor;

  // Custom Alert Dialog colors
  Color? idenfyCustomAlertDialogNegativeButtonColor;
  Color? idenfyCustomAlertDialogBackgroundColor;

  // Default Alert Dialog colors
  Color? idenfyDefaultAlertDialogBackgroundColor;
  Color? idenfyDefaultAlertDialogTitleColor;
  Color? idenfyDefaultAlertDialogMessageColor;
  Color? idenfyDefaultAlertDialogPositiveButtonColor;
  Color? idenfyDefaultAlertDialogNegativeButtonColor;

  // EID Session View colors
  Color? idenfyEIDSessionViewBackgroundColor;
  Color? idenfyEIDSessionViewTitleTextColor;
  Color? idenfyEIDSessionViewDescriptionTextColor;
  Color? idenfyEIDSessionViewButtonTextColor;
  Color? idenfyEIDSessionViewButtonLoadingSpinnerTintColor;
  Color? idenfyEIDSessionViewCodeInputEditTextTitleColor;
  Color? idenfyEIDSessionViewCodeInputEditTextHintColor;
  Color? idenfyEIDSessionViewCodeInputFieldErrorMessageTextColor;
  Color? idenfyEIDSessionViewCodeInputFailedContainerBorderColor;
  Color? idenfyEIDSessionViewCodeInputFailedContainerBackgroundColor;
  Color? idenfyEIDSessionViewCodeStatusTitleTextColor;
  Color? idenfyEIDSessionViewCodeFailedStatusImageTintColor;
  Color? idenfyEIDSessionViewCodeHintTextColor;
  Color? idenfyEIDSessionViewContinueButtonEnabledTextColor;
  Color? idenfyEIDSessionViewContinueButtonDisabledTextColor;
  Color? idenfyEIDSessionViewContinueButtonDisabledBackgroundColor;
  Color? idenfyEIDSessionViewUploadIconTintColor;
  Color? idenfyEIDSessionViewClickToUploadTextColor;
  Color? idenfyEIDSessionViewInputFieldBorderColor;
  Color? idenfyEIDSessionViewInputFieldBackgroundColor;

  IdenfyColorScheme({
    this.idenfyBackgroundColorV2,
    this.idenfyMainColorV2,
    this.idenfyMainDarkerColorV2,
    this.idenfySecondColorV2,
    this.idenfyMainColor50percentV2,
    this.idenfySecondColor6percentV2,
    this.idenfySecondColor20percentV2,
    this.idenfySecondColor50percentV2,
    this.idenfySecondColor80percentV2,
    this.idenfyInactiveColorV2,
    this.idenfyStepSuccessColorV2,
    this.idenfyStepErrorColorV2,
    this.idenfyFaceOvalStrokeColor,
    this.idenfyTakePhotoButtonBackgroundFocused,
    this.idenfyTakePhotoButtonIconUnFocused,
    this.idenfyTransparentCameraOverlayV2,
    this.idenfyDrawerCurrentInstructionIndicatorColorV2,
    this.idenfyDrawerInstructionControlsTintColorV2,
    this.idenfyPhotoResultDetailsCardBackgroundColorV2,
    this.idenfyRedColorV2,
    this.idenfyErrorRedColorV2,
    this.idenfyErrorLightRedColorV2,
    this.idenfyGreenColorV2,
    this.idenfyGrayColorV2,
    this.idenfyTransparentCameraOverlay,
    this.idenfyHelpSheetOverlay,
    this.idenfyLivenessBackgroundColor,
    this.idenfyBlack,
    this.idenfyWhite,
    this.idenfyWarningLightYellowV2,
    this.idenfyWarningYellowV2,
    this.idenfyBackgroundGreenV2,
    this.idenfyBorderGreenV2,
    this.idenfyPurpleColor,
    this.idenfyPurpleTextColor,
    this.idenfyPurpleBackgroundColor,
    this.idenfyLightBlueColor,
    this.idenfyBlueColor,
    this.idenfyLightGrayColor,
    this.idenfyBlackV2,
    this.idenfyDefaultAppBarBackgroundColor,
    this.idenfyDefaultAppBarIconTintColor,
    this.idenfyCameraPreviewSessionAppBarBackgroundColor,
    this.idenfyCameraPreviewSessionAppBarBackButtonTintColor,
    this.idenfyCameraPreviewSessionAppBarCameraFlashButtonTintColor,
    this.idenfyCameraPreviewSessionAppBarBackButtonTextColor,
    this.idenfyCameraPreviewSessionAppBarFaceNotDetectedAlertTintColor,
    this.idenfyFaceAuthenticationCameraPreviewSessionAppBarCameraLanguageSelectionTintColor,
    this.idenfyNoBackButtonAppBarBackgroundColor,
    this.idenfyPhotoResultAppBarBackgroundColor,
    this.idenfyPhotoResultAppBarBackButtonTextColor,
    this.idenfyLanguageSelectionToolbarLanguageSelectionIconTintColor,
    this.idenfyLanguageSelectionToolbarCloseIconTintColor,
    this.idenfyIdentificationResultsViewInstructionsAlertBackgroundColorV2,
    this.idenfyIdentificationResultsViewInstructionsAlertLoadingSpinnerColor,
    this.idenfyIdentificationResultsViewInstructionsAlertTitleTextColorV2,
    this.idenfyIdentificationResultsViewInstructionsAlertContinueButtonTextColorV2,
    this.idenfyIdentificationResultsViewInstructionsAlertProgressBarProgressColorV2,
    this.idenfyDocumentSelectionViewBackgroundColor,
    this.idenfyDocumentSelectionViewTitleTextColor,
    this.idenfyDocumentSelectionViewDescriptionTextColor,
    this.idenfyDocumentSelectionViewRecyclerViewBorderColor,
    this.idenfyDocumentSelectionViewRecyclerViewBackgroundColor,
    this.idenfyDocumentSelectionViewRecyclerViewItemBackgroundColor,
    this.idenfyDocumentSelectionViewRecyclerViewItemBorderColor,
    this.idenfyDocumentSelectionViewRecyclerViewItemTitleTextColor,
    this.idenfyDocumentSelectionViewRecyclerViewItemHighlightedTextColor,
    this.idenfyDocumentSelectionViewRecyclerViewItemHighlightedBackgroundColor,
    this.idenfyDocumentSelectionViewContinueButtonDisabledBackgroundColor,
    this.idenfyDocumentSelectionViewContinueButtonDisabledTextColor,
    this.idenfyDocumentSelectionViewContinueButtonEnabledTextColor,
    this.idenfyDocumentSelectionViewLoadingSpinnerTintColor,
    this.idenfyFaceAuthenticationResultsViewBackgroundColor,
    this.idenfyFaceAuthenticationResultsCommonInformationTitleTextColor,
    this.idenfyFaceAuthenticationResultsCommonInformationDescriptionTextColor,
    this.idenfyFaceAuthenticationResultsContinueButtonTextColor,
    this.idenfyFaceCameraPreviewSessionBackgroundColor,
    this.idenfyFaceCameraPreviewSessionOvalOutsideColor,
    this.idenfyFaceCameraPreviewSessionBottomActionButtonsViewBackgroundColor,
    this.idenfyFaceCameraPreviewSessionTakePhotoButtonUnFocusedTintColor,
    this.idenfyFaceCameraPreviewSessionTakePhotoButtonFocusedTintColor,
    this.idenfyFaceCameraPreviewSessionTakePhotoButtonUnFocusedBackgroundColor,
    this.idenfyFaceCameraPreviewSessionTakePhotoButtonFocusedBackgroundColor,
    this.idenfyFaceCameraPreviewSessionFaceOvalColor,
    this.idenfyFaceCameraPreviewSessionFaceOvalNotDetectedColor,
    this.idenfyFaceCameraPreviewSessionFaceOvalLoadingColor,
    this.idenfyFaceCameraPreviewSessionFaceDetectedColor,
    this.idenfyFaceCameraPreviewTitleTextColor,
    this.idenfyFaceCameraPreviewDescriptionTextColor,
    this.idenfyFaceCameraPreviewSessionLivenessAccentColor,
    this.idenfyContinueButtonTextColor,
    this.idenfyContinueButtonSpinnerColor,
    this.idenfyRetakeButtonTextColor,
    this.idenfyPhotoResultCardTitleColor,
    this.idenfyGradientButtonColorStart,
    this.idenfyGradientButtonColorEnd,
    this.idenfyRetakeButtonBackgroundColor,
    this.idenfyRetakeButtonBorderColor,
    this.idenfyIdentificationResultsViewBackgroundColor,
    this.idenfyIdentificationResultsViewTitleTextColor,
    this.idenfyIdentificationResultsViewDescriptionTextColor,
    this.idenfyIdentificationResultsViewDocumentStepTitleTextColor,
    this.idenfyIdentificationResultsViewDocumentStepLoadingStepDividerLoadingColor,
    this.idenfyIdentificationResultsViewDocumentStepLoadingSpinnerAccentColor,
    this.idenfyIdentificationResultsViewDocumentStepLoadingStepDividerSuccessColor,
    this.idenfyIdentificationResultsViewDocumentStepLoadingStepDividerErrorColor,
    this.idenfyIdentificationResultsViewDocumentStepScrollBarThumbColor,
    this.idenfyIdentificationResultsViewRetakeButtonTextColor,
    this.idenfyIdentificationResultsViewContentMaskForegroundColor,
    this.idenfyIdentificationResultsViewSuccessStepTextColor,
    this.idenfyIdentificationResultsViewErrorStepTextColorV2,
    this.idenfyIdentificationResultsViewDocNotFoundAlertBackgroundColorV2,
    this.idenfyIdentificationResultsViewDocNotFoundAlertTitleTextColorV2,
    this.idenfyIdentificationResultsViewDocNotFoundAlertDescriptionTextColorV2,
    this.idenfyIdentificationResultsViewDocNotFoundAlertDescriptionDocumentHighlightColorV2,
    this.idenfyIdentificationResultsViewDocNotFoundAlertContinueButtonTextColorV2,
    this.idenfyIdentificationResultsViewMrzNotFoundAlertBackgroundColorV2,
    this.idenfyIdentificationResultsViewMrzNotFoundAlertTitleTextColorV2,
    this.idenfyIdentificationResultsViewMrzNotFoundAlertDescriptionTextColorV2,
    this.idenfyIdentificationResultsViewMrzNotFoundAlertContinueButtonTextColorV2,
    this.idenfyIdentificationResultsViewMrzNotFoundAlertBackButtonTextColorV2,
    this.idenfyIdentificationResultsViewMismatchTagsFoundAlertBackgroundColorV2,
    this.idenfyIdentificationResultsViewMismatchTagsFoundAlertTitleTextColorV2,
    this.idenfyIdentificationResultsViewMismatchTagsFoundAlertDescriptionTextColorV2,
    this.idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonDisabledTextColorV2,
    this.idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonDisabledBackgroundColorV2,
    this.idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonEnabledTextColorV2,
    this.idenfyIdentificationSuccessResultsViewBackgroundColor,
    this.idenfyIdentificationSuccessResultsViewTitleTextColor,
    this.idenfyIdentificationSuccessResultsViewDescriptionTextColor,
    this.idenfyIdentificationSuccessResultsViewIdentifiedTextColor,
    this.idenfyIdentificationSuspectedResultsViewTitleColor,
    this.idenfyIdentificationSuspectedResultsViewDescriptionColor,
    this.idenfyIdentificationSuspectedResultsViewDescriptionEmailColor,
    this.idenfyIdentificationSuspectedResultsViewContinueButtonBackgroundColor,
    this.idenfyIdentificationSuspectedResultsViewContinueButtonTitleColor,
    this.idenfyLanguageSelectionViewBackgroundColor,
    this.idenfyLanguageSelectionViewTitleTextColor,
    this.idenfyLanguageSelectionViewLanguageRecyclerViewBackgroundColor,
    this.idenfyLanguageSelectionViewLanguageRecyclerViewBorderColor,
    this.idenfyLanguageSelectionViewLanguageRecyclerViewItemBackgroundColor,
    this.idenfyLanguageSelectionViewLanguageRecyclerViewItemBorderColor,
    this.idenfyLanguageSelectionViewLanguageRecyclerViewItemTextColor,
    this.idenfyLanguageSelectionViewLanguageRecyclerViewItemHighlightedTextColor,
    this.idenfyLanguageSelectionViewLanguageRecyclerViewItemHighlightedBackgroundColor,
    this.idenfyManualReviewingStatusApprovedViewBackgroundColor,
    this.idenfyManualReviewingStatusApprovedCommonInformationTitleTextColor,
    this.idenfyManualReviewingStatusApprovedCommonInformationDescriptionTextColor,
    this.idenfyManualReviewingStatusApprovedContinueButtonTextColor,
    this.idenfyManualReviewingStatusFailedViewBackgroundColor,
    this.idenfyManualReviewingStatusFailedCommonInformationTitleTextColor,
    this.idenfyManualReviewingStatusFailedCommonInformationDescriptionTextColor,
    this.idenfyManualReviewingStatusFailedCommonInformationDescriptionSupportEmailTextColor,
    this.idenfyManualReviewingStatusFailedContinueButtonTextColor,
    this.idenfyManualReviewingStatusWaitingViewBackgroundColor,
    this.idenfyManualReviewingStatusWaitingCommonInformationTitleTextColor,
    this.idenfyManualReviewingStatusWaitingCommonInformationDescriptionTextColor,
    this.idenfyManualReviewingStatusWaitingCommonReviewBoxFinishedBackgroundColor,
    this.idenfyManualReviewingStatusWaitingCommonReviewBoxFinishedTitleColor,
    this.idenfyManualReviewingStatusWaitingCommonReviewBoxFinishedTickImageTintColor,
    this.idenfyManualReviewingStatusWaitingCommonReviewBoxWaitingBackgroundColor,
    this.idenfyManualReviewingStatusWaitingCommonReviewBoxWaitingTitleColor,
    this.idenfyManualReviewingStatusWaitingCommonReviewBoxWaitingSpinnerColor,
    this.idenfyManualReviewingStatusWaitingCommonWaitingDurationTitleColor,
    this.idenfyManualReviewingStatusWaitingCommonWaitingTimerBoxBackgroundColor,
    this.idenfyManualReviewingStatusWaitingCommonWaitingTimerImageTintColor,
    this.idenfyManualReviewingStatusWaitingCommonWaitingTimerTitleColor,
    this.idenfyManualReviewingStatusWaitingBackToAccountButtonBackgroundColor,
    this.idenfyManualReviewingStatusWaitingBackToAccountButtonTextColor,
    this.idenfyNFCReadingTimeOutViewBackgroundColor,
    this.idenfyNFCReadingTimeOutCommonInformationTitleTextColor,
    this.idenfyNFCReadingTimeOutCommonInformationDescriptionTextColor,
    this.idenfyNFCReadingTimeOutContinueButtonTextColor,
    this.idenfyNFCReadingViewBackgroundColor,
    this.idenfyNFCReadingCommonInformationTitleTextColor,
    this.idenfyNFCReadingCommonInformationDescriptionTextColor,
    this.idenfyNFCRequiredViewBackgroundColor,
    this.idenfyNFCRequiredCommonInformationTitleTextColor,
    this.idenfyNFCRequiredCommonInformationDescriptionTextColor,
    this.idenfyNFCRequiredContinueButtonTextColor,
    this.idenfyQuestionnaireViewBackgroundColor,
    this.idenfyQuestionnaireViewTitleTextColor,
    this.idenfyQuestionnaireViewDescriptionTextColor,
    this.idenfyQuestionnaireViewSectionTitleTextColor,
    this.idenfyQuestionnaireViewSectionDescriptionTextColor,
    this.idenfyQuestionnaireViewContinueButtonDisabledBackgroundColor,
    this.idenfyQuestionnaireViewContinueButtonDisabledTextColor,
    this.idenfyQuestionnaireViewContinueButtonEnabledTextColor,
    this.idenfyQuestionnaireViewLoadingSpinnerTintColor,
    this.idenfyQuestionnaireViewQuestionItemTitleTextColor,
    this.idenfyQuestionnaireViewQuestionItemDescriptionTextColor,
    this.idenfyQuestionnaireViewTextQuestionItemEditTextTitleColor,
    this.idenfyQuestionnaireViewTextQuestionItemEditTextHintColor,
    this.idenfyQuestionnaireViewTextQuestionItemEditTextHighlightedBorderColor,
    this.idenfyQuestionnaireViewTextQuestionItemEditTextBackgroundColor,
    this.idenfyQuestionnaireViewTextQuestionItemEditTextBorderColor,
    this.idenfyQuestionnaireViewCheckBoxQuestionItemCheckBoxColor,
    this.idenfyQuestionnaireViewCheckBoxQuestionItemCheckBoxDescriptionColor,
    this.idenfyQuestionnaireViewCountryQuestionTrailingIconTintColor,
    this.idenfyQuestionnaireViewDateQuestionTrailingIconTintColor,
    this.idenfyQuestionnaireViewFileQuestionUploadIconTintColor,
    this.idenfyQuestionnaireViewFileQuestionCancelIconTintColor,
    this.idenfyQuestionnaireViewFileQuestionFilePickerPlaceHolderTextColor,
    this.idenfyQuestionnaireViewImageQuestionUploadIconTintColor,
    this.idenfyQuestionnaireViewImageQuestionCancelIconTintColor,
    this.idenfyQuestionnaireViewImageQuestionImagePickerPlaceHolderTextColor,
    this.idenfyQuestionnaireViewPasswordQuestionTrailingIconTintColor,
    this.idenfyQuestionnaireViewRadioQuestionRadioButtonTintColor,
    this.idenfyQuestionnaireViewRadioQuestionRadioButtonBackgroundColor,
    this.idenfyQuestionnaireViewRadioQuestionRadioButtonTextColor,
    this.idenfyQuestionnaireViewSelectMultiQuestionCheckBoxTintColor,
    this.idenfyQuestionnaireViewSelectMultiQuestionCheckBoxTextColor,
    this.idenfyQuestionnaireViewInputFieldErrorMessageTextColor,
    this.idenfyQuestionnaireViewCountryMultiQuestionCountryPickerPlaceHolderTextColor,
    this.idenfyUploadPhotoViewBackgroundColor,
    this.idenfyUploadPhotoViewTitleTextColor,
    this.idenfyUploadPhotoViewDescriptionTextColor,
    this.idenfyUploadPhotoViewCroppingBorderColor,
    this.idenfyUploadPhotoViewCroppingBackgroundColor,
    this.idenfyUploadPhotoViewCroppingPhotoLoadingSpinnerColor,
    this.idenfyUploadPhotoViewChooseAnotherPhotoButtonTextColor,
    this.idenfyUploadPhotoViewContinuePhotoButtonTextColor,
    this.idenfyBankVerificationViewBackgroundColor,
    this.idenfyBankVerificationCommonInformationTitleTextColor,
    this.idenfyBankVerificationCommonInformationDescriptionTextColor,
    this.idenfyBankVerificationViewItemSelectionBorderColor,
    this.idenfyBankVerificationViewItemSelectionBackgroundColor,
    this.idenfyBankVerificationViewItemSelectionTextColor,
    this.idenfyBankVerificationViewItemSelectionTrailingIconTintColor,
    this.idenfyBankVerificationViewCheckBoxColor,
    this.idenfyBankVerificationViewCheckBoxDescriptionColor,
    this.idenfyBankVerificationViewCheckBoxInformationTrailingIconTintColor,
    this.idenfyBankVerificationContinueButtonTextColor,
    this.idenfyBankVerificationContinueButtonDisabledTextColor,
    this.idenfyBankVerificationViewContinueButtonDisabledBackgroundColor,
    this.idenfyBankVerificationContinueButtonEnabledTextColor,
    this.idenfyBankVerificationViewSuccessStatusContainerBackgroundColor,
    this.idenfyBankVerificationViewSuccessStatusContainerBorderColor,
    this.idenfyBankVerificationViewFailedStatusContainerBackgroundColor,
    this.idenfyBankVerificationViewFailedStatusContainerBorderColor,
    this.idenfyBankVerificationViewSuccessStatusDescriptionIconTintColor,
    this.idenfyBankVerificationViewBanksRecyclerViewItemBorderColor,
    this.idenfyBankVerificationViewBanksRecyclerViewItemBackgroundColor,
    this.idenfyBankVerificationViewBankRecyclerViewItemTextColor,
    this.idenfyBankVerificationViewLoadingSpinnerTintColor,
    this.idenfyBankVerificationViewContinueButtonLoadingSpinnerTintColor,
    this.idenfyCameraPermissionViewBackgroundColor,
    this.idenfyCameraPermissionViewTitleTextColor,
    this.idenfyCameraPermissionViewDescriptionTextColor,
    this.idenfyCameraPermissionViewGuidanceDescriptionTextColor,
    this.idenfyCameraPermissionViewGoToSettingsButtonTextColor,
    this.idenfyCameraOnBoardingViewBackgroundColor,
    this.idenfyCameraOnBoardingViewLoadingSpinnerColor,
    this.idenfyCameraStaticOnBoardingViewTitleColor,
    this.idenfyCameraStaticOnBoardingViewDescriptionColor,
    this.idenfyCameraStaticOnBoardingViewProgressBarBackgroundColor,
    this.idenfyCameraStaticOnBoardingViewProgressBarForegroundColor,
    this.idenfyCameraStaticOnBoardingViewVideoDescriptionsTitleColor,
    this.idenfyCameraStaticOnBoardingViewVideoDescriptionsCircleImageTintColor,
    this.idenfyCameraStaticOnBoardingViewVideoDescriptionsTextColor,
    this.idenfyCameraStaticOnBoardingViewEnabledButtonTitleColor,
    this.idenfyCameraStaticOnBoardingViewDisabledButtonBackgroundColor,
    this.idenfyCameraStaticOnBoardingViewDisabledButtonTitleColor,
    this.idenfyCameraStaticOnBoardingViewLoadingSpinnerColor,
    this.idenfyCountrySelectionViewBackgroundColor,
    this.idenfyCountrySelectionViewTitleTextColor,
    this.idenfyCountrySelectionViewDescriptionTextColor,
    this.idenfyCountrySelectionViewCountrySearchBarBackgroundColor,
    this.idenfyCountrySelectionViewCountrySearchBarHighlightedTextColor,
    this.idenfyCountrySelectionViewCountrySearchBarTextColor,
    this.idenfyCountrySelectionViewCountryRecyclerViewBackgroundColor,
    this.idenfyCountrySelectionViewCountryRecyclerViewBorderColor,
    this.idenfyCountrySelectionViewCountryRecyclerViewItemBackgroundColor,
    this.idenfyCountrySelectionViewCountryRecyclerViewItemBorderColor,
    this.idenfyCountrySelectionViewCountryRecyclerViewItemTextColor,
    this.idenfyCountrySelectionViewCountryRecyclerViewItemHighlightedTextColor,
    this.idenfyCountrySelectionViewCountryRecyclerViewItemHighlightedBackgroundColor,
    this.idenfyCountrySelectionViewCountryRecyclerViewItemLoadingSpinnerTintColor,
    this.idenfyCountryViewSelectionCountrySearchBarBorderColor,
    this.idenfyCountrySelectionViewPredefinedCountryContinueButtonTextColor,
    this.idenfyDocumentPhotoResultViewBackgroundColor,
    this.idenfyDocumentPhotoResultViewTitleTextColor,
    this.idenfyDocumentPhotoResultViewDescriptionTextColor,
    this.idenfyDocumentPhotoResultViewRetakePhotoButtonTextColor,
    this.idenfyDocumentPhotoResultViewNextButtonTextColor,
    this.idenfyDocumentPhotoResultViewPhotoLoadingSpinnerColor,
    this.idenfyDocumentPhotoResultViewPhotoBorderColor,
    this.idenfyDocumentPhotoResultViewAutoCaptureFailureCardImageColor,
    this.idenfyDocumentPhotoResultViewAutoCaptureFailureCardTitleColor,
    this.idenfyDocumentPhotoResultViewAutoCaptureFailureCardBackgroundColor,
    this.idenfyDocumentPhotoResultViewBlurGlareWarningCardImageColor,
    this.idenfyDocumentPhotoResultViewBlurGlareWarningCardTitleColor,
    this.idenfyDocumentPhotoResultViewBlurGlareWarningCardBackgroundColor,
    this.idenfyEmailSMSVerificationViewBackgroundColor,
    this.idenfyEmailSMSVerificationCommonInformationTitleTextColor,
    this.idenfyEmailSMSVerificationCommonInformationDescriptionTextColor,
    this.idenfyEmailSMSVerificationPinCodeTextColor,
    this.idenfyEmailSMSVerificationCodeInputRetryContainerBorderColor,
    this.idenfyEmailSMSVerificationCodeInputRetryContainerBackgroundColor,
    this.idenfyEmailSMSVerificationCodeInputFailedContainerBorderColor,
    this.idenfyEmailSMSVerificationCodeInputFailedContainerBackgroundColor,
    this.idenfyEmailSMSVerificationCodeInputSuccessContainerBorderColor,
    this.idenfyEmailSMSVerificationCodeInputSuccessContainerBackgroundColor,
    this.idenfyEmailSMSVerificationViewCodeStatusTitleTextColor,
    this.idenfyEmailSMSVerificationViewCodeFailedStatusImageTintColor,
    this.idenfyEmailSMSVerificationViewCodeSuccessStatusImageTintColor,
    this.idenfyEmailSMSVerificationViewCodeExpirationTitleTextColor,
    this.idenfyEmailSMSVerificationViewResendCodeTitleTextColor,
    this.idenfyEmailSMSVerificationViewResendCodeTitleDisabledTextColor,
    this.idenfyEmailSMSVerificationViewVerifyEmailSMSContainerBorderColor,
    this.idenfyEmailSMSVerificationViewVerifyEmailSMSContainerBackgroundColor,
    this.idenfyEmailSMSVerificationVerifyEmailSMSContainerTitleTextColor,
    this.idenfyEmailSMSVerificationVerifyEmailSMSContainerDescriptionTextColor,
    this.idenfyEmailSMSVerificationViewVerifyEmailSMSContainerImageTintColor,
    this.idenfyEmailSMSVerificationEmailSMSInputEditTextBorderColor,
    this.idenfyEmailSMSVerificationEmailSMSInputEditTextBackgroundColor,
    this.idenfyEmailSMSVerificationViewEmailSMSInputEditTextTitleColor,
    this.idenfyEmailSMSVerificationViewEmailSMSInputEditTextHintColor,
    this.idenfyEmailSMSVerificationViewEmailSMSInputFieldErrorMessageTextColor,
    this.idenfyEmailSMSVerificationContinueButtonTextColor,
    this.idenfyEmailSMSVerificationContinueButtonDisabledTextColor,
    this.idenfyEmailSMSVerificationViewContinueButtonDisabledBackgroundColor,
    this.idenfyEmailSMSVerificationContinueButtonEnabledTextColor,
    this.idenfyEmailSMSVerificationContinueButtonLoadingSpinnerTintColor,
    this.idenfyFacePhotoResultViewBackgroundColor,
    this.idenfyFacePhotoResultViewTitleTextColor,
    this.idenfyFacePhotoResultViewDescriptionTextColor,
    this.idenfyFacePhotoResultViewRetakePhotoButtonTextColor,
    this.idenfyFacePhotoResultViewNextButtonTextColor,
    this.idenfyFacePhotoResultViewPhotoLoadingSpinnerColor,
    this.idenfyFacePhotoResultViewPhotoBorderColor,
    this.idenfyMFACaptchaMethodViewBackgroundColor,
    this.idenfyMFACaptchaMethodViewTitleTextColor,
    this.idenfyMFACaptchaMethodViewDescriptionTextColor,
    this.idenfyMFACaptchaMethodViewCaptchaEditTextBackgroundColor,
    this.idenfyMFACaptchaMethodViewCaptchaEditTextTitleColor,
    this.idenfyMFACaptchaMethodViewCaptchaEditTextBorderColor,
    this.idenfyMFACaptchaMethodViewCaptchaEditTextHighlightedBorderColor,
    this.idenfyMFACaptchaMethodViewCaptchaEditTextHintTitleColor,
    this.idenfyMFACaptchaMethodViewCaptchaEditTextTopHintTitleColor,
    this.idenfyMFACaptchaMethodViewContinueButtonTextColor,
    this.idenfyMFACaptchaMethodViewContinueButtonLoadingSpinnerColor,
    this.idenfyMFAGeneralViewBackgroundColor,
    this.idenfyMFAGeneralViewTitleTextColor,
    this.idenfyMFAGeneralViewDescriptionTextColor,
    this.idenfyMFAGeneralViewEditTextBackgroundColor,
    this.idenfyMFAGeneralViewEditTextTitleColor,
    this.idenfyMFAGeneralViewEditTextBorderColor,
    this.idenfyMFAGeneralViewEditTextHighlightedBorderColor,
    this.idenfyMFAGeneralViewEditTextHintTitleColor,
    this.idenfyMFAGeneralViewEditTextTopHintTitleColor,
    this.idenfyMFAGeneralViewContinueButtonTextColor,
    this.idenfyMFAGeneralViewContinueButtonLoadingSpinnerTintColor,
    this.idenfyMFAMethodSelectionViewBackgroundColor,
    this.idenfyMFAMethodSelectionViewTitleTextColor,
    this.idenfyMFAMethodSelectionViewDescriptionTextColor,
    this.idenfyMFAMethodSelectionViewTopHintTitleColor,
    this.idenfyMFAMethodSelectionViewContinueButtonTextColor,
    this.idenfyMFAMethodSelectionViewContinueButtonLoadingSpinnerTintColor,
    this.idenfyProviderLoginViewBackgroundColor,
    this.idenfyProviderLoginViewTitleTextColor,
    this.idenfyProviderLoginViewDescriptionTextColor,
    this.idenfyProviderLoginViewUsernameAndPasswordEditTextBackgroundColor,
    this.idenfyProviderLoginViewUsernameAndPasswordEditTextTitleColor,
    this.idenfyProviderLoginViewUsernameAndPasswordEditTextBorderColor,
    this.idenfyProviderLoginViewUsernameAndPasswordEditTextHighlightedBorderColor,
    this.idenfyProviderLoginViewUsernameAndPasswordEditTextHintTitleColor,
    this.idenfyProviderLoginViewUsernameAndPasswordEditTextTopHintTitleColor,
    this.idenfyProviderLoginViewContinueButtonTextColor,
    this.idenfyProviderLoginViewContinueButtonLoadingSpinnerTintColor,
    this.idenfyProviderSelectionViewBackgroundColor,
    this.idenfyProviderSelectionViewTitleTextColor,
    this.idenfyProviderSelectionViewDescriptionTextColor,
    this.idenfyProviderSelectionViewProviderSearchBarBackgroundColor,
    this.idenfyProviderSelectionViewProviderSearchBarHighlightedTextColor,
    this.idenfyProviderSelectionViewProviderSearchBarTextColor,
    this.idenfyProviderSelectionViewProviderRecyclerViewBackgroundColor,
    this.idenfyProviderSelectionViewProviderRecyclerViewBorderColor,
    this.idenfyProviderSelectionViewProviderRecyclerViewItemBackgroundColor,
    this.idenfyProviderSelectionViewProviderRecyclerViewItemBorderColor,
    this.idenfyProviderSelectionViewProviderRecyclerViewItemTextColor,
    this.idenfyProviderSelectionViewProviderRecyclerViewItemHighlightedTextColor,
    this.idenfyProviderSelectionViewProviderRecyclerViewItemHighlightedBackgroundColor,
    this.idenfyProviderViewSelectionProviderSearchBarBorderColor,
    this.idenfyProviderSelectionViewProviderRecyclerViewItemLoadingSpinnerTintColor,
    this.idenfyAdditionalSupportViewBackgroundColor,
    this.idenfyAdditionalSupportCommonInformationTitleTextColor,
    this.idenfyAdditionalSupportCommonInformationDescriptionTextColor,
    this.idenfyAdditionalSupportContinueButtonTextColor,
    this.idenfyCountryAndDocumentSelectionViewBackgroundColor,
    this.idenfyCountryAndDocumentSelectionViewTitleTextColor,
    this.idenfyCountryAndDocumentSelectionViewDescriptionTextColor,
    this.idenfyCountryAndDocumentSelectionViewItemSelectionBorderColor,
    this.idenfyCountryAndDocumentSelectionViewItemSelectionBackgroundColor,
    this.idenfyCountryAndDocumentSelectionViewItemSelectionTextColor,
    this.idenfyCountryAndDocumentSelectionViewItemSelectionTrailingIconTintColor,
    this.idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedBorderColor,
    this.idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedBackgroundColor,
    this.idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedTextColor,
    this.idenfyCountryAndDocumentSelectionViewContinueButtonDisabledBackgroundColor,
    this.idenfyCountryAndDocumentSelectionViewContinueButtonDisabledTextColor,
    this.idenfyCountryAndDocumentSelectionViewContinueButtonEnabledTextColor,
    this.idenfyCountryAndDocumentSelectionViewContinueButtonLoadingSpinnerTintColor,
    this.idenfyCountryAndDocumentSelectionViewPhysicalDocumentTitleDividerColor,
    this.idenfyDocumentCameraPreviewSessionBackgroundColor,
    this.idenfyDocumentCameraPreviewSessionBottomActionButtonsViewBackgroundColor,
    this.idenfyDocumentCameraPreviewSessionTakePhotoButtonUnFocusedTintColor,
    this.idenfyDocumentCameraPreviewSessionTakePhotoButtonFocusedTintColor,
    this.idenfyDocumentCameraPreviewSessionTakePhotoButtonUnFocusedBackgroundColor,
    this.idenfyDocumentCameraPreviewSessionTakePhotoButtonFocusedBackgroundColor,
    this.idenfyDocumentCameraPreviewSessionAcceptedDocumentsSelectedCountryHighlightColor,
    this.idenfyDocumentCameraPreviewTitleTextColor,
    this.idenfyDocumentCameraPreviewDescriptionTextColor,
    this.idenfyPrivacyPolicyViewBackgroundColor,
    this.idenfyPrivacyPolicyCommonInformationTitleTextColor,
    this.idenfyPrivacyPolicyCommonInformationDescriptionTextColor,
    this.idenfyPrivacyPolicyCardViewTextColor,
    this.idenfyPrivacyPolicyCardViewBackgroundColor,
    this.idenfyPrivacyPolicyCardViewArrowIconTintColor,
    this.idenfyPrivacyPolicyCardViewIconTintColor,
    this.idenfyPrivacyPolicyContinueButtonTextColor,
    this.idenfyPrivacyPolicyContinueButtonLoadingSpinnerTintColor,
    this.idenfyPartnerPrivacyPolicyDialogViewBackgroundColor,
    this.idenfySplashScreenViewTitleTextColor,
    this.idenfySplashScreenViewDescriptionTextColor,
    this.idenfySplashScreenViewLoadingSpinnerTintColor,
    this.idenfyBottomSheetBackgroundColor,
    this.idenfyBottomSheetDragHandleColor,
    this.idenfyBottomSheetButtonTextColor,
    this.idenfyBottomSheetTitleTextColor,
    this.idenfyBottomSheetDateTimePickerAccentColor,
    this.idenfyBottomSheetDateTimePickerActivatedColor,
    this.idenfyBottomSheetDateTimePickerHighlightColor,
    this.idenfyCustomAlertDialogNegativeButtonColor,
    this.idenfyCustomAlertDialogBackgroundColor,
    this.idenfyDefaultAlertDialogBackgroundColor,
    this.idenfyDefaultAlertDialogTitleColor,
    this.idenfyDefaultAlertDialogMessageColor,
    this.idenfyDefaultAlertDialogPositiveButtonColor,
    this.idenfyDefaultAlertDialogNegativeButtonColor,
    this.idenfyEIDSessionViewBackgroundColor,
    this.idenfyEIDSessionViewTitleTextColor,
    this.idenfyEIDSessionViewDescriptionTextColor,
    this.idenfyEIDSessionViewButtonTextColor,
    this.idenfyEIDSessionViewButtonLoadingSpinnerTintColor,
    this.idenfyEIDSessionViewCodeInputEditTextTitleColor,
    this.idenfyEIDSessionViewCodeInputEditTextHintColor,
    this.idenfyEIDSessionViewCodeInputFieldErrorMessageTextColor,
    this.idenfyEIDSessionViewCodeInputFailedContainerBorderColor,
    this.idenfyEIDSessionViewCodeInputFailedContainerBackgroundColor,
    this.idenfyEIDSessionViewCodeStatusTitleTextColor,
    this.idenfyEIDSessionViewCodeFailedStatusImageTintColor,
    this.idenfyEIDSessionViewCodeHintTextColor,
    this.idenfyEIDSessionViewContinueButtonEnabledTextColor,
    this.idenfyEIDSessionViewContinueButtonDisabledTextColor,
    this.idenfyEIDSessionViewContinueButtonDisabledBackgroundColor,
    this.idenfyEIDSessionViewUploadIconTintColor,
    this.idenfyEIDSessionViewClickToUploadTextColor,
    this.idenfyEIDSessionViewInputFieldBorderColor,
    this.idenfyEIDSessionViewInputFieldBackgroundColor,
  });

  Map<String, int> toJson() {
    final map = <String, int>{};
    if (idenfyBackgroundColorV2 != null) map['idenfyBackgroundColorV2'] = idenfyBackgroundColorV2!.value;
    if (idenfyMainColorV2 != null) map['idenfyMainColorV2'] = idenfyMainColorV2!.value;
    if (idenfyMainDarkerColorV2 != null) map['idenfyMainDarkerColorV2'] = idenfyMainDarkerColorV2!.value;
    if (idenfySecondColorV2 != null) map['idenfySecondColorV2'] = idenfySecondColorV2!.value;
    if (idenfyMainColor50percentV2 != null) map['idenfyMainColor50percentV2'] = idenfyMainColor50percentV2!.value;
    if (idenfySecondColor6percentV2 != null) map['idenfySecondColor6percentV2'] = idenfySecondColor6percentV2!.value;
    if (idenfySecondColor20percentV2 != null) map['idenfySecondColor20percentV2'] = idenfySecondColor20percentV2!.value;
    if (idenfySecondColor50percentV2 != null) map['idenfySecondColor50percentV2'] = idenfySecondColor50percentV2!.value;
    if (idenfySecondColor80percentV2 != null) map['idenfySecondColor80percentV2'] = idenfySecondColor80percentV2!.value;
    if (idenfyInactiveColorV2 != null) map['idenfyInactiveColorV2'] = idenfyInactiveColorV2!.value;
    if (idenfyStepSuccessColorV2 != null) map['idenfyStepSuccessColorV2'] = idenfyStepSuccessColorV2!.value;
    if (idenfyStepErrorColorV2 != null) map['idenfyStepErrorColorV2'] = idenfyStepErrorColorV2!.value;
    if (idenfyFaceOvalStrokeColor != null) map['idenfyFaceOvalStrokeColor'] = idenfyFaceOvalStrokeColor!.value;
    if (idenfyTakePhotoButtonBackgroundFocused != null) map['idenfyTakePhotoButtonBackgroundFocused'] = idenfyTakePhotoButtonBackgroundFocused!.value;
    if (idenfyTakePhotoButtonIconUnFocused != null) map['idenfyTakePhotoButtonIconUnFocused'] = idenfyTakePhotoButtonIconUnFocused!.value;
    if (idenfyTransparentCameraOverlayV2 != null) map['idenfyTransparentCameraOverlayV2'] = idenfyTransparentCameraOverlayV2!.value;
    if (idenfyDrawerCurrentInstructionIndicatorColorV2 != null) map['idenfyDrawerCurrentInstructionIndicatorColorV2'] = idenfyDrawerCurrentInstructionIndicatorColorV2!.value;
    if (idenfyDrawerInstructionControlsTintColorV2 != null) map['idenfyDrawerInstructionControlsTintColorV2'] = idenfyDrawerInstructionControlsTintColorV2!.value;
    if (idenfyPhotoResultDetailsCardBackgroundColorV2 != null) map['idenfyPhotoResultDetailsCardBackgroundColorV2'] = idenfyPhotoResultDetailsCardBackgroundColorV2!.value;
    if (idenfyRedColorV2 != null) map['idenfyRedColorV2'] = idenfyRedColorV2!.value;
    if (idenfyErrorRedColorV2 != null) map['idenfyErrorRedColorV2'] = idenfyErrorRedColorV2!.value;
    if (idenfyErrorLightRedColorV2 != null) map['idenfyErrorLightRedColorV2'] = idenfyErrorLightRedColorV2!.value;
    if (idenfyGreenColorV2 != null) map['idenfyGreenColorV2'] = idenfyGreenColorV2!.value;
    if (idenfyGrayColorV2 != null) map['idenfyGrayColorV2'] = idenfyGrayColorV2!.value;
    if (idenfyTransparentCameraOverlay != null) map['idenfyTransparentCameraOverlay'] = idenfyTransparentCameraOverlay!.value;
    if (idenfyHelpSheetOverlay != null) map['idenfyHelpSheetOverlay'] = idenfyHelpSheetOverlay!.value;
    if (idenfyLivenessBackgroundColor != null) map['idenfyLivenessBackgroundColor'] = idenfyLivenessBackgroundColor!.value;
    if (idenfyBlack != null) map['idenfyBlack'] = idenfyBlack!.value;
    if (idenfyWhite != null) map['idenfyWhite'] = idenfyWhite!.value;
    if (idenfyWarningLightYellowV2 != null) map['idenfyWarningLightYellowV2'] = idenfyWarningLightYellowV2!.value;
    if (idenfyWarningYellowV2 != null) map['idenfyWarningYellowV2'] = idenfyWarningYellowV2!.value;
    if (idenfyBackgroundGreenV2 != null) map['idenfyBackgroundGreenV2'] = idenfyBackgroundGreenV2!.value;
    if (idenfyBorderGreenV2 != null) map['idenfyBorderGreenV2'] = idenfyBorderGreenV2!.value;
    if (idenfyPurpleColor != null) map['idenfyPurpleColor'] = idenfyPurpleColor!.value;
    if (idenfyPurpleTextColor != null) map['idenfyPurpleTextColor'] = idenfyPurpleTextColor!.value;
    if (idenfyPurpleBackgroundColor != null) map['idenfyPurpleBackgroundColor'] = idenfyPurpleBackgroundColor!.value;
    if (idenfyLightBlueColor != null) map['idenfyLightBlueColor'] = idenfyLightBlueColor!.value;
    if (idenfyBlueColor != null) map['idenfyBlueColor'] = idenfyBlueColor!.value;
    if (idenfyLightGrayColor != null) map['idenfyLightGrayColor'] = idenfyLightGrayColor!.value;
    if (idenfyBlackV2 != null) map['idenfyBlackV2'] = idenfyBlackV2!.value;
    if (idenfyDefaultAppBarBackgroundColor != null) map['idenfyDefaultAppBarBackgroundColor'] = idenfyDefaultAppBarBackgroundColor!.value;
    if (idenfyDefaultAppBarIconTintColor != null) map['idenfyDefaultAppBarIconTintColor'] = idenfyDefaultAppBarIconTintColor!.value;
    if (idenfyCameraPreviewSessionAppBarBackgroundColor != null) map['idenfyCameraPreviewSessionAppBarBackgroundColor'] = idenfyCameraPreviewSessionAppBarBackgroundColor!.value;
    if (idenfyCameraPreviewSessionAppBarBackButtonTintColor != null) map['idenfyCameraPreviewSessionAppBarBackButtonTintColor'] = idenfyCameraPreviewSessionAppBarBackButtonTintColor!.value;
    if (idenfyCameraPreviewSessionAppBarCameraFlashButtonTintColor != null) map['idenfyCameraPreviewSessionAppBarCameraFlashButtonTintColor'] = idenfyCameraPreviewSessionAppBarCameraFlashButtonTintColor!.value;
    if (idenfyCameraPreviewSessionAppBarBackButtonTextColor != null) map['idenfyCameraPreviewSessionAppBarBackButtonTextColor'] = idenfyCameraPreviewSessionAppBarBackButtonTextColor!.value;
    if (idenfyCameraPreviewSessionAppBarFaceNotDetectedAlertTintColor != null) map['idenfyCameraPreviewSessionAppBarFaceNotDetectedAlertTintColor'] = idenfyCameraPreviewSessionAppBarFaceNotDetectedAlertTintColor!.value;
    if (idenfyFaceAuthenticationCameraPreviewSessionAppBarCameraLanguageSelectionTintColor != null) map['idenfyFaceAuthenticationCameraPreviewSessionAppBarCameraLanguageSelectionTintColor'] = idenfyFaceAuthenticationCameraPreviewSessionAppBarCameraLanguageSelectionTintColor!.value;
    if (idenfyNoBackButtonAppBarBackgroundColor != null) map['idenfyNoBackButtonAppBarBackgroundColor'] = idenfyNoBackButtonAppBarBackgroundColor!.value;
    if (idenfyPhotoResultAppBarBackgroundColor != null) map['idenfyPhotoResultAppBarBackgroundColor'] = idenfyPhotoResultAppBarBackgroundColor!.value;
    if (idenfyPhotoResultAppBarBackButtonTextColor != null) map['idenfyPhotoResultAppBarBackButtonTextColor'] = idenfyPhotoResultAppBarBackButtonTextColor!.value;
    if (idenfyLanguageSelectionToolbarLanguageSelectionIconTintColor != null) map['idenfyLanguageSelectionToolbarLanguageSelectionIconTintColor'] = idenfyLanguageSelectionToolbarLanguageSelectionIconTintColor!.value;
    if (idenfyLanguageSelectionToolbarCloseIconTintColor != null) map['idenfyLanguageSelectionToolbarCloseIconTintColor'] = idenfyLanguageSelectionToolbarCloseIconTintColor!.value;
    if (idenfyIdentificationResultsViewInstructionsAlertBackgroundColorV2 != null) map['idenfyIdentificationResultsViewInstructionsAlertBackgroundColorV2'] = idenfyIdentificationResultsViewInstructionsAlertBackgroundColorV2!.value;
    if (idenfyIdentificationResultsViewInstructionsAlertLoadingSpinnerColor != null) map['idenfyIdentificationResultsViewInstructionsAlertLoadingSpinnerColor'] = idenfyIdentificationResultsViewInstructionsAlertLoadingSpinnerColor!.value;
    if (idenfyIdentificationResultsViewInstructionsAlertTitleTextColorV2 != null) map['idenfyIdentificationResultsViewInstructionsAlertTitleTextColorV2'] = idenfyIdentificationResultsViewInstructionsAlertTitleTextColorV2!.value;
    if (idenfyIdentificationResultsViewInstructionsAlertContinueButtonTextColorV2 != null) map['idenfyIdentificationResultsViewInstructionsAlertContinueButtonTextColorV2'] = idenfyIdentificationResultsViewInstructionsAlertContinueButtonTextColorV2!.value;
    if (idenfyIdentificationResultsViewInstructionsAlertProgressBarProgressColorV2 != null) map['idenfyIdentificationResultsViewInstructionsAlertProgressBarProgressColorV2'] = idenfyIdentificationResultsViewInstructionsAlertProgressBarProgressColorV2!.value;
    if (idenfyDocumentSelectionViewBackgroundColor != null) map['idenfyDocumentSelectionViewBackgroundColor'] = idenfyDocumentSelectionViewBackgroundColor!.value;
    if (idenfyDocumentSelectionViewTitleTextColor != null) map['idenfyDocumentSelectionViewTitleTextColor'] = idenfyDocumentSelectionViewTitleTextColor!.value;
    if (idenfyDocumentSelectionViewDescriptionTextColor != null) map['idenfyDocumentSelectionViewDescriptionTextColor'] = idenfyDocumentSelectionViewDescriptionTextColor!.value;
    if (idenfyDocumentSelectionViewRecyclerViewBorderColor != null) map['idenfyDocumentSelectionViewRecyclerViewBorderColor'] = idenfyDocumentSelectionViewRecyclerViewBorderColor!.value;
    if (idenfyDocumentSelectionViewRecyclerViewBackgroundColor != null) map['idenfyDocumentSelectionViewRecyclerViewBackgroundColor'] = idenfyDocumentSelectionViewRecyclerViewBackgroundColor!.value;
    if (idenfyDocumentSelectionViewRecyclerViewItemBackgroundColor != null) map['idenfyDocumentSelectionViewRecyclerViewItemBackgroundColor'] = idenfyDocumentSelectionViewRecyclerViewItemBackgroundColor!.value;
    if (idenfyDocumentSelectionViewRecyclerViewItemBorderColor != null) map['idenfyDocumentSelectionViewRecyclerViewItemBorderColor'] = idenfyDocumentSelectionViewRecyclerViewItemBorderColor!.value;
    if (idenfyDocumentSelectionViewRecyclerViewItemTitleTextColor != null) map['idenfyDocumentSelectionViewRecyclerViewItemTitleTextColor'] = idenfyDocumentSelectionViewRecyclerViewItemTitleTextColor!.value;
    if (idenfyDocumentSelectionViewRecyclerViewItemHighlightedTextColor != null) map['idenfyDocumentSelectionViewRecyclerViewItemHighlightedTextColor'] = idenfyDocumentSelectionViewRecyclerViewItemHighlightedTextColor!.value;
    if (idenfyDocumentSelectionViewRecyclerViewItemHighlightedBackgroundColor != null) map['idenfyDocumentSelectionViewRecyclerViewItemHighlightedBackgroundColor'] = idenfyDocumentSelectionViewRecyclerViewItemHighlightedBackgroundColor!.value;
    if (idenfyDocumentSelectionViewContinueButtonDisabledBackgroundColor != null) map['idenfyDocumentSelectionViewContinueButtonDisabledBackgroundColor'] = idenfyDocumentSelectionViewContinueButtonDisabledBackgroundColor!.value;
    if (idenfyDocumentSelectionViewContinueButtonDisabledTextColor != null) map['idenfyDocumentSelectionViewContinueButtonDisabledTextColor'] = idenfyDocumentSelectionViewContinueButtonDisabledTextColor!.value;
    if (idenfyDocumentSelectionViewContinueButtonEnabledTextColor != null) map['idenfyDocumentSelectionViewContinueButtonEnabledTextColor'] = idenfyDocumentSelectionViewContinueButtonEnabledTextColor!.value;
    if (idenfyDocumentSelectionViewLoadingSpinnerTintColor != null) map['idenfyDocumentSelectionViewLoadingSpinnerTintColor'] = idenfyDocumentSelectionViewLoadingSpinnerTintColor!.value;
    if (idenfyFaceAuthenticationResultsViewBackgroundColor != null) map['idenfyFaceAuthenticationResultsViewBackgroundColor'] = idenfyFaceAuthenticationResultsViewBackgroundColor!.value;
    if (idenfyFaceAuthenticationResultsCommonInformationTitleTextColor != null) map['idenfyFaceAuthenticationResultsCommonInformationTitleTextColor'] = idenfyFaceAuthenticationResultsCommonInformationTitleTextColor!.value;
    if (idenfyFaceAuthenticationResultsCommonInformationDescriptionTextColor != null) map['idenfyFaceAuthenticationResultsCommonInformationDescriptionTextColor'] = idenfyFaceAuthenticationResultsCommonInformationDescriptionTextColor!.value;
    if (idenfyFaceAuthenticationResultsContinueButtonTextColor != null) map['idenfyFaceAuthenticationResultsContinueButtonTextColor'] = idenfyFaceAuthenticationResultsContinueButtonTextColor!.value;
    if (idenfyFaceCameraPreviewSessionBackgroundColor != null) map['idenfyFaceCameraPreviewSessionBackgroundColor'] = idenfyFaceCameraPreviewSessionBackgroundColor!.value;
    if (idenfyFaceCameraPreviewSessionOvalOutsideColor != null) map['idenfyFaceCameraPreviewSessionOvalOutsideColor'] = idenfyFaceCameraPreviewSessionOvalOutsideColor!.value;
    if (idenfyFaceCameraPreviewSessionBottomActionButtonsViewBackgroundColor != null) map['idenfyFaceCameraPreviewSessionBottomActionButtonsViewBackgroundColor'] = idenfyFaceCameraPreviewSessionBottomActionButtonsViewBackgroundColor!.value;
    if (idenfyFaceCameraPreviewSessionTakePhotoButtonUnFocusedTintColor != null) map['idenfyFaceCameraPreviewSessionTakePhotoButtonUnFocusedTintColor'] = idenfyFaceCameraPreviewSessionTakePhotoButtonUnFocusedTintColor!.value;
    if (idenfyFaceCameraPreviewSessionTakePhotoButtonFocusedTintColor != null) map['idenfyFaceCameraPreviewSessionTakePhotoButtonFocusedTintColor'] = idenfyFaceCameraPreviewSessionTakePhotoButtonFocusedTintColor!.value;
    if (idenfyFaceCameraPreviewSessionTakePhotoButtonUnFocusedBackgroundColor != null) map['idenfyFaceCameraPreviewSessionTakePhotoButtonUnFocusedBackgroundColor'] = idenfyFaceCameraPreviewSessionTakePhotoButtonUnFocusedBackgroundColor!.value;
    if (idenfyFaceCameraPreviewSessionTakePhotoButtonFocusedBackgroundColor != null) map['idenfyFaceCameraPreviewSessionTakePhotoButtonFocusedBackgroundColor'] = idenfyFaceCameraPreviewSessionTakePhotoButtonFocusedBackgroundColor!.value;
    if (idenfyFaceCameraPreviewSessionFaceOvalColor != null) map['idenfyFaceCameraPreviewSessionFaceOvalColor'] = idenfyFaceCameraPreviewSessionFaceOvalColor!.value;
    if (idenfyFaceCameraPreviewSessionFaceOvalNotDetectedColor != null) map['idenfyFaceCameraPreviewSessionFaceOvalNotDetectedColor'] = idenfyFaceCameraPreviewSessionFaceOvalNotDetectedColor!.value;
    if (idenfyFaceCameraPreviewSessionFaceOvalLoadingColor != null) map['idenfyFaceCameraPreviewSessionFaceOvalLoadingColor'] = idenfyFaceCameraPreviewSessionFaceOvalLoadingColor!.value;
    if (idenfyFaceCameraPreviewSessionFaceDetectedColor != null) map['idenfyFaceCameraPreviewSessionFaceDetectedColor'] = idenfyFaceCameraPreviewSessionFaceDetectedColor!.value;
    if (idenfyFaceCameraPreviewTitleTextColor != null) map['idenfyFaceCameraPreviewTitleTextColor'] = idenfyFaceCameraPreviewTitleTextColor!.value;
    if (idenfyFaceCameraPreviewDescriptionTextColor != null) map['idenfyFaceCameraPreviewDescriptionTextColor'] = idenfyFaceCameraPreviewDescriptionTextColor!.value;
    if (idenfyFaceCameraPreviewSessionLivenessAccentColor != null) map['idenfyFaceCameraPreviewSessionLivenessAccentColor'] = idenfyFaceCameraPreviewSessionLivenessAccentColor!.value;
    if (idenfyContinueButtonTextColor != null) map['idenfyContinueButtonTextColor'] = idenfyContinueButtonTextColor!.value;
    if (idenfyContinueButtonSpinnerColor != null) map['idenfyContinueButtonSpinnerColor'] = idenfyContinueButtonSpinnerColor!.value;
    if (idenfyRetakeButtonTextColor != null) map['idenfyRetakeButtonTextColor'] = idenfyRetakeButtonTextColor!.value;
    if (idenfyPhotoResultCardTitleColor != null) map['idenfyPhotoResultCardTitleColor'] = idenfyPhotoResultCardTitleColor!.value;
    if (idenfyGradientButtonColorStart != null) map['idenfyGradientButtonColorStart'] = idenfyGradientButtonColorStart!.value;
    if (idenfyGradientButtonColorEnd != null) map['idenfyGradientButtonColorEnd'] = idenfyGradientButtonColorEnd!.value;
    if (idenfyRetakeButtonBackgroundColor != null) map['idenfyRetakeButtonBackgroundColor'] = idenfyRetakeButtonBackgroundColor!.value;
    if (idenfyRetakeButtonBorderColor != null) map['idenfyRetakeButtonBorderColor'] = idenfyRetakeButtonBorderColor!.value;
    if (idenfyIdentificationResultsViewBackgroundColor != null) map['idenfyIdentificationResultsViewBackgroundColor'] = idenfyIdentificationResultsViewBackgroundColor!.value;
    if (idenfyIdentificationResultsViewTitleTextColor != null) map['idenfyIdentificationResultsViewTitleTextColor'] = idenfyIdentificationResultsViewTitleTextColor!.value;
    if (idenfyIdentificationResultsViewDescriptionTextColor != null) map['idenfyIdentificationResultsViewDescriptionTextColor'] = idenfyIdentificationResultsViewDescriptionTextColor!.value;
    if (idenfyIdentificationResultsViewDocumentStepTitleTextColor != null) map['idenfyIdentificationResultsViewDocumentStepTitleTextColor'] = idenfyIdentificationResultsViewDocumentStepTitleTextColor!.value;
    if (idenfyIdentificationResultsViewDocumentStepLoadingStepDividerLoadingColor != null) map['idenfyIdentificationResultsViewDocumentStepLoadingStepDividerLoadingColor'] = idenfyIdentificationResultsViewDocumentStepLoadingStepDividerLoadingColor!.value;
    if (idenfyIdentificationResultsViewDocumentStepLoadingSpinnerAccentColor != null) map['idenfyIdentificationResultsViewDocumentStepLoadingSpinnerAccentColor'] = idenfyIdentificationResultsViewDocumentStepLoadingSpinnerAccentColor!.value;
    if (idenfyIdentificationResultsViewDocumentStepLoadingStepDividerSuccessColor != null) map['idenfyIdentificationResultsViewDocumentStepLoadingStepDividerSuccessColor'] = idenfyIdentificationResultsViewDocumentStepLoadingStepDividerSuccessColor!.value;
    if (idenfyIdentificationResultsViewDocumentStepLoadingStepDividerErrorColor != null) map['idenfyIdentificationResultsViewDocumentStepLoadingStepDividerErrorColor'] = idenfyIdentificationResultsViewDocumentStepLoadingStepDividerErrorColor!.value;
    if (idenfyIdentificationResultsViewDocumentStepScrollBarThumbColor != null) map['idenfyIdentificationResultsViewDocumentStepScrollBarThumbColor'] = idenfyIdentificationResultsViewDocumentStepScrollBarThumbColor!.value;
    if (idenfyIdentificationResultsViewRetakeButtonTextColor != null) map['idenfyIdentificationResultsViewRetakeButtonTextColor'] = idenfyIdentificationResultsViewRetakeButtonTextColor!.value;
    if (idenfyIdentificationResultsViewContentMaskForegroundColor != null) map['idenfyIdentificationResultsViewContentMaskForegroundColor'] = idenfyIdentificationResultsViewContentMaskForegroundColor!.value;
    if (idenfyIdentificationResultsViewSuccessStepTextColor != null) map['idenfyIdentificationResultsViewSuccessStepTextColor'] = idenfyIdentificationResultsViewSuccessStepTextColor!.value;
    if (idenfyIdentificationResultsViewErrorStepTextColorV2 != null) map['idenfyIdentificationResultsViewErrorStepTextColorV2'] = idenfyIdentificationResultsViewErrorStepTextColorV2!.value;
    if (idenfyIdentificationResultsViewDocNotFoundAlertBackgroundColorV2 != null) map['idenfyIdentificationResultsViewDocNotFoundAlertBackgroundColorV2'] = idenfyIdentificationResultsViewDocNotFoundAlertBackgroundColorV2!.value;
    if (idenfyIdentificationResultsViewDocNotFoundAlertTitleTextColorV2 != null) map['idenfyIdentificationResultsViewDocNotFoundAlertTitleTextColorV2'] = idenfyIdentificationResultsViewDocNotFoundAlertTitleTextColorV2!.value;
    if (idenfyIdentificationResultsViewDocNotFoundAlertDescriptionTextColorV2 != null) map['idenfyIdentificationResultsViewDocNotFoundAlertDescriptionTextColorV2'] = idenfyIdentificationResultsViewDocNotFoundAlertDescriptionTextColorV2!.value;
    if (idenfyIdentificationResultsViewDocNotFoundAlertDescriptionDocumentHighlightColorV2 != null) map['idenfyIdentificationResultsViewDocNotFoundAlertDescriptionDocumentHighlightColorV2'] = idenfyIdentificationResultsViewDocNotFoundAlertDescriptionDocumentHighlightColorV2!.value;
    if (idenfyIdentificationResultsViewDocNotFoundAlertContinueButtonTextColorV2 != null) map['idenfyIdentificationResultsViewDocNotFoundAlertContinueButtonTextColorV2'] = idenfyIdentificationResultsViewDocNotFoundAlertContinueButtonTextColorV2!.value;
    if (idenfyIdentificationResultsViewMrzNotFoundAlertBackgroundColorV2 != null) map['idenfyIdentificationResultsViewMrzNotFoundAlertBackgroundColorV2'] = idenfyIdentificationResultsViewMrzNotFoundAlertBackgroundColorV2!.value;
    if (idenfyIdentificationResultsViewMrzNotFoundAlertTitleTextColorV2 != null) map['idenfyIdentificationResultsViewMrzNotFoundAlertTitleTextColorV2'] = idenfyIdentificationResultsViewMrzNotFoundAlertTitleTextColorV2!.value;
    if (idenfyIdentificationResultsViewMrzNotFoundAlertDescriptionTextColorV2 != null) map['idenfyIdentificationResultsViewMrzNotFoundAlertDescriptionTextColorV2'] = idenfyIdentificationResultsViewMrzNotFoundAlertDescriptionTextColorV2!.value;
    if (idenfyIdentificationResultsViewMrzNotFoundAlertContinueButtonTextColorV2 != null) map['idenfyIdentificationResultsViewMrzNotFoundAlertContinueButtonTextColorV2'] = idenfyIdentificationResultsViewMrzNotFoundAlertContinueButtonTextColorV2!.value;
    if (idenfyIdentificationResultsViewMrzNotFoundAlertBackButtonTextColorV2 != null) map['idenfyIdentificationResultsViewMrzNotFoundAlertBackButtonTextColorV2'] = idenfyIdentificationResultsViewMrzNotFoundAlertBackButtonTextColorV2!.value;
    if (idenfyIdentificationResultsViewMismatchTagsFoundAlertBackgroundColorV2 != null) map['idenfyIdentificationResultsViewMismatchTagsFoundAlertBackgroundColorV2'] = idenfyIdentificationResultsViewMismatchTagsFoundAlertBackgroundColorV2!.value;
    if (idenfyIdentificationResultsViewMismatchTagsFoundAlertTitleTextColorV2 != null) map['idenfyIdentificationResultsViewMismatchTagsFoundAlertTitleTextColorV2'] = idenfyIdentificationResultsViewMismatchTagsFoundAlertTitleTextColorV2!.value;
    if (idenfyIdentificationResultsViewMismatchTagsFoundAlertDescriptionTextColorV2 != null) map['idenfyIdentificationResultsViewMismatchTagsFoundAlertDescriptionTextColorV2'] = idenfyIdentificationResultsViewMismatchTagsFoundAlertDescriptionTextColorV2!.value;
    if (idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonDisabledTextColorV2 != null) map['idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonDisabledTextColorV2'] = idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonDisabledTextColorV2!.value;
    if (idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonDisabledBackgroundColorV2 != null) map['idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonDisabledBackgroundColorV2'] = idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonDisabledBackgroundColorV2!.value;
    if (idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonEnabledTextColorV2 != null) map['idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonEnabledTextColorV2'] = idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonEnabledTextColorV2!.value;
    if (idenfyIdentificationSuccessResultsViewBackgroundColor != null) map['idenfyIdentificationSuccessResultsViewBackgroundColor'] = idenfyIdentificationSuccessResultsViewBackgroundColor!.value;
    if (idenfyIdentificationSuccessResultsViewTitleTextColor != null) map['idenfyIdentificationSuccessResultsViewTitleTextColor'] = idenfyIdentificationSuccessResultsViewTitleTextColor!.value;
    if (idenfyIdentificationSuccessResultsViewDescriptionTextColor != null) map['idenfyIdentificationSuccessResultsViewDescriptionTextColor'] = idenfyIdentificationSuccessResultsViewDescriptionTextColor!.value;
    if (idenfyIdentificationSuccessResultsViewIdentifiedTextColor != null) map['idenfyIdentificationSuccessResultsViewIdentifiedTextColor'] = idenfyIdentificationSuccessResultsViewIdentifiedTextColor!.value;
    if (idenfyIdentificationSuspectedResultsViewTitleColor != null) map['idenfyIdentificationSuspectedResultsViewTitleColor'] = idenfyIdentificationSuspectedResultsViewTitleColor!.value;
    if (idenfyIdentificationSuspectedResultsViewDescriptionColor != null) map['idenfyIdentificationSuspectedResultsViewDescriptionColor'] = idenfyIdentificationSuspectedResultsViewDescriptionColor!.value;
    if (idenfyIdentificationSuspectedResultsViewDescriptionEmailColor != null) map['idenfyIdentificationSuspectedResultsViewDescriptionEmailColor'] = idenfyIdentificationSuspectedResultsViewDescriptionEmailColor!.value;
    if (idenfyIdentificationSuspectedResultsViewContinueButtonBackgroundColor != null) map['idenfyIdentificationSuspectedResultsViewContinueButtonBackgroundColor'] = idenfyIdentificationSuspectedResultsViewContinueButtonBackgroundColor!.value;
    if (idenfyIdentificationSuspectedResultsViewContinueButtonTitleColor != null) map['idenfyIdentificationSuspectedResultsViewContinueButtonTitleColor'] = idenfyIdentificationSuspectedResultsViewContinueButtonTitleColor!.value;
    if (idenfyLanguageSelectionViewBackgroundColor != null) map['idenfyLanguageSelectionViewBackgroundColor'] = idenfyLanguageSelectionViewBackgroundColor!.value;
    if (idenfyLanguageSelectionViewTitleTextColor != null) map['idenfyLanguageSelectionViewTitleTextColor'] = idenfyLanguageSelectionViewTitleTextColor!.value;
    if (idenfyLanguageSelectionViewLanguageRecyclerViewBackgroundColor != null) map['idenfyLanguageSelectionViewLanguageRecyclerViewBackgroundColor'] = idenfyLanguageSelectionViewLanguageRecyclerViewBackgroundColor!.value;
    if (idenfyLanguageSelectionViewLanguageRecyclerViewBorderColor != null) map['idenfyLanguageSelectionViewLanguageRecyclerViewBorderColor'] = idenfyLanguageSelectionViewLanguageRecyclerViewBorderColor!.value;
    if (idenfyLanguageSelectionViewLanguageRecyclerViewItemBackgroundColor != null) map['idenfyLanguageSelectionViewLanguageRecyclerViewItemBackgroundColor'] = idenfyLanguageSelectionViewLanguageRecyclerViewItemBackgroundColor!.value;
    if (idenfyLanguageSelectionViewLanguageRecyclerViewItemBorderColor != null) map['idenfyLanguageSelectionViewLanguageRecyclerViewItemBorderColor'] = idenfyLanguageSelectionViewLanguageRecyclerViewItemBorderColor!.value;
    if (idenfyLanguageSelectionViewLanguageRecyclerViewItemTextColor != null) map['idenfyLanguageSelectionViewLanguageRecyclerViewItemTextColor'] = idenfyLanguageSelectionViewLanguageRecyclerViewItemTextColor!.value;
    if (idenfyLanguageSelectionViewLanguageRecyclerViewItemHighlightedTextColor != null) map['idenfyLanguageSelectionViewLanguageRecyclerViewItemHighlightedTextColor'] = idenfyLanguageSelectionViewLanguageRecyclerViewItemHighlightedTextColor!.value;
    if (idenfyLanguageSelectionViewLanguageRecyclerViewItemHighlightedBackgroundColor != null) map['idenfyLanguageSelectionViewLanguageRecyclerViewItemHighlightedBackgroundColor'] = idenfyLanguageSelectionViewLanguageRecyclerViewItemHighlightedBackgroundColor!.value;
    if (idenfyManualReviewingStatusApprovedViewBackgroundColor != null) map['idenfyManualReviewingStatusApprovedViewBackgroundColor'] = idenfyManualReviewingStatusApprovedViewBackgroundColor!.value;
    if (idenfyManualReviewingStatusApprovedCommonInformationTitleTextColor != null) map['idenfyManualReviewingStatusApprovedCommonInformationTitleTextColor'] = idenfyManualReviewingStatusApprovedCommonInformationTitleTextColor!.value;
    if (idenfyManualReviewingStatusApprovedCommonInformationDescriptionTextColor != null) map['idenfyManualReviewingStatusApprovedCommonInformationDescriptionTextColor'] = idenfyManualReviewingStatusApprovedCommonInformationDescriptionTextColor!.value;
    if (idenfyManualReviewingStatusApprovedContinueButtonTextColor != null) map['idenfyManualReviewingStatusApprovedContinueButtonTextColor'] = idenfyManualReviewingStatusApprovedContinueButtonTextColor!.value;
    if (idenfyManualReviewingStatusFailedViewBackgroundColor != null) map['idenfyManualReviewingStatusFailedViewBackgroundColor'] = idenfyManualReviewingStatusFailedViewBackgroundColor!.value;
    if (idenfyManualReviewingStatusFailedCommonInformationTitleTextColor != null) map['idenfyManualReviewingStatusFailedCommonInformationTitleTextColor'] = idenfyManualReviewingStatusFailedCommonInformationTitleTextColor!.value;
    if (idenfyManualReviewingStatusFailedCommonInformationDescriptionTextColor != null) map['idenfyManualReviewingStatusFailedCommonInformationDescriptionTextColor'] = idenfyManualReviewingStatusFailedCommonInformationDescriptionTextColor!.value;
    if (idenfyManualReviewingStatusFailedCommonInformationDescriptionSupportEmailTextColor != null) map['idenfyManualReviewingStatusFailedCommonInformationDescriptionSupportEmailTextColor'] = idenfyManualReviewingStatusFailedCommonInformationDescriptionSupportEmailTextColor!.value;
    if (idenfyManualReviewingStatusFailedContinueButtonTextColor != null) map['idenfyManualReviewingStatusFailedContinueButtonTextColor'] = idenfyManualReviewingStatusFailedContinueButtonTextColor!.value;
    if (idenfyManualReviewingStatusWaitingViewBackgroundColor != null) map['idenfyManualReviewingStatusWaitingViewBackgroundColor'] = idenfyManualReviewingStatusWaitingViewBackgroundColor!.value;
    if (idenfyManualReviewingStatusWaitingCommonInformationTitleTextColor != null) map['idenfyManualReviewingStatusWaitingCommonInformationTitleTextColor'] = idenfyManualReviewingStatusWaitingCommonInformationTitleTextColor!.value;
    if (idenfyManualReviewingStatusWaitingCommonInformationDescriptionTextColor != null) map['idenfyManualReviewingStatusWaitingCommonInformationDescriptionTextColor'] = idenfyManualReviewingStatusWaitingCommonInformationDescriptionTextColor!.value;
    if (idenfyManualReviewingStatusWaitingCommonReviewBoxFinishedBackgroundColor != null) map['idenfyManualReviewingStatusWaitingCommonReviewBoxFinishedBackgroundColor'] = idenfyManualReviewingStatusWaitingCommonReviewBoxFinishedBackgroundColor!.value;
    if (idenfyManualReviewingStatusWaitingCommonReviewBoxFinishedTitleColor != null) map['idenfyManualReviewingStatusWaitingCommonReviewBoxFinishedTitleColor'] = idenfyManualReviewingStatusWaitingCommonReviewBoxFinishedTitleColor!.value;
    if (idenfyManualReviewingStatusWaitingCommonReviewBoxFinishedTickImageTintColor != null) map['idenfyManualReviewingStatusWaitingCommonReviewBoxFinishedTickImageTintColor'] = idenfyManualReviewingStatusWaitingCommonReviewBoxFinishedTickImageTintColor!.value;
    if (idenfyManualReviewingStatusWaitingCommonReviewBoxWaitingBackgroundColor != null) map['idenfyManualReviewingStatusWaitingCommonReviewBoxWaitingBackgroundColor'] = idenfyManualReviewingStatusWaitingCommonReviewBoxWaitingBackgroundColor!.value;
    if (idenfyManualReviewingStatusWaitingCommonReviewBoxWaitingTitleColor != null) map['idenfyManualReviewingStatusWaitingCommonReviewBoxWaitingTitleColor'] = idenfyManualReviewingStatusWaitingCommonReviewBoxWaitingTitleColor!.value;
    if (idenfyManualReviewingStatusWaitingCommonReviewBoxWaitingSpinnerColor != null) map['idenfyManualReviewingStatusWaitingCommonReviewBoxWaitingSpinnerColor'] = idenfyManualReviewingStatusWaitingCommonReviewBoxWaitingSpinnerColor!.value;
    if (idenfyManualReviewingStatusWaitingCommonWaitingDurationTitleColor != null) map['idenfyManualReviewingStatusWaitingCommonWaitingDurationTitleColor'] = idenfyManualReviewingStatusWaitingCommonWaitingDurationTitleColor!.value;
    if (idenfyManualReviewingStatusWaitingCommonWaitingTimerBoxBackgroundColor != null) map['idenfyManualReviewingStatusWaitingCommonWaitingTimerBoxBackgroundColor'] = idenfyManualReviewingStatusWaitingCommonWaitingTimerBoxBackgroundColor!.value;
    if (idenfyManualReviewingStatusWaitingCommonWaitingTimerImageTintColor != null) map['idenfyManualReviewingStatusWaitingCommonWaitingTimerImageTintColor'] = idenfyManualReviewingStatusWaitingCommonWaitingTimerImageTintColor!.value;
    if (idenfyManualReviewingStatusWaitingCommonWaitingTimerTitleColor != null) map['idenfyManualReviewingStatusWaitingCommonWaitingTimerTitleColor'] = idenfyManualReviewingStatusWaitingCommonWaitingTimerTitleColor!.value;
    if (idenfyManualReviewingStatusWaitingBackToAccountButtonBackgroundColor != null) map['idenfyManualReviewingStatusWaitingBackToAccountButtonBackgroundColor'] = idenfyManualReviewingStatusWaitingBackToAccountButtonBackgroundColor!.value;
    if (idenfyManualReviewingStatusWaitingBackToAccountButtonTextColor != null) map['idenfyManualReviewingStatusWaitingBackToAccountButtonTextColor'] = idenfyManualReviewingStatusWaitingBackToAccountButtonTextColor!.value;
    if (idenfyNFCReadingTimeOutViewBackgroundColor != null) map['idenfyNFCReadingTimeOutViewBackgroundColor'] = idenfyNFCReadingTimeOutViewBackgroundColor!.value;
    if (idenfyNFCReadingTimeOutCommonInformationTitleTextColor != null) map['idenfyNFCReadingTimeOutCommonInformationTitleTextColor'] = idenfyNFCReadingTimeOutCommonInformationTitleTextColor!.value;
    if (idenfyNFCReadingTimeOutCommonInformationDescriptionTextColor != null) map['idenfyNFCReadingTimeOutCommonInformationDescriptionTextColor'] = idenfyNFCReadingTimeOutCommonInformationDescriptionTextColor!.value;
    if (idenfyNFCReadingTimeOutContinueButtonTextColor != null) map['idenfyNFCReadingTimeOutContinueButtonTextColor'] = idenfyNFCReadingTimeOutContinueButtonTextColor!.value;
    if (idenfyNFCReadingViewBackgroundColor != null) map['idenfyNFCReadingViewBackgroundColor'] = idenfyNFCReadingViewBackgroundColor!.value;
    if (idenfyNFCReadingCommonInformationTitleTextColor != null) map['idenfyNFCReadingCommonInformationTitleTextColor'] = idenfyNFCReadingCommonInformationTitleTextColor!.value;
    if (idenfyNFCReadingCommonInformationDescriptionTextColor != null) map['idenfyNFCReadingCommonInformationDescriptionTextColor'] = idenfyNFCReadingCommonInformationDescriptionTextColor!.value;
    if (idenfyNFCRequiredViewBackgroundColor != null) map['idenfyNFCRequiredViewBackgroundColor'] = idenfyNFCRequiredViewBackgroundColor!.value;
    if (idenfyNFCRequiredCommonInformationTitleTextColor != null) map['idenfyNFCRequiredCommonInformationTitleTextColor'] = idenfyNFCRequiredCommonInformationTitleTextColor!.value;
    if (idenfyNFCRequiredCommonInformationDescriptionTextColor != null) map['idenfyNFCRequiredCommonInformationDescriptionTextColor'] = idenfyNFCRequiredCommonInformationDescriptionTextColor!.value;
    if (idenfyNFCRequiredContinueButtonTextColor != null) map['idenfyNFCRequiredContinueButtonTextColor'] = idenfyNFCRequiredContinueButtonTextColor!.value;
    if (idenfyQuestionnaireViewBackgroundColor != null) map['idenfyQuestionnaireViewBackgroundColor'] = idenfyQuestionnaireViewBackgroundColor!.value;
    if (idenfyQuestionnaireViewTitleTextColor != null) map['idenfyQuestionnaireViewTitleTextColor'] = idenfyQuestionnaireViewTitleTextColor!.value;
    if (idenfyQuestionnaireViewDescriptionTextColor != null) map['idenfyQuestionnaireViewDescriptionTextColor'] = idenfyQuestionnaireViewDescriptionTextColor!.value;
    if (idenfyQuestionnaireViewSectionTitleTextColor != null) map['idenfyQuestionnaireViewSectionTitleTextColor'] = idenfyQuestionnaireViewSectionTitleTextColor!.value;
    if (idenfyQuestionnaireViewSectionDescriptionTextColor != null) map['idenfyQuestionnaireViewSectionDescriptionTextColor'] = idenfyQuestionnaireViewSectionDescriptionTextColor!.value;
    if (idenfyQuestionnaireViewContinueButtonDisabledBackgroundColor != null) map['idenfyQuestionnaireViewContinueButtonDisabledBackgroundColor'] = idenfyQuestionnaireViewContinueButtonDisabledBackgroundColor!.value;
    if (idenfyQuestionnaireViewContinueButtonDisabledTextColor != null) map['idenfyQuestionnaireViewContinueButtonDisabledTextColor'] = idenfyQuestionnaireViewContinueButtonDisabledTextColor!.value;
    if (idenfyQuestionnaireViewContinueButtonEnabledTextColor != null) map['idenfyQuestionnaireViewContinueButtonEnabledTextColor'] = idenfyQuestionnaireViewContinueButtonEnabledTextColor!.value;
    if (idenfyQuestionnaireViewLoadingSpinnerTintColor != null) map['idenfyQuestionnaireViewLoadingSpinnerTintColor'] = idenfyQuestionnaireViewLoadingSpinnerTintColor!.value;
    if (idenfyQuestionnaireViewQuestionItemTitleTextColor != null) map['idenfyQuestionnaireViewQuestionItemTitleTextColor'] = idenfyQuestionnaireViewQuestionItemTitleTextColor!.value;
    if (idenfyQuestionnaireViewQuestionItemDescriptionTextColor != null) map['idenfyQuestionnaireViewQuestionItemDescriptionTextColor'] = idenfyQuestionnaireViewQuestionItemDescriptionTextColor!.value;
    if (idenfyQuestionnaireViewTextQuestionItemEditTextTitleColor != null) map['idenfyQuestionnaireViewTextQuestionItemEditTextTitleColor'] = idenfyQuestionnaireViewTextQuestionItemEditTextTitleColor!.value;
    if (idenfyQuestionnaireViewTextQuestionItemEditTextHintColor != null) map['idenfyQuestionnaireViewTextQuestionItemEditTextHintColor'] = idenfyQuestionnaireViewTextQuestionItemEditTextHintColor!.value;
    if (idenfyQuestionnaireViewTextQuestionItemEditTextHighlightedBorderColor != null) map['idenfyQuestionnaireViewTextQuestionItemEditTextHighlightedBorderColor'] = idenfyQuestionnaireViewTextQuestionItemEditTextHighlightedBorderColor!.value;
    if (idenfyQuestionnaireViewTextQuestionItemEditTextBackgroundColor != null) map['idenfyQuestionnaireViewTextQuestionItemEditTextBackgroundColor'] = idenfyQuestionnaireViewTextQuestionItemEditTextBackgroundColor!.value;
    if (idenfyQuestionnaireViewTextQuestionItemEditTextBorderColor != null) map['idenfyQuestionnaireViewTextQuestionItemEditTextBorderColor'] = idenfyQuestionnaireViewTextQuestionItemEditTextBorderColor!.value;
    if (idenfyQuestionnaireViewCheckBoxQuestionItemCheckBoxColor != null) map['idenfyQuestionnaireViewCheckBoxQuestionItemCheckBoxColor'] = idenfyQuestionnaireViewCheckBoxQuestionItemCheckBoxColor!.value;
    if (idenfyQuestionnaireViewCheckBoxQuestionItemCheckBoxDescriptionColor != null) map['idenfyQuestionnaireViewCheckBoxQuestionItemCheckBoxDescriptionColor'] = idenfyQuestionnaireViewCheckBoxQuestionItemCheckBoxDescriptionColor!.value;
    if (idenfyQuestionnaireViewCountryQuestionTrailingIconTintColor != null) map['idenfyQuestionnaireViewCountryQuestionTrailingIconTintColor'] = idenfyQuestionnaireViewCountryQuestionTrailingIconTintColor!.value;
    if (idenfyQuestionnaireViewDateQuestionTrailingIconTintColor != null) map['idenfyQuestionnaireViewDateQuestionTrailingIconTintColor'] = idenfyQuestionnaireViewDateQuestionTrailingIconTintColor!.value;
    if (idenfyQuestionnaireViewFileQuestionUploadIconTintColor != null) map['idenfyQuestionnaireViewFileQuestionUploadIconTintColor'] = idenfyQuestionnaireViewFileQuestionUploadIconTintColor!.value;
    if (idenfyQuestionnaireViewFileQuestionCancelIconTintColor != null) map['idenfyQuestionnaireViewFileQuestionCancelIconTintColor'] = idenfyQuestionnaireViewFileQuestionCancelIconTintColor!.value;
    if (idenfyQuestionnaireViewFileQuestionFilePickerPlaceHolderTextColor != null) map['idenfyQuestionnaireViewFileQuestionFilePickerPlaceHolderTextColor'] = idenfyQuestionnaireViewFileQuestionFilePickerPlaceHolderTextColor!.value;
    if (idenfyQuestionnaireViewImageQuestionUploadIconTintColor != null) map['idenfyQuestionnaireViewImageQuestionUploadIconTintColor'] = idenfyQuestionnaireViewImageQuestionUploadIconTintColor!.value;
    if (idenfyQuestionnaireViewImageQuestionCancelIconTintColor != null) map['idenfyQuestionnaireViewImageQuestionCancelIconTintColor'] = idenfyQuestionnaireViewImageQuestionCancelIconTintColor!.value;
    if (idenfyQuestionnaireViewImageQuestionImagePickerPlaceHolderTextColor != null) map['idenfyQuestionnaireViewImageQuestionImagePickerPlaceHolderTextColor'] = idenfyQuestionnaireViewImageQuestionImagePickerPlaceHolderTextColor!.value;
    if (idenfyQuestionnaireViewPasswordQuestionTrailingIconTintColor != null) map['idenfyQuestionnaireViewPasswordQuestionTrailingIconTintColor'] = idenfyQuestionnaireViewPasswordQuestionTrailingIconTintColor!.value;
    if (idenfyQuestionnaireViewRadioQuestionRadioButtonTintColor != null) map['idenfyQuestionnaireViewRadioQuestionRadioButtonTintColor'] = idenfyQuestionnaireViewRadioQuestionRadioButtonTintColor!.value;
    if (idenfyQuestionnaireViewRadioQuestionRadioButtonBackgroundColor != null) map['idenfyQuestionnaireViewRadioQuestionRadioButtonBackgroundColor'] = idenfyQuestionnaireViewRadioQuestionRadioButtonBackgroundColor!.value;
    if (idenfyQuestionnaireViewRadioQuestionRadioButtonTextColor != null) map['idenfyQuestionnaireViewRadioQuestionRadioButtonTextColor'] = idenfyQuestionnaireViewRadioQuestionRadioButtonTextColor!.value;
    if (idenfyQuestionnaireViewSelectMultiQuestionCheckBoxTintColor != null) map['idenfyQuestionnaireViewSelectMultiQuestionCheckBoxTintColor'] = idenfyQuestionnaireViewSelectMultiQuestionCheckBoxTintColor!.value;
    if (idenfyQuestionnaireViewSelectMultiQuestionCheckBoxTextColor != null) map['idenfyQuestionnaireViewSelectMultiQuestionCheckBoxTextColor'] = idenfyQuestionnaireViewSelectMultiQuestionCheckBoxTextColor!.value;
    if (idenfyQuestionnaireViewInputFieldErrorMessageTextColor != null) map['idenfyQuestionnaireViewInputFieldErrorMessageTextColor'] = idenfyQuestionnaireViewInputFieldErrorMessageTextColor!.value;
    if (idenfyQuestionnaireViewCountryMultiQuestionCountryPickerPlaceHolderTextColor != null) map['idenfyQuestionnaireViewCountryMultiQuestionCountryPickerPlaceHolderTextColor'] = idenfyQuestionnaireViewCountryMultiQuestionCountryPickerPlaceHolderTextColor!.value;
    if (idenfyUploadPhotoViewBackgroundColor != null) map['idenfyUploadPhotoViewBackgroundColor'] = idenfyUploadPhotoViewBackgroundColor!.value;
    if (idenfyUploadPhotoViewTitleTextColor != null) map['idenfyUploadPhotoViewTitleTextColor'] = idenfyUploadPhotoViewTitleTextColor!.value;
    if (idenfyUploadPhotoViewDescriptionTextColor != null) map['idenfyUploadPhotoViewDescriptionTextColor'] = idenfyUploadPhotoViewDescriptionTextColor!.value;
    if (idenfyUploadPhotoViewCroppingBorderColor != null) map['idenfyUploadPhotoViewCroppingBorderColor'] = idenfyUploadPhotoViewCroppingBorderColor!.value;
    if (idenfyUploadPhotoViewCroppingBackgroundColor != null) map['idenfyUploadPhotoViewCroppingBackgroundColor'] = idenfyUploadPhotoViewCroppingBackgroundColor!.value;
    if (idenfyUploadPhotoViewCroppingPhotoLoadingSpinnerColor != null) map['idenfyUploadPhotoViewCroppingPhotoLoadingSpinnerColor'] = idenfyUploadPhotoViewCroppingPhotoLoadingSpinnerColor!.value;
    if (idenfyUploadPhotoViewChooseAnotherPhotoButtonTextColor != null) map['idenfyUploadPhotoViewChooseAnotherPhotoButtonTextColor'] = idenfyUploadPhotoViewChooseAnotherPhotoButtonTextColor!.value;
    if (idenfyUploadPhotoViewContinuePhotoButtonTextColor != null) map['idenfyUploadPhotoViewContinuePhotoButtonTextColor'] = idenfyUploadPhotoViewContinuePhotoButtonTextColor!.value;
    if (idenfyBankVerificationViewBackgroundColor != null) map['idenfyBankVerificationViewBackgroundColor'] = idenfyBankVerificationViewBackgroundColor!.value;
    if (idenfyBankVerificationCommonInformationTitleTextColor != null) map['idenfyBankVerificationCommonInformationTitleTextColor'] = idenfyBankVerificationCommonInformationTitleTextColor!.value;
    if (idenfyBankVerificationCommonInformationDescriptionTextColor != null) map['idenfyBankVerificationCommonInformationDescriptionTextColor'] = idenfyBankVerificationCommonInformationDescriptionTextColor!.value;
    if (idenfyBankVerificationViewItemSelectionBorderColor != null) map['idenfyBankVerificationViewItemSelectionBorderColor'] = idenfyBankVerificationViewItemSelectionBorderColor!.value;
    if (idenfyBankVerificationViewItemSelectionBackgroundColor != null) map['idenfyBankVerificationViewItemSelectionBackgroundColor'] = idenfyBankVerificationViewItemSelectionBackgroundColor!.value;
    if (idenfyBankVerificationViewItemSelectionTextColor != null) map['idenfyBankVerificationViewItemSelectionTextColor'] = idenfyBankVerificationViewItemSelectionTextColor!.value;
    if (idenfyBankVerificationViewItemSelectionTrailingIconTintColor != null) map['idenfyBankVerificationViewItemSelectionTrailingIconTintColor'] = idenfyBankVerificationViewItemSelectionTrailingIconTintColor!.value;
    if (idenfyBankVerificationViewCheckBoxColor != null) map['idenfyBankVerificationViewCheckBoxColor'] = idenfyBankVerificationViewCheckBoxColor!.value;
    if (idenfyBankVerificationViewCheckBoxDescriptionColor != null) map['idenfyBankVerificationViewCheckBoxDescriptionColor'] = idenfyBankVerificationViewCheckBoxDescriptionColor!.value;
    if (idenfyBankVerificationViewCheckBoxInformationTrailingIconTintColor != null) map['idenfyBankVerificationViewCheckBoxInformationTrailingIconTintColor'] = idenfyBankVerificationViewCheckBoxInformationTrailingIconTintColor!.value;
    if (idenfyBankVerificationContinueButtonTextColor != null) map['idenfyBankVerificationContinueButtonTextColor'] = idenfyBankVerificationContinueButtonTextColor!.value;
    if (idenfyBankVerificationContinueButtonDisabledTextColor != null) map['idenfyBankVerificationContinueButtonDisabledTextColor'] = idenfyBankVerificationContinueButtonDisabledTextColor!.value;
    if (idenfyBankVerificationViewContinueButtonDisabledBackgroundColor != null) map['idenfyBankVerificationViewContinueButtonDisabledBackgroundColor'] = idenfyBankVerificationViewContinueButtonDisabledBackgroundColor!.value;
    if (idenfyBankVerificationContinueButtonEnabledTextColor != null) map['idenfyBankVerificationContinueButtonEnabledTextColor'] = idenfyBankVerificationContinueButtonEnabledTextColor!.value;
    if (idenfyBankVerificationViewSuccessStatusContainerBackgroundColor != null) map['idenfyBankVerificationViewSuccessStatusContainerBackgroundColor'] = idenfyBankVerificationViewSuccessStatusContainerBackgroundColor!.value;
    if (idenfyBankVerificationViewSuccessStatusContainerBorderColor != null) map['idenfyBankVerificationViewSuccessStatusContainerBorderColor'] = idenfyBankVerificationViewSuccessStatusContainerBorderColor!.value;
    if (idenfyBankVerificationViewFailedStatusContainerBackgroundColor != null) map['idenfyBankVerificationViewFailedStatusContainerBackgroundColor'] = idenfyBankVerificationViewFailedStatusContainerBackgroundColor!.value;
    if (idenfyBankVerificationViewFailedStatusContainerBorderColor != null) map['idenfyBankVerificationViewFailedStatusContainerBorderColor'] = idenfyBankVerificationViewFailedStatusContainerBorderColor!.value;
    if (idenfyBankVerificationViewSuccessStatusDescriptionIconTintColor != null) map['idenfyBankVerificationViewSuccessStatusDescriptionIconTintColor'] = idenfyBankVerificationViewSuccessStatusDescriptionIconTintColor!.value;
    if (idenfyBankVerificationViewBanksRecyclerViewItemBorderColor != null) map['idenfyBankVerificationViewBanksRecyclerViewItemBorderColor'] = idenfyBankVerificationViewBanksRecyclerViewItemBorderColor!.value;
    if (idenfyBankVerificationViewBanksRecyclerViewItemBackgroundColor != null) map['idenfyBankVerificationViewBanksRecyclerViewItemBackgroundColor'] = idenfyBankVerificationViewBanksRecyclerViewItemBackgroundColor!.value;
    if (idenfyBankVerificationViewBankRecyclerViewItemTextColor != null) map['idenfyBankVerificationViewBankRecyclerViewItemTextColor'] = idenfyBankVerificationViewBankRecyclerViewItemTextColor!.value;
    if (idenfyBankVerificationViewLoadingSpinnerTintColor != null) map['idenfyBankVerificationViewLoadingSpinnerTintColor'] = idenfyBankVerificationViewLoadingSpinnerTintColor!.value;
    if (idenfyBankVerificationViewContinueButtonLoadingSpinnerTintColor != null) map['idenfyBankVerificationViewContinueButtonLoadingSpinnerTintColor'] = idenfyBankVerificationViewContinueButtonLoadingSpinnerTintColor!.value;
    if (idenfyCameraPermissionViewBackgroundColor != null) map['idenfyCameraPermissionViewBackgroundColor'] = idenfyCameraPermissionViewBackgroundColor!.value;
    if (idenfyCameraPermissionViewTitleTextColor != null) map['idenfyCameraPermissionViewTitleTextColor'] = idenfyCameraPermissionViewTitleTextColor!.value;
    if (idenfyCameraPermissionViewDescriptionTextColor != null) map['idenfyCameraPermissionViewDescriptionTextColor'] = idenfyCameraPermissionViewDescriptionTextColor!.value;
    if (idenfyCameraPermissionViewGuidanceDescriptionTextColor != null) map['idenfyCameraPermissionViewGuidanceDescriptionTextColor'] = idenfyCameraPermissionViewGuidanceDescriptionTextColor!.value;
    if (idenfyCameraPermissionViewGoToSettingsButtonTextColor != null) map['idenfyCameraPermissionViewGoToSettingsButtonTextColor'] = idenfyCameraPermissionViewGoToSettingsButtonTextColor!.value;
    if (idenfyCameraOnBoardingViewBackgroundColor != null) map['idenfyCameraOnBoardingViewBackgroundColor'] = idenfyCameraOnBoardingViewBackgroundColor!.value;
    if (idenfyCameraOnBoardingViewLoadingSpinnerColor != null) map['idenfyCameraOnBoardingViewLoadingSpinnerColor'] = idenfyCameraOnBoardingViewLoadingSpinnerColor!.value;
    if (idenfyCameraStaticOnBoardingViewTitleColor != null) map['idenfyCameraStaticOnBoardingViewTitleColor'] = idenfyCameraStaticOnBoardingViewTitleColor!.value;
    if (idenfyCameraStaticOnBoardingViewDescriptionColor != null) map['idenfyCameraStaticOnBoardingViewDescriptionColor'] = idenfyCameraStaticOnBoardingViewDescriptionColor!.value;
    if (idenfyCameraStaticOnBoardingViewProgressBarBackgroundColor != null) map['idenfyCameraStaticOnBoardingViewProgressBarBackgroundColor'] = idenfyCameraStaticOnBoardingViewProgressBarBackgroundColor!.value;
    if (idenfyCameraStaticOnBoardingViewProgressBarForegroundColor != null) map['idenfyCameraStaticOnBoardingViewProgressBarForegroundColor'] = idenfyCameraStaticOnBoardingViewProgressBarForegroundColor!.value;
    if (idenfyCameraStaticOnBoardingViewVideoDescriptionsTitleColor != null) map['idenfyCameraStaticOnBoardingViewVideoDescriptionsTitleColor'] = idenfyCameraStaticOnBoardingViewVideoDescriptionsTitleColor!.value;
    if (idenfyCameraStaticOnBoardingViewVideoDescriptionsCircleImageTintColor != null) map['idenfyCameraStaticOnBoardingViewVideoDescriptionsCircleImageTintColor'] = idenfyCameraStaticOnBoardingViewVideoDescriptionsCircleImageTintColor!.value;
    if (idenfyCameraStaticOnBoardingViewVideoDescriptionsTextColor != null) map['idenfyCameraStaticOnBoardingViewVideoDescriptionsTextColor'] = idenfyCameraStaticOnBoardingViewVideoDescriptionsTextColor!.value;
    if (idenfyCameraStaticOnBoardingViewEnabledButtonTitleColor != null) map['idenfyCameraStaticOnBoardingViewEnabledButtonTitleColor'] = idenfyCameraStaticOnBoardingViewEnabledButtonTitleColor!.value;
    if (idenfyCameraStaticOnBoardingViewDisabledButtonBackgroundColor != null) map['idenfyCameraStaticOnBoardingViewDisabledButtonBackgroundColor'] = idenfyCameraStaticOnBoardingViewDisabledButtonBackgroundColor!.value;
    if (idenfyCameraStaticOnBoardingViewDisabledButtonTitleColor != null) map['idenfyCameraStaticOnBoardingViewDisabledButtonTitleColor'] = idenfyCameraStaticOnBoardingViewDisabledButtonTitleColor!.value;
    if (idenfyCameraStaticOnBoardingViewLoadingSpinnerColor != null) map['idenfyCameraStaticOnBoardingViewLoadingSpinnerColor'] = idenfyCameraStaticOnBoardingViewLoadingSpinnerColor!.value;
    if (idenfyCountrySelectionViewBackgroundColor != null) map['idenfyCountrySelectionViewBackgroundColor'] = idenfyCountrySelectionViewBackgroundColor!.value;
    if (idenfyCountrySelectionViewTitleTextColor != null) map['idenfyCountrySelectionViewTitleTextColor'] = idenfyCountrySelectionViewTitleTextColor!.value;
    if (idenfyCountrySelectionViewDescriptionTextColor != null) map['idenfyCountrySelectionViewDescriptionTextColor'] = idenfyCountrySelectionViewDescriptionTextColor!.value;
    if (idenfyCountrySelectionViewCountrySearchBarBackgroundColor != null) map['idenfyCountrySelectionViewCountrySearchBarBackgroundColor'] = idenfyCountrySelectionViewCountrySearchBarBackgroundColor!.value;
    if (idenfyCountrySelectionViewCountrySearchBarHighlightedTextColor != null) map['idenfyCountrySelectionViewCountrySearchBarHighlightedTextColor'] = idenfyCountrySelectionViewCountrySearchBarHighlightedTextColor!.value;
    if (idenfyCountrySelectionViewCountrySearchBarTextColor != null) map['idenfyCountrySelectionViewCountrySearchBarTextColor'] = idenfyCountrySelectionViewCountrySearchBarTextColor!.value;
    if (idenfyCountrySelectionViewCountryRecyclerViewBackgroundColor != null) map['idenfyCountrySelectionViewCountryRecyclerViewBackgroundColor'] = idenfyCountrySelectionViewCountryRecyclerViewBackgroundColor!.value;
    if (idenfyCountrySelectionViewCountryRecyclerViewBorderColor != null) map['idenfyCountrySelectionViewCountryRecyclerViewBorderColor'] = idenfyCountrySelectionViewCountryRecyclerViewBorderColor!.value;
    if (idenfyCountrySelectionViewCountryRecyclerViewItemBackgroundColor != null) map['idenfyCountrySelectionViewCountryRecyclerViewItemBackgroundColor'] = idenfyCountrySelectionViewCountryRecyclerViewItemBackgroundColor!.value;
    if (idenfyCountrySelectionViewCountryRecyclerViewItemBorderColor != null) map['idenfyCountrySelectionViewCountryRecyclerViewItemBorderColor'] = idenfyCountrySelectionViewCountryRecyclerViewItemBorderColor!.value;
    if (idenfyCountrySelectionViewCountryRecyclerViewItemTextColor != null) map['idenfyCountrySelectionViewCountryRecyclerViewItemTextColor'] = idenfyCountrySelectionViewCountryRecyclerViewItemTextColor!.value;
    if (idenfyCountrySelectionViewCountryRecyclerViewItemHighlightedTextColor != null) map['idenfyCountrySelectionViewCountryRecyclerViewItemHighlightedTextColor'] = idenfyCountrySelectionViewCountryRecyclerViewItemHighlightedTextColor!.value;
    if (idenfyCountrySelectionViewCountryRecyclerViewItemHighlightedBackgroundColor != null) map['idenfyCountrySelectionViewCountryRecyclerViewItemHighlightedBackgroundColor'] = idenfyCountrySelectionViewCountryRecyclerViewItemHighlightedBackgroundColor!.value;
    if (idenfyCountrySelectionViewCountryRecyclerViewItemLoadingSpinnerTintColor != null) map['idenfyCountrySelectionViewCountryRecyclerViewItemLoadingSpinnerTintColor'] = idenfyCountrySelectionViewCountryRecyclerViewItemLoadingSpinnerTintColor!.value;
    if (idenfyCountryViewSelectionCountrySearchBarBorderColor != null) map['idenfyCountryViewSelectionCountrySearchBarBorderColor'] = idenfyCountryViewSelectionCountrySearchBarBorderColor!.value;
    if (idenfyCountrySelectionViewPredefinedCountryContinueButtonTextColor != null) map['idenfyCountrySelectionViewPredefinedCountryContinueButtonTextColor'] = idenfyCountrySelectionViewPredefinedCountryContinueButtonTextColor!.value;
    if (idenfyDocumentPhotoResultViewBackgroundColor != null) map['idenfyDocumentPhotoResultViewBackgroundColor'] = idenfyDocumentPhotoResultViewBackgroundColor!.value;
    if (idenfyDocumentPhotoResultViewTitleTextColor != null) map['idenfyDocumentPhotoResultViewTitleTextColor'] = idenfyDocumentPhotoResultViewTitleTextColor!.value;
    if (idenfyDocumentPhotoResultViewDescriptionTextColor != null) map['idenfyDocumentPhotoResultViewDescriptionTextColor'] = idenfyDocumentPhotoResultViewDescriptionTextColor!.value;
    if (idenfyDocumentPhotoResultViewRetakePhotoButtonTextColor != null) map['idenfyDocumentPhotoResultViewRetakePhotoButtonTextColor'] = idenfyDocumentPhotoResultViewRetakePhotoButtonTextColor!.value;
    if (idenfyDocumentPhotoResultViewNextButtonTextColor != null) map['idenfyDocumentPhotoResultViewNextButtonTextColor'] = idenfyDocumentPhotoResultViewNextButtonTextColor!.value;
    if (idenfyDocumentPhotoResultViewPhotoLoadingSpinnerColor != null) map['idenfyDocumentPhotoResultViewPhotoLoadingSpinnerColor'] = idenfyDocumentPhotoResultViewPhotoLoadingSpinnerColor!.value;
    if (idenfyDocumentPhotoResultViewPhotoBorderColor != null) map['idenfyDocumentPhotoResultViewPhotoBorderColor'] = idenfyDocumentPhotoResultViewPhotoBorderColor!.value;
    if (idenfyDocumentPhotoResultViewAutoCaptureFailureCardImageColor != null) map['idenfyDocumentPhotoResultViewAutoCaptureFailureCardImageColor'] = idenfyDocumentPhotoResultViewAutoCaptureFailureCardImageColor!.value;
    if (idenfyDocumentPhotoResultViewAutoCaptureFailureCardTitleColor != null) map['idenfyDocumentPhotoResultViewAutoCaptureFailureCardTitleColor'] = idenfyDocumentPhotoResultViewAutoCaptureFailureCardTitleColor!.value;
    if (idenfyDocumentPhotoResultViewAutoCaptureFailureCardBackgroundColor != null) map['idenfyDocumentPhotoResultViewAutoCaptureFailureCardBackgroundColor'] = idenfyDocumentPhotoResultViewAutoCaptureFailureCardBackgroundColor!.value;
    if (idenfyDocumentPhotoResultViewBlurGlareWarningCardImageColor != null) map['idenfyDocumentPhotoResultViewBlurGlareWarningCardImageColor'] = idenfyDocumentPhotoResultViewBlurGlareWarningCardImageColor!.value;
    if (idenfyDocumentPhotoResultViewBlurGlareWarningCardTitleColor != null) map['idenfyDocumentPhotoResultViewBlurGlareWarningCardTitleColor'] = idenfyDocumentPhotoResultViewBlurGlareWarningCardTitleColor!.value;
    if (idenfyDocumentPhotoResultViewBlurGlareWarningCardBackgroundColor != null) map['idenfyDocumentPhotoResultViewBlurGlareWarningCardBackgroundColor'] = idenfyDocumentPhotoResultViewBlurGlareWarningCardBackgroundColor!.value;
    if (idenfyEmailSMSVerificationViewBackgroundColor != null) map['idenfyEmailSMSVerificationViewBackgroundColor'] = idenfyEmailSMSVerificationViewBackgroundColor!.value;
    if (idenfyEmailSMSVerificationCommonInformationTitleTextColor != null) map['idenfyEmailSMSVerificationCommonInformationTitleTextColor'] = idenfyEmailSMSVerificationCommonInformationTitleTextColor!.value;
    if (idenfyEmailSMSVerificationCommonInformationDescriptionTextColor != null) map['idenfyEmailSMSVerificationCommonInformationDescriptionTextColor'] = idenfyEmailSMSVerificationCommonInformationDescriptionTextColor!.value;
    if (idenfyEmailSMSVerificationPinCodeTextColor != null) map['idenfyEmailSMSVerificationPinCodeTextColor'] = idenfyEmailSMSVerificationPinCodeTextColor!.value;
    if (idenfyEmailSMSVerificationCodeInputRetryContainerBorderColor != null) map['idenfyEmailSMSVerificationCodeInputRetryContainerBorderColor'] = idenfyEmailSMSVerificationCodeInputRetryContainerBorderColor!.value;
    if (idenfyEmailSMSVerificationCodeInputRetryContainerBackgroundColor != null) map['idenfyEmailSMSVerificationCodeInputRetryContainerBackgroundColor'] = idenfyEmailSMSVerificationCodeInputRetryContainerBackgroundColor!.value;
    if (idenfyEmailSMSVerificationCodeInputFailedContainerBorderColor != null) map['idenfyEmailSMSVerificationCodeInputFailedContainerBorderColor'] = idenfyEmailSMSVerificationCodeInputFailedContainerBorderColor!.value;
    if (idenfyEmailSMSVerificationCodeInputFailedContainerBackgroundColor != null) map['idenfyEmailSMSVerificationCodeInputFailedContainerBackgroundColor'] = idenfyEmailSMSVerificationCodeInputFailedContainerBackgroundColor!.value;
    if (idenfyEmailSMSVerificationCodeInputSuccessContainerBorderColor != null) map['idenfyEmailSMSVerificationCodeInputSuccessContainerBorderColor'] = idenfyEmailSMSVerificationCodeInputSuccessContainerBorderColor!.value;
    if (idenfyEmailSMSVerificationCodeInputSuccessContainerBackgroundColor != null) map['idenfyEmailSMSVerificationCodeInputSuccessContainerBackgroundColor'] = idenfyEmailSMSVerificationCodeInputSuccessContainerBackgroundColor!.value;
    if (idenfyEmailSMSVerificationViewCodeStatusTitleTextColor != null) map['idenfyEmailSMSVerificationViewCodeStatusTitleTextColor'] = idenfyEmailSMSVerificationViewCodeStatusTitleTextColor!.value;
    if (idenfyEmailSMSVerificationViewCodeFailedStatusImageTintColor != null) map['idenfyEmailSMSVerificationViewCodeFailedStatusImageTintColor'] = idenfyEmailSMSVerificationViewCodeFailedStatusImageTintColor!.value;
    if (idenfyEmailSMSVerificationViewCodeSuccessStatusImageTintColor != null) map['idenfyEmailSMSVerificationViewCodeSuccessStatusImageTintColor'] = idenfyEmailSMSVerificationViewCodeSuccessStatusImageTintColor!.value;
    if (idenfyEmailSMSVerificationViewCodeExpirationTitleTextColor != null) map['idenfyEmailSMSVerificationViewCodeExpirationTitleTextColor'] = idenfyEmailSMSVerificationViewCodeExpirationTitleTextColor!.value;
    if (idenfyEmailSMSVerificationViewResendCodeTitleTextColor != null) map['idenfyEmailSMSVerificationViewResendCodeTitleTextColor'] = idenfyEmailSMSVerificationViewResendCodeTitleTextColor!.value;
    if (idenfyEmailSMSVerificationViewResendCodeTitleDisabledTextColor != null) map['idenfyEmailSMSVerificationViewResendCodeTitleDisabledTextColor'] = idenfyEmailSMSVerificationViewResendCodeTitleDisabledTextColor!.value;
    if (idenfyEmailSMSVerificationViewVerifyEmailSMSContainerBorderColor != null) map['idenfyEmailSMSVerificationViewVerifyEmailSMSContainerBorderColor'] = idenfyEmailSMSVerificationViewVerifyEmailSMSContainerBorderColor!.value;
    if (idenfyEmailSMSVerificationViewVerifyEmailSMSContainerBackgroundColor != null) map['idenfyEmailSMSVerificationViewVerifyEmailSMSContainerBackgroundColor'] = idenfyEmailSMSVerificationViewVerifyEmailSMSContainerBackgroundColor!.value;
    if (idenfyEmailSMSVerificationVerifyEmailSMSContainerTitleTextColor != null) map['idenfyEmailSMSVerificationVerifyEmailSMSContainerTitleTextColor'] = idenfyEmailSMSVerificationVerifyEmailSMSContainerTitleTextColor!.value;
    if (idenfyEmailSMSVerificationVerifyEmailSMSContainerDescriptionTextColor != null) map['idenfyEmailSMSVerificationVerifyEmailSMSContainerDescriptionTextColor'] = idenfyEmailSMSVerificationVerifyEmailSMSContainerDescriptionTextColor!.value;
    if (idenfyEmailSMSVerificationViewVerifyEmailSMSContainerImageTintColor != null) map['idenfyEmailSMSVerificationViewVerifyEmailSMSContainerImageTintColor'] = idenfyEmailSMSVerificationViewVerifyEmailSMSContainerImageTintColor!.value;
    if (idenfyEmailSMSVerificationEmailSMSInputEditTextBorderColor != null) map['idenfyEmailSMSVerificationEmailSMSInputEditTextBorderColor'] = idenfyEmailSMSVerificationEmailSMSInputEditTextBorderColor!.value;
    if (idenfyEmailSMSVerificationEmailSMSInputEditTextBackgroundColor != null) map['idenfyEmailSMSVerificationEmailSMSInputEditTextBackgroundColor'] = idenfyEmailSMSVerificationEmailSMSInputEditTextBackgroundColor!.value;
    if (idenfyEmailSMSVerificationViewEmailSMSInputEditTextTitleColor != null) map['idenfyEmailSMSVerificationViewEmailSMSInputEditTextTitleColor'] = idenfyEmailSMSVerificationViewEmailSMSInputEditTextTitleColor!.value;
    if (idenfyEmailSMSVerificationViewEmailSMSInputEditTextHintColor != null) map['idenfyEmailSMSVerificationViewEmailSMSInputEditTextHintColor'] = idenfyEmailSMSVerificationViewEmailSMSInputEditTextHintColor!.value;
    if (idenfyEmailSMSVerificationViewEmailSMSInputFieldErrorMessageTextColor != null) map['idenfyEmailSMSVerificationViewEmailSMSInputFieldErrorMessageTextColor'] = idenfyEmailSMSVerificationViewEmailSMSInputFieldErrorMessageTextColor!.value;
    if (idenfyEmailSMSVerificationContinueButtonTextColor != null) map['idenfyEmailSMSVerificationContinueButtonTextColor'] = idenfyEmailSMSVerificationContinueButtonTextColor!.value;
    if (idenfyEmailSMSVerificationContinueButtonDisabledTextColor != null) map['idenfyEmailSMSVerificationContinueButtonDisabledTextColor'] = idenfyEmailSMSVerificationContinueButtonDisabledTextColor!.value;
    if (idenfyEmailSMSVerificationViewContinueButtonDisabledBackgroundColor != null) map['idenfyEmailSMSVerificationViewContinueButtonDisabledBackgroundColor'] = idenfyEmailSMSVerificationViewContinueButtonDisabledBackgroundColor!.value;
    if (idenfyEmailSMSVerificationContinueButtonEnabledTextColor != null) map['idenfyEmailSMSVerificationContinueButtonEnabledTextColor'] = idenfyEmailSMSVerificationContinueButtonEnabledTextColor!.value;
    if (idenfyEmailSMSVerificationContinueButtonLoadingSpinnerTintColor != null) map['idenfyEmailSMSVerificationContinueButtonLoadingSpinnerTintColor'] = idenfyEmailSMSVerificationContinueButtonLoadingSpinnerTintColor!.value;
    if (idenfyFacePhotoResultViewBackgroundColor != null) map['idenfyFacePhotoResultViewBackgroundColor'] = idenfyFacePhotoResultViewBackgroundColor!.value;
    if (idenfyFacePhotoResultViewTitleTextColor != null) map['idenfyFacePhotoResultViewTitleTextColor'] = idenfyFacePhotoResultViewTitleTextColor!.value;
    if (idenfyFacePhotoResultViewDescriptionTextColor != null) map['idenfyFacePhotoResultViewDescriptionTextColor'] = idenfyFacePhotoResultViewDescriptionTextColor!.value;
    if (idenfyFacePhotoResultViewRetakePhotoButtonTextColor != null) map['idenfyFacePhotoResultViewRetakePhotoButtonTextColor'] = idenfyFacePhotoResultViewRetakePhotoButtonTextColor!.value;
    if (idenfyFacePhotoResultViewNextButtonTextColor != null) map['idenfyFacePhotoResultViewNextButtonTextColor'] = idenfyFacePhotoResultViewNextButtonTextColor!.value;
    if (idenfyFacePhotoResultViewPhotoLoadingSpinnerColor != null) map['idenfyFacePhotoResultViewPhotoLoadingSpinnerColor'] = idenfyFacePhotoResultViewPhotoLoadingSpinnerColor!.value;
    if (idenfyFacePhotoResultViewPhotoBorderColor != null) map['idenfyFacePhotoResultViewPhotoBorderColor'] = idenfyFacePhotoResultViewPhotoBorderColor!.value;
    if (idenfyMFACaptchaMethodViewBackgroundColor != null) map['idenfyMFACaptchaMethodViewBackgroundColor'] = idenfyMFACaptchaMethodViewBackgroundColor!.value;
    if (idenfyMFACaptchaMethodViewTitleTextColor != null) map['idenfyMFACaptchaMethodViewTitleTextColor'] = idenfyMFACaptchaMethodViewTitleTextColor!.value;
    if (idenfyMFACaptchaMethodViewDescriptionTextColor != null) map['idenfyMFACaptchaMethodViewDescriptionTextColor'] = idenfyMFACaptchaMethodViewDescriptionTextColor!.value;
    if (idenfyMFACaptchaMethodViewCaptchaEditTextBackgroundColor != null) map['idenfyMFACaptchaMethodViewCaptchaEditTextBackgroundColor'] = idenfyMFACaptchaMethodViewCaptchaEditTextBackgroundColor!.value;
    if (idenfyMFACaptchaMethodViewCaptchaEditTextTitleColor != null) map['idenfyMFACaptchaMethodViewCaptchaEditTextTitleColor'] = idenfyMFACaptchaMethodViewCaptchaEditTextTitleColor!.value;
    if (idenfyMFACaptchaMethodViewCaptchaEditTextBorderColor != null) map['idenfyMFACaptchaMethodViewCaptchaEditTextBorderColor'] = idenfyMFACaptchaMethodViewCaptchaEditTextBorderColor!.value;
    if (idenfyMFACaptchaMethodViewCaptchaEditTextHighlightedBorderColor != null) map['idenfyMFACaptchaMethodViewCaptchaEditTextHighlightedBorderColor'] = idenfyMFACaptchaMethodViewCaptchaEditTextHighlightedBorderColor!.value;
    if (idenfyMFACaptchaMethodViewCaptchaEditTextHintTitleColor != null) map['idenfyMFACaptchaMethodViewCaptchaEditTextHintTitleColor'] = idenfyMFACaptchaMethodViewCaptchaEditTextHintTitleColor!.value;
    if (idenfyMFACaptchaMethodViewCaptchaEditTextTopHintTitleColor != null) map['idenfyMFACaptchaMethodViewCaptchaEditTextTopHintTitleColor'] = idenfyMFACaptchaMethodViewCaptchaEditTextTopHintTitleColor!.value;
    if (idenfyMFACaptchaMethodViewContinueButtonTextColor != null) map['idenfyMFACaptchaMethodViewContinueButtonTextColor'] = idenfyMFACaptchaMethodViewContinueButtonTextColor!.value;
    if (idenfyMFACaptchaMethodViewContinueButtonLoadingSpinnerColor != null) map['idenfyMFACaptchaMethodViewContinueButtonLoadingSpinnerColor'] = idenfyMFACaptchaMethodViewContinueButtonLoadingSpinnerColor!.value;
    if (idenfyMFAGeneralViewBackgroundColor != null) map['idenfyMFAGeneralViewBackgroundColor'] = idenfyMFAGeneralViewBackgroundColor!.value;
    if (idenfyMFAGeneralViewTitleTextColor != null) map['idenfyMFAGeneralViewTitleTextColor'] = idenfyMFAGeneralViewTitleTextColor!.value;
    if (idenfyMFAGeneralViewDescriptionTextColor != null) map['idenfyMFAGeneralViewDescriptionTextColor'] = idenfyMFAGeneralViewDescriptionTextColor!.value;
    if (idenfyMFAGeneralViewEditTextBackgroundColor != null) map['idenfyMFAGeneralViewEditTextBackgroundColor'] = idenfyMFAGeneralViewEditTextBackgroundColor!.value;
    if (idenfyMFAGeneralViewEditTextTitleColor != null) map['idenfyMFAGeneralViewEditTextTitleColor'] = idenfyMFAGeneralViewEditTextTitleColor!.value;
    if (idenfyMFAGeneralViewEditTextBorderColor != null) map['idenfyMFAGeneralViewEditTextBorderColor'] = idenfyMFAGeneralViewEditTextBorderColor!.value;
    if (idenfyMFAGeneralViewEditTextHighlightedBorderColor != null) map['idenfyMFAGeneralViewEditTextHighlightedBorderColor'] = idenfyMFAGeneralViewEditTextHighlightedBorderColor!.value;
    if (idenfyMFAGeneralViewEditTextHintTitleColor != null) map['idenfyMFAGeneralViewEditTextHintTitleColor'] = idenfyMFAGeneralViewEditTextHintTitleColor!.value;
    if (idenfyMFAGeneralViewEditTextTopHintTitleColor != null) map['idenfyMFAGeneralViewEditTextTopHintTitleColor'] = idenfyMFAGeneralViewEditTextTopHintTitleColor!.value;
    if (idenfyMFAGeneralViewContinueButtonTextColor != null) map['idenfyMFAGeneralViewContinueButtonTextColor'] = idenfyMFAGeneralViewContinueButtonTextColor!.value;
    if (idenfyMFAGeneralViewContinueButtonLoadingSpinnerTintColor != null) map['idenfyMFAGeneralViewContinueButtonLoadingSpinnerTintColor'] = idenfyMFAGeneralViewContinueButtonLoadingSpinnerTintColor!.value;
    if (idenfyMFAMethodSelectionViewBackgroundColor != null) map['idenfyMFAMethodSelectionViewBackgroundColor'] = idenfyMFAMethodSelectionViewBackgroundColor!.value;
    if (idenfyMFAMethodSelectionViewTitleTextColor != null) map['idenfyMFAMethodSelectionViewTitleTextColor'] = idenfyMFAMethodSelectionViewTitleTextColor!.value;
    if (idenfyMFAMethodSelectionViewDescriptionTextColor != null) map['idenfyMFAMethodSelectionViewDescriptionTextColor'] = idenfyMFAMethodSelectionViewDescriptionTextColor!.value;
    if (idenfyMFAMethodSelectionViewTopHintTitleColor != null) map['idenfyMFAMethodSelectionViewTopHintTitleColor'] = idenfyMFAMethodSelectionViewTopHintTitleColor!.value;
    if (idenfyMFAMethodSelectionViewContinueButtonTextColor != null) map['idenfyMFAMethodSelectionViewContinueButtonTextColor'] = idenfyMFAMethodSelectionViewContinueButtonTextColor!.value;
    if (idenfyMFAMethodSelectionViewContinueButtonLoadingSpinnerTintColor != null) map['idenfyMFAMethodSelectionViewContinueButtonLoadingSpinnerTintColor'] = idenfyMFAMethodSelectionViewContinueButtonLoadingSpinnerTintColor!.value;
    if (idenfyProviderLoginViewBackgroundColor != null) map['idenfyProviderLoginViewBackgroundColor'] = idenfyProviderLoginViewBackgroundColor!.value;
    if (idenfyProviderLoginViewTitleTextColor != null) map['idenfyProviderLoginViewTitleTextColor'] = idenfyProviderLoginViewTitleTextColor!.value;
    if (idenfyProviderLoginViewDescriptionTextColor != null) map['idenfyProviderLoginViewDescriptionTextColor'] = idenfyProviderLoginViewDescriptionTextColor!.value;
    if (idenfyProviderLoginViewUsernameAndPasswordEditTextBackgroundColor != null) map['idenfyProviderLoginViewUsernameAndPasswordEditTextBackgroundColor'] = idenfyProviderLoginViewUsernameAndPasswordEditTextBackgroundColor!.value;
    if (idenfyProviderLoginViewUsernameAndPasswordEditTextTitleColor != null) map['idenfyProviderLoginViewUsernameAndPasswordEditTextTitleColor'] = idenfyProviderLoginViewUsernameAndPasswordEditTextTitleColor!.value;
    if (idenfyProviderLoginViewUsernameAndPasswordEditTextBorderColor != null) map['idenfyProviderLoginViewUsernameAndPasswordEditTextBorderColor'] = idenfyProviderLoginViewUsernameAndPasswordEditTextBorderColor!.value;
    if (idenfyProviderLoginViewUsernameAndPasswordEditTextHighlightedBorderColor != null) map['idenfyProviderLoginViewUsernameAndPasswordEditTextHighlightedBorderColor'] = idenfyProviderLoginViewUsernameAndPasswordEditTextHighlightedBorderColor!.value;
    if (idenfyProviderLoginViewUsernameAndPasswordEditTextHintTitleColor != null) map['idenfyProviderLoginViewUsernameAndPasswordEditTextHintTitleColor'] = idenfyProviderLoginViewUsernameAndPasswordEditTextHintTitleColor!.value;
    if (idenfyProviderLoginViewUsernameAndPasswordEditTextTopHintTitleColor != null) map['idenfyProviderLoginViewUsernameAndPasswordEditTextTopHintTitleColor'] = idenfyProviderLoginViewUsernameAndPasswordEditTextTopHintTitleColor!.value;
    if (idenfyProviderLoginViewContinueButtonTextColor != null) map['idenfyProviderLoginViewContinueButtonTextColor'] = idenfyProviderLoginViewContinueButtonTextColor!.value;
    if (idenfyProviderLoginViewContinueButtonLoadingSpinnerTintColor != null) map['idenfyProviderLoginViewContinueButtonLoadingSpinnerTintColor'] = idenfyProviderLoginViewContinueButtonLoadingSpinnerTintColor!.value;
    if (idenfyProviderSelectionViewBackgroundColor != null) map['idenfyProviderSelectionViewBackgroundColor'] = idenfyProviderSelectionViewBackgroundColor!.value;
    if (idenfyProviderSelectionViewTitleTextColor != null) map['idenfyProviderSelectionViewTitleTextColor'] = idenfyProviderSelectionViewTitleTextColor!.value;
    if (idenfyProviderSelectionViewDescriptionTextColor != null) map['idenfyProviderSelectionViewDescriptionTextColor'] = idenfyProviderSelectionViewDescriptionTextColor!.value;
    if (idenfyProviderSelectionViewProviderSearchBarBackgroundColor != null) map['idenfyProviderSelectionViewProviderSearchBarBackgroundColor'] = idenfyProviderSelectionViewProviderSearchBarBackgroundColor!.value;
    if (idenfyProviderSelectionViewProviderSearchBarHighlightedTextColor != null) map['idenfyProviderSelectionViewProviderSearchBarHighlightedTextColor'] = idenfyProviderSelectionViewProviderSearchBarHighlightedTextColor!.value;
    if (idenfyProviderSelectionViewProviderSearchBarTextColor != null) map['idenfyProviderSelectionViewProviderSearchBarTextColor'] = idenfyProviderSelectionViewProviderSearchBarTextColor!.value;
    if (idenfyProviderSelectionViewProviderRecyclerViewBackgroundColor != null) map['idenfyProviderSelectionViewProviderRecyclerViewBackgroundColor'] = idenfyProviderSelectionViewProviderRecyclerViewBackgroundColor!.value;
    if (idenfyProviderSelectionViewProviderRecyclerViewBorderColor != null) map['idenfyProviderSelectionViewProviderRecyclerViewBorderColor'] = idenfyProviderSelectionViewProviderRecyclerViewBorderColor!.value;
    if (idenfyProviderSelectionViewProviderRecyclerViewItemBackgroundColor != null) map['idenfyProviderSelectionViewProviderRecyclerViewItemBackgroundColor'] = idenfyProviderSelectionViewProviderRecyclerViewItemBackgroundColor!.value;
    if (idenfyProviderSelectionViewProviderRecyclerViewItemBorderColor != null) map['idenfyProviderSelectionViewProviderRecyclerViewItemBorderColor'] = idenfyProviderSelectionViewProviderRecyclerViewItemBorderColor!.value;
    if (idenfyProviderSelectionViewProviderRecyclerViewItemTextColor != null) map['idenfyProviderSelectionViewProviderRecyclerViewItemTextColor'] = idenfyProviderSelectionViewProviderRecyclerViewItemTextColor!.value;
    if (idenfyProviderSelectionViewProviderRecyclerViewItemHighlightedTextColor != null) map['idenfyProviderSelectionViewProviderRecyclerViewItemHighlightedTextColor'] = idenfyProviderSelectionViewProviderRecyclerViewItemHighlightedTextColor!.value;
    if (idenfyProviderSelectionViewProviderRecyclerViewItemHighlightedBackgroundColor != null) map['idenfyProviderSelectionViewProviderRecyclerViewItemHighlightedBackgroundColor'] = idenfyProviderSelectionViewProviderRecyclerViewItemHighlightedBackgroundColor!.value;
    if (idenfyProviderViewSelectionProviderSearchBarBorderColor != null) map['idenfyProviderViewSelectionProviderSearchBarBorderColor'] = idenfyProviderViewSelectionProviderSearchBarBorderColor!.value;
    if (idenfyProviderSelectionViewProviderRecyclerViewItemLoadingSpinnerTintColor != null) map['idenfyProviderSelectionViewProviderRecyclerViewItemLoadingSpinnerTintColor'] = idenfyProviderSelectionViewProviderRecyclerViewItemLoadingSpinnerTintColor!.value;
    if (idenfyAdditionalSupportViewBackgroundColor != null) map['idenfyAdditionalSupportViewBackgroundColor'] = idenfyAdditionalSupportViewBackgroundColor!.value;
    if (idenfyAdditionalSupportCommonInformationTitleTextColor != null) map['idenfyAdditionalSupportCommonInformationTitleTextColor'] = idenfyAdditionalSupportCommonInformationTitleTextColor!.value;
    if (idenfyAdditionalSupportCommonInformationDescriptionTextColor != null) map['idenfyAdditionalSupportCommonInformationDescriptionTextColor'] = idenfyAdditionalSupportCommonInformationDescriptionTextColor!.value;
    if (idenfyAdditionalSupportContinueButtonTextColor != null) map['idenfyAdditionalSupportContinueButtonTextColor'] = idenfyAdditionalSupportContinueButtonTextColor!.value;
    if (idenfyCountryAndDocumentSelectionViewBackgroundColor != null) map['idenfyCountryAndDocumentSelectionViewBackgroundColor'] = idenfyCountryAndDocumentSelectionViewBackgroundColor!.value;
    if (idenfyCountryAndDocumentSelectionViewTitleTextColor != null) map['idenfyCountryAndDocumentSelectionViewTitleTextColor'] = idenfyCountryAndDocumentSelectionViewTitleTextColor!.value;
    if (idenfyCountryAndDocumentSelectionViewDescriptionTextColor != null) map['idenfyCountryAndDocumentSelectionViewDescriptionTextColor'] = idenfyCountryAndDocumentSelectionViewDescriptionTextColor!.value;
    if (idenfyCountryAndDocumentSelectionViewItemSelectionBorderColor != null) map['idenfyCountryAndDocumentSelectionViewItemSelectionBorderColor'] = idenfyCountryAndDocumentSelectionViewItemSelectionBorderColor!.value;
    if (idenfyCountryAndDocumentSelectionViewItemSelectionBackgroundColor != null) map['idenfyCountryAndDocumentSelectionViewItemSelectionBackgroundColor'] = idenfyCountryAndDocumentSelectionViewItemSelectionBackgroundColor!.value;
    if (idenfyCountryAndDocumentSelectionViewItemSelectionTextColor != null) map['idenfyCountryAndDocumentSelectionViewItemSelectionTextColor'] = idenfyCountryAndDocumentSelectionViewItemSelectionTextColor!.value;
    if (idenfyCountryAndDocumentSelectionViewItemSelectionTrailingIconTintColor != null) map['idenfyCountryAndDocumentSelectionViewItemSelectionTrailingIconTintColor'] = idenfyCountryAndDocumentSelectionViewItemSelectionTrailingIconTintColor!.value;
    if (idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedBorderColor != null) map['idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedBorderColor'] = idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedBorderColor!.value;
    if (idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedBackgroundColor != null) map['idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedBackgroundColor'] = idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedBackgroundColor!.value;
    if (idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedTextColor != null) map['idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedTextColor'] = idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedTextColor!.value;
    if (idenfyCountryAndDocumentSelectionViewContinueButtonDisabledBackgroundColor != null) map['idenfyCountryAndDocumentSelectionViewContinueButtonDisabledBackgroundColor'] = idenfyCountryAndDocumentSelectionViewContinueButtonDisabledBackgroundColor!.value;
    if (idenfyCountryAndDocumentSelectionViewContinueButtonDisabledTextColor != null) map['idenfyCountryAndDocumentSelectionViewContinueButtonDisabledTextColor'] = idenfyCountryAndDocumentSelectionViewContinueButtonDisabledTextColor!.value;
    if (idenfyCountryAndDocumentSelectionViewContinueButtonEnabledTextColor != null) map['idenfyCountryAndDocumentSelectionViewContinueButtonEnabledTextColor'] = idenfyCountryAndDocumentSelectionViewContinueButtonEnabledTextColor!.value;
    if (idenfyCountryAndDocumentSelectionViewContinueButtonLoadingSpinnerTintColor != null) map['idenfyCountryAndDocumentSelectionViewContinueButtonLoadingSpinnerTintColor'] = idenfyCountryAndDocumentSelectionViewContinueButtonLoadingSpinnerTintColor!.value;
    if (idenfyCountryAndDocumentSelectionViewPhysicalDocumentTitleDividerColor != null) map['idenfyCountryAndDocumentSelectionViewPhysicalDocumentTitleDividerColor'] = idenfyCountryAndDocumentSelectionViewPhysicalDocumentTitleDividerColor!.value;
    if (idenfyDocumentCameraPreviewSessionBackgroundColor != null) map['idenfyDocumentCameraPreviewSessionBackgroundColor'] = idenfyDocumentCameraPreviewSessionBackgroundColor!.value;
    if (idenfyDocumentCameraPreviewSessionBottomActionButtonsViewBackgroundColor != null) map['idenfyDocumentCameraPreviewSessionBottomActionButtonsViewBackgroundColor'] = idenfyDocumentCameraPreviewSessionBottomActionButtonsViewBackgroundColor!.value;
    if (idenfyDocumentCameraPreviewSessionTakePhotoButtonUnFocusedTintColor != null) map['idenfyDocumentCameraPreviewSessionTakePhotoButtonUnFocusedTintColor'] = idenfyDocumentCameraPreviewSessionTakePhotoButtonUnFocusedTintColor!.value;
    if (idenfyDocumentCameraPreviewSessionTakePhotoButtonFocusedTintColor != null) map['idenfyDocumentCameraPreviewSessionTakePhotoButtonFocusedTintColor'] = idenfyDocumentCameraPreviewSessionTakePhotoButtonFocusedTintColor!.value;
    if (idenfyDocumentCameraPreviewSessionTakePhotoButtonUnFocusedBackgroundColor != null) map['idenfyDocumentCameraPreviewSessionTakePhotoButtonUnFocusedBackgroundColor'] = idenfyDocumentCameraPreviewSessionTakePhotoButtonUnFocusedBackgroundColor!.value;
    if (idenfyDocumentCameraPreviewSessionTakePhotoButtonFocusedBackgroundColor != null) map['idenfyDocumentCameraPreviewSessionTakePhotoButtonFocusedBackgroundColor'] = idenfyDocumentCameraPreviewSessionTakePhotoButtonFocusedBackgroundColor!.value;
    if (idenfyDocumentCameraPreviewSessionAcceptedDocumentsSelectedCountryHighlightColor != null) map['idenfyDocumentCameraPreviewSessionAcceptedDocumentsSelectedCountryHighlightColor'] = idenfyDocumentCameraPreviewSessionAcceptedDocumentsSelectedCountryHighlightColor!.value;
    if (idenfyDocumentCameraPreviewTitleTextColor != null) map['idenfyDocumentCameraPreviewTitleTextColor'] = idenfyDocumentCameraPreviewTitleTextColor!.value;
    if (idenfyDocumentCameraPreviewDescriptionTextColor != null) map['idenfyDocumentCameraPreviewDescriptionTextColor'] = idenfyDocumentCameraPreviewDescriptionTextColor!.value;
    if (idenfyPrivacyPolicyViewBackgroundColor != null) map['idenfyPrivacyPolicyViewBackgroundColor'] = idenfyPrivacyPolicyViewBackgroundColor!.value;
    if (idenfyPrivacyPolicyCommonInformationTitleTextColor != null) map['idenfyPrivacyPolicyCommonInformationTitleTextColor'] = idenfyPrivacyPolicyCommonInformationTitleTextColor!.value;
    if (idenfyPrivacyPolicyCommonInformationDescriptionTextColor != null) map['idenfyPrivacyPolicyCommonInformationDescriptionTextColor'] = idenfyPrivacyPolicyCommonInformationDescriptionTextColor!.value;
    if (idenfyPrivacyPolicyCardViewTextColor != null) map['idenfyPrivacyPolicyCardViewTextColor'] = idenfyPrivacyPolicyCardViewTextColor!.value;
    if (idenfyPrivacyPolicyCardViewBackgroundColor != null) map['idenfyPrivacyPolicyCardViewBackgroundColor'] = idenfyPrivacyPolicyCardViewBackgroundColor!.value;
    if (idenfyPrivacyPolicyCardViewArrowIconTintColor != null) map['idenfyPrivacyPolicyCardViewArrowIconTintColor'] = idenfyPrivacyPolicyCardViewArrowIconTintColor!.value;
    if (idenfyPrivacyPolicyCardViewIconTintColor != null) map['idenfyPrivacyPolicyCardViewIconTintColor'] = idenfyPrivacyPolicyCardViewIconTintColor!.value;
    if (idenfyPrivacyPolicyContinueButtonTextColor != null) map['idenfyPrivacyPolicyContinueButtonTextColor'] = idenfyPrivacyPolicyContinueButtonTextColor!.value;
    if (idenfyPrivacyPolicyContinueButtonLoadingSpinnerTintColor != null) map['idenfyPrivacyPolicyContinueButtonLoadingSpinnerTintColor'] = idenfyPrivacyPolicyContinueButtonLoadingSpinnerTintColor!.value;
    if (idenfyPartnerPrivacyPolicyDialogViewBackgroundColor != null) map['idenfyPartnerPrivacyPolicyDialogViewBackgroundColor'] = idenfyPartnerPrivacyPolicyDialogViewBackgroundColor!.value;
    if (idenfySplashScreenViewTitleTextColor != null) map['idenfySplashScreenViewTitleTextColor'] = idenfySplashScreenViewTitleTextColor!.value;
    if (idenfySplashScreenViewDescriptionTextColor != null) map['idenfySplashScreenViewDescriptionTextColor'] = idenfySplashScreenViewDescriptionTextColor!.value;
    if (idenfySplashScreenViewLoadingSpinnerTintColor != null) map['idenfySplashScreenViewLoadingSpinnerTintColor'] = idenfySplashScreenViewLoadingSpinnerTintColor!.value;
    if (idenfyBottomSheetBackgroundColor != null) map['idenfyBottomSheetBackgroundColor'] = idenfyBottomSheetBackgroundColor!.value;
    if (idenfyBottomSheetDragHandleColor != null) map['idenfyBottomSheetDragHandleColor'] = idenfyBottomSheetDragHandleColor!.value;
    if (idenfyBottomSheetButtonTextColor != null) map['idenfyBottomSheetButtonTextColor'] = idenfyBottomSheetButtonTextColor!.value;
    if (idenfyBottomSheetTitleTextColor != null) map['idenfyBottomSheetTitleTextColor'] = idenfyBottomSheetTitleTextColor!.value;
    if (idenfyBottomSheetDateTimePickerAccentColor != null) map['idenfyBottomSheetDateTimePickerAccentColor'] = idenfyBottomSheetDateTimePickerAccentColor!.value;
    if (idenfyBottomSheetDateTimePickerActivatedColor != null) map['idenfyBottomSheetDateTimePickerActivatedColor'] = idenfyBottomSheetDateTimePickerActivatedColor!.value;
    if (idenfyBottomSheetDateTimePickerHighlightColor != null) map['idenfyBottomSheetDateTimePickerHighlightColor'] = idenfyBottomSheetDateTimePickerHighlightColor!.value;
    if (idenfyCustomAlertDialogNegativeButtonColor != null) map['idenfyCustomAlertDialogNegativeButtonColor'] = idenfyCustomAlertDialogNegativeButtonColor!.value;
    if (idenfyCustomAlertDialogBackgroundColor != null) map['idenfyCustomAlertDialogBackgroundColor'] = idenfyCustomAlertDialogBackgroundColor!.value;
    if (idenfyDefaultAlertDialogBackgroundColor != null) map['idenfyDefaultAlertDialogBackgroundColor'] = idenfyDefaultAlertDialogBackgroundColor!.value;
    if (idenfyDefaultAlertDialogTitleColor != null) map['idenfyDefaultAlertDialogTitleColor'] = idenfyDefaultAlertDialogTitleColor!.value;
    if (idenfyDefaultAlertDialogMessageColor != null) map['idenfyDefaultAlertDialogMessageColor'] = idenfyDefaultAlertDialogMessageColor!.value;
    if (idenfyDefaultAlertDialogPositiveButtonColor != null) map['idenfyDefaultAlertDialogPositiveButtonColor'] = idenfyDefaultAlertDialogPositiveButtonColor!.value;
    if (idenfyDefaultAlertDialogNegativeButtonColor != null) map['idenfyDefaultAlertDialogNegativeButtonColor'] = idenfyDefaultAlertDialogNegativeButtonColor!.value;
    if (idenfyEIDSessionViewBackgroundColor != null) map['idenfyEIDSessionViewBackgroundColor'] = idenfyEIDSessionViewBackgroundColor!.value;
    if (idenfyEIDSessionViewTitleTextColor != null) map['idenfyEIDSessionViewTitleTextColor'] = idenfyEIDSessionViewTitleTextColor!.value;
    if (idenfyEIDSessionViewDescriptionTextColor != null) map['idenfyEIDSessionViewDescriptionTextColor'] = idenfyEIDSessionViewDescriptionTextColor!.value;
    if (idenfyEIDSessionViewButtonTextColor != null) map['idenfyEIDSessionViewButtonTextColor'] = idenfyEIDSessionViewButtonTextColor!.value;
    if (idenfyEIDSessionViewButtonLoadingSpinnerTintColor != null) map['idenfyEIDSessionViewButtonLoadingSpinnerTintColor'] = idenfyEIDSessionViewButtonLoadingSpinnerTintColor!.value;
    if (idenfyEIDSessionViewCodeInputEditTextTitleColor != null) map['idenfyEIDSessionViewCodeInputEditTextTitleColor'] = idenfyEIDSessionViewCodeInputEditTextTitleColor!.value;
    if (idenfyEIDSessionViewCodeInputEditTextHintColor != null) map['idenfyEIDSessionViewCodeInputEditTextHintColor'] = idenfyEIDSessionViewCodeInputEditTextHintColor!.value;
    if (idenfyEIDSessionViewCodeInputFieldErrorMessageTextColor != null) map['idenfyEIDSessionViewCodeInputFieldErrorMessageTextColor'] = idenfyEIDSessionViewCodeInputFieldErrorMessageTextColor!.value;
    if (idenfyEIDSessionViewCodeInputFailedContainerBorderColor != null) map['idenfyEIDSessionViewCodeInputFailedContainerBorderColor'] = idenfyEIDSessionViewCodeInputFailedContainerBorderColor!.value;
    if (idenfyEIDSessionViewCodeInputFailedContainerBackgroundColor != null) map['idenfyEIDSessionViewCodeInputFailedContainerBackgroundColor'] = idenfyEIDSessionViewCodeInputFailedContainerBackgroundColor!.value;
    if (idenfyEIDSessionViewCodeStatusTitleTextColor != null) map['idenfyEIDSessionViewCodeStatusTitleTextColor'] = idenfyEIDSessionViewCodeStatusTitleTextColor!.value;
    if (idenfyEIDSessionViewCodeFailedStatusImageTintColor != null) map['idenfyEIDSessionViewCodeFailedStatusImageTintColor'] = idenfyEIDSessionViewCodeFailedStatusImageTintColor!.value;
    if (idenfyEIDSessionViewCodeHintTextColor != null) map['idenfyEIDSessionViewCodeHintTextColor'] = idenfyEIDSessionViewCodeHintTextColor!.value;
    if (idenfyEIDSessionViewContinueButtonEnabledTextColor != null) map['idenfyEIDSessionViewContinueButtonEnabledTextColor'] = idenfyEIDSessionViewContinueButtonEnabledTextColor!.value;
    if (idenfyEIDSessionViewContinueButtonDisabledTextColor != null) map['idenfyEIDSessionViewContinueButtonDisabledTextColor'] = idenfyEIDSessionViewContinueButtonDisabledTextColor!.value;
    if (idenfyEIDSessionViewContinueButtonDisabledBackgroundColor != null) map['idenfyEIDSessionViewContinueButtonDisabledBackgroundColor'] = idenfyEIDSessionViewContinueButtonDisabledBackgroundColor!.value;
    if (idenfyEIDSessionViewUploadIconTintColor != null) map['idenfyEIDSessionViewUploadIconTintColor'] = idenfyEIDSessionViewUploadIconTintColor!.value;
    if (idenfyEIDSessionViewClickToUploadTextColor != null) map['idenfyEIDSessionViewClickToUploadTextColor'] = idenfyEIDSessionViewClickToUploadTextColor!.value;
    if (idenfyEIDSessionViewInputFieldBorderColor != null) map['idenfyEIDSessionViewInputFieldBorderColor'] = idenfyEIDSessionViewInputFieldBorderColor!.value;
    if (idenfyEIDSessionViewInputFieldBackgroundColor != null) map['idenfyEIDSessionViewInputFieldBackgroundColor'] = idenfyEIDSessionViewInputFieldBackgroundColor!.value;
    return map;
  }
}

