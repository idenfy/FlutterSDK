import UIKit
import iDenfySDK
import idenfycore
import idenfyviews

extension UIColor {
    convenience init(argb: Int) {
        let a = CGFloat((argb >> 24) & 0xFF) / 255.0
        let r = CGFloat((argb >> 16) & 0xFF) / 255.0
        let g = CGFloat((argb >> 8) & 0xFF) / 255.0
        let b = CGFloat(argb & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}

class IdenfySettingsDecoder {

    @MainActor
    static func decodeIdenfySettings(_ json: [String: AnyObject?]?, _ authToken: String) -> IdenfySettingsV2 {
        var idenfySettings = IdenfyBuilderV2()

        if let unwrappedSslPinning = json?["sslPinning"] as? Bool {
            idenfySettings = idenfySettings.withSSLPinning(unwrappedSslPinning)
        }
        if let unwrappedSelectedLocale = json?["selectedLocale"] as? String {
            if let forcedLocale = IdenfyLocaleEnum(rawValue: unwrappedSelectedLocale.lowercased()) {
                idenfySettings = idenfySettings.withSelectedLocale(forcedLocale)
            }
        }

        if let uiSettingsMap = json?["idenfyUISettings"] as? [String: Any?] {
            var idenfyUISettingsV2 = IdenfyUIBuilderV2()
            if let isAdditionalSupportEnabled = uiSettingsMap["isAdditionalSupportEnabled"] as? Bool {
                idenfyUISettingsV2 = idenfyUISettingsV2.withAdditionalSupportView(isAdditionalSupportEnabled)
            }

            if let documentSelectionType = uiSettingsMap["idenfyDocumentSelectionType"] as? String {
                if documentSelectionType == "navigateOnContinueButton" {
                    idenfyUISettingsV2.idenfyDocumentSelectionType = IdenfyDocumentSelectionTypeEnum.navigateOnContinueButton
                }
                if documentSelectionType == "navigateOnItemSelection" {
                    idenfyUISettingsV2.idenfyDocumentSelectionType = IdenfyDocumentSelectionTypeEnum.navigateOnTableViewSelection
                }
            }

            if let onBoardingViewType = uiSettingsMap["idenfyOnBoardingViewType"] as? String {
                switch onBoardingViewType {
                case "multipleStatic":
                    idenfyUISettingsV2 = idenfyUISettingsV2.withOnBoadringViewType(.multipleStatic)
                case "none":
                    idenfyUISettingsV2 = idenfyUISettingsV2.withOnBoadringViewType(.none)
                default:
                    break
                }
            }

            if let isLanguageSelectionNeeded = uiSettingsMap["isLanguageSelectionNeeded"] as? Bool {
                idenfyUISettingsV2.isLanguageSelectionNeeded = isLanguageSelectionNeeded
            }

            if let instructionsEnum = uiSettingsMap["idenfyInstructionsEnum"] as? String {
                if let enumValue = ["dialog": 0, "none": 1][instructionsEnum] {
                    if let forcedEnum = IdenfyInstructionsEnum(rawValue: enumValue) {
                        idenfyUISettingsV2 = idenfyUISettingsV2.withInstructions(forcedEnum)
                    }
                }
            }

            if let resultsUISettingsMap = uiSettingsMap["idenfyIdentificationResultsUISettingsV2"] as? [String: Any] {
                let idenfyIdentificationResultsUISettingsV2 = IdenfyIdentificationResultsUISettingsV2()

                if let isShowErrorSpinnerImmediateRedirect = resultsUISettingsMap["isShowErrorSpinnerImmediateRedirect"] as? Bool {
                    idenfyIdentificationResultsUISettingsV2.isShowErrorSpinnerImmediateRedirect = isShowErrorSpinnerImmediateRedirect
                }

                if let isAdditionalUploadingInformationVisible = resultsUISettingsMap["isAdditionalUploadingInformationVisible"] as? Bool {
                    idenfyIdentificationResultsUISettingsV2.isAdditionalUploadingInformationVisible = isAdditionalUploadingInformationVisible
                }

                if let isShowSuccessSpinnerImmediateRedirect = resultsUISettingsMap["isShowSuccessSpinnerImmediateRedirect"] as? Bool {
                    idenfyIdentificationResultsUISettingsV2.isShowSuccessSpinnerImmediateRedirect = isShowSuccessSpinnerImmediateRedirect
                }

                idenfyUISettingsV2.idenfyIdentificationResultsUISettingsV2 = idenfyIdentificationResultsUISettingsV2
            }

            if let immediateRedirectEnum = uiSettingsMap["immediateRedirectEnum"] as? String {
                if let enumValue = ["none": 0, "partial": 1, "full": 2][immediateRedirectEnum] {
                    if let forcedEnum = ImmediateRedirectEnum(rawValue: enumValue) {
                        idenfyUISettingsV2 = idenfyUISettingsV2.withImmediateRedirect(forcedEnum)
                    }
                }
            }

            if let mismatchTagsAlert = uiSettingsMap["mismatchTagsAlert"] as? Bool {
                idenfyUISettingsV2.mismatchTagsAlert = mismatchTagsAlert
            }

            if let withCountryAndDocumentSelectionJoined = uiSettingsMap["withCountryAndDocumentSelectionJoined"] as? Bool {
                idenfyUISettingsV2.withCountryAndDocumentSelectionJoined = withCountryAndDocumentSelectionJoined
            }

            if let useBottomSheetDialogs = uiSettingsMap["useBottomSheetDialogs"] as? Bool {
                idenfyUISettingsV2 = idenfyUISettingsV2.withBottomSheetDialogs(useBottomSheetDialogs)
            }

            if let documentFrameVisibility = uiSettingsMap["documentCameraFrameVisibility"] as? [String: Any],
               let visibilityValue = documentFrameVisibility["value"] as? String {

                if visibilityValue == "HiddenForAllCountriesAndDocumentTypes" {
                    idenfyUISettingsV2.documentCameraFrameVisibility = .hiddenForAllCountriesAndDocumentTypes
                } else if visibilityValue == "HiddenForSpecificCountriesAndDocumentTypes",
                          let countriesAndDocuments = documentFrameVisibility["countriesAndDocuments"] as? [String: [String]] {
                    var mappedDocuments: [String: [DocumentTypeEnum]] = [:]

                    for (key, value) in countriesAndDocuments {
                        let updatedList = value.compactMap { DocumentTypeEnum(rawValue: $0) }
                        mappedDocuments[key] = updatedList
                    }

                    idenfyUISettingsV2.documentCameraFrameVisibility = .hiddenForSpecificCountriesAndDocumentTypes(countryDocumentMap: mappedDocuments)
                }
            }
            if let colorSchemeMap = uiSettingsMap["idenfyColorScheme"] as? [String: Any] {
                IdenfySettingsDecoder.decodeColorScheme(colorSchemeMap)
            }

            idenfySettings = idenfySettings.withUISettingsV2(idenfyUISettingsV2.build())
        }
        return idenfySettings.withAuthToken(authToken).build()
    }

    @MainActor
    static func decodeFaceAuthUISettings(_ json: [String: AnyObject?]?) -> IdenfyFaceAuthUISettings {
        let faceAuthUISettings = IdenfyFaceAuthUISettings()
        if let unwrappedLanguageSelectionNeeded = json?["isLanguageSelectionNeeded"] as? Bool {
            faceAuthUISettings.isLanguageSelectionNeeded = unwrappedLanguageSelectionNeeded
        }
        if let unwrappedSkipOnBoardingView = json?["skipOnBoardingView"] as? Bool {
            faceAuthUISettings.skipOnBoardingView = unwrappedSkipOnBoardingView
        }
        if let colorSchemeMap = json?["idenfyColorScheme"] as? [String: Any] {
            IdenfySettingsDecoder.decodeColorScheme(colorSchemeMap)
        }
        return faceAuthUISettings
    }

    @MainActor
    static func decodeColorScheme(_ map: [String: Any]?) {
        guard let map = map, !map.isEmpty else { return }

        // Base Colors -> IdenfyCommonColors
        if let value = map["idenfyBackgroundColorV2"] as? Int {
            IdenfyCommonColors.idenfyBackgroundColorV2 = UIColor(argb: value)
        }
        if let value = map["idenfyMainColorV2"] as? Int {
            IdenfyCommonColors.idenfyMainColorV2 = UIColor(argb: value)
        }
        if let value = map["idenfyMainDarkerColorV2"] as? Int {
            IdenfyCommonColors.idenfyMainDarkerColorV2 = UIColor(argb: value)
        }
        if let value = map["idenfySecondColorV2"] as? Int {
            IdenfyCommonColors.idenfySecondColorV2 = UIColor(argb: value)
        }
        if let value = map["idenfyWhite"] as? Int {
            IdenfyCommonColors.idenfyWhite = UIColor(argb: value)
        }
        if let value = map["idenfyBlack"] as? Int {
            IdenfyCommonColors.idenfyBlack = UIColor(argb: value)
        }
        if let value = map["idenfyBlackV2"] as? Int {
            IdenfyCommonColors.idenfyBlackV2 = UIColor(argb: value)
        }
        if let value = map["idenfyPhotoResultDetailsCardBackgroundColorV2"] as? Int {
            IdenfyCommonColors.idenfyPhotoResultDetailsCardBackgroundColorV2 = UIColor(argb: value)
        }
        if let value = map["idenfyStepSuccessColorV2"] as? Int {
            IdenfyCommonColors.idenfyStepSuccessColorV2 = UIColor(argb: value)
        }
        if let value = map["idenfyStepErrorColorV2"] as? Int {
            IdenfyCommonColors.idenfyStepErrorColorV2 = UIColor(argb: value)
        }
        if let value = map["idenfyRedColorV2"] as? Int {
            IdenfyCommonColors.idenfyRedColorV2 = UIColor(argb: value)
        }
        if let value = map["idenfyErrorRedColorV2"] as? Int {
            IdenfyCommonColors.idenfyDarkRedErrorColorV2 = UIColor(argb: value)
        }
        if let value = map["idenfyErrorLightRedColorV2"] as? Int {
            IdenfyCommonColors.idenfyErrorLightRedColorV2 = UIColor(argb: value)
        }
        if let value = map["idenfyGreenColorV2"] as? Int {
            IdenfyCommonColors.idenfyFaceDetectedColor = UIColor(argb: value)
        }
        if let value = map["idenfyGrayColorV2"] as? Int {
            IdenfyCommonColors.idenfyFaceNotDetectedColor = UIColor(argb: value)
        }
        if let value = map["idenfyWarningYellowV2"] as? Int {
            IdenfyCommonColors.idenfyWarningYellowV2 = UIColor(argb: value)
        }
        if let value = map["idenfyWarningLightYellowV2"] as? Int {
            IdenfyCommonColors.idenfyWarningLightYellowV2 = UIColor(argb: value)
        }
        if let value = map["idenfyBackgroundGreenV2"] as? Int {
            IdenfyCommonColors.idenfyBackgroundGreenV2 = UIColor(argb: value)
        }
        if let value = map["idenfyBorderGreenV2"] as? Int {
            IdenfyCommonColors.idenfyBorderGreenV2 = UIColor(argb: value)
        }
        if let value = map["idenfyPurpleColor"] as? Int {
            IdenfyCommonColors.idenfyPurpleV2 = UIColor(argb: value)
        }
        if let value = map["idenfyPurpleTextColor"] as? Int {
            IdenfyCommonColors.idenfyPurpleTextV2 = UIColor(argb: value)
        }
        if let value = map["idenfyPurpleBackgroundColor"] as? Int {
            IdenfyCommonColors.idenfyBackgroundPurpleV2 = UIColor(argb: value)
        }
        if let value = map["idenfyLightBlueColor"] as? Int {
            IdenfyCommonColors.idenfyLightBlueColor = UIColor(argb: value)
        }
        if let value = map["idenfyBlueColor"] as? Int {
            IdenfyCommonColors.idenfyBlueColor = UIColor(argb: value)
        }
        if let value = map["idenfyLightGrayColor"] as? Int {
            IdenfyCommonColors.idenfyLightGrayColor = UIColor(argb: value)
        }

        // Gradient Buttons -> IdenfyButtonsUISettingsV2
        if let value = map["idenfyGradientButtonColorStart"] as? Int {
            IdenfyButtonsUISettingsV2.idenfyGradientButtonColorStart = UIColor(argb: value)
        }
        if let value = map["idenfyGradientButtonColorEnd"] as? Int {
            IdenfyButtonsUISettingsV2.idenfyGradientButtonColorEnd = UIColor(argb: value)
        }

        // Toolbar -> IdenfyToolbarUISettingsV2
        if let value = map["idenfyDefaultAppBarBackgroundColor"] as? Int {
            IdenfyToolbarUISettingsV2.idenfyDefaultToolbarBackgroundColor = UIColor(argb: value)
        }
        if let value = map["idenfyDefaultAppBarIconTintColor"] as? Int {
            let color = UIColor(argb: value)
            IdenfyToolbarUISettingsV2.idenfyDefaultToolbarBackIconTintColor = color
            IdenfyToolbarUISettingsV2.idenfyCameraPreviewSessionToolbarBackIconTintColor = color
        }
        IdenfyToolbarUISettingsV2.idenfyDefaultToolbarLogoIconTintColor = nil
        if let value = map["idenfyLanguageSelectionToolbarLanguageSelectionIconTintColor"] as? Int {
            IdenfyToolbarUISettingsV2.idenfyLanguageSelectionToolbarLanguageSelectionIconTintColor = UIColor(argb: value)
        }
        if let value = map["idenfyLanguageSelectionToolbarCloseIconTintColor"] as? Int {
            IdenfyToolbarUISettingsV2.idenfyLanguageSelectionToolbarCloseIconTintColor = UIColor(argb: value)
        }
        if let value = map["idenfyCameraPreviewSessionAppBarBackButtonTintColor"] as? Int {
            IdenfyToolbarUISettingsV2.idenfyCameraPreviewSessionToolbarBackIconTintColor = UIColor(argb: value)
        }

        // Document Camera -> IdenfyDocumentCameraSessionUISettingsV2
        if let value = map["idenfyDocumentCameraPreviewSessionTakePhotoButtonUnFocusedTintColor"] as? Int {
            IdenfyDocumentCameraSessionUISettingsV2.idenfyDocumentCameraPreviewSessionTakePhotoButtonUnFocusedTintColor = UIColor(argb: value)
        }
        if let value = map["idenfyDocumentCameraPreviewSessionTakePhotoButtonFocusedTintColor"] as? Int {
            IdenfyDocumentCameraSessionUISettingsV2.idenfyDocumentCameraPreviewSessionTakePhotoButtonFocusedTintColor = UIColor(argb: value)
        }
        if let value = map["idenfyDocumentCameraPreviewSessionTakePhotoButtonUnFocusedBackgroundColor"] as? Int {
            IdenfyDocumentCameraSessionUISettingsV2.idenfyDocumentCameraPreviewSessionTakePhotoButtonUnFocusedBackgroundColor = UIColor(argb: value)
        }
        if let value = map["idenfyDocumentCameraPreviewSessionTakePhotoButtonFocusedBackgroundColor"] as? Int {
            IdenfyDocumentCameraSessionUISettingsV2.idenfyDocumentCameraPreviewSessionTakePhotoButtonFocusedBackgroundColor = UIColor(argb: value)
        }

        // Face Camera -> IdenfyFaceCameraSessionUISettingsV2
        if let value = map["idenfyFaceCameraPreviewSessionTakePhotoButtonFocusedTintColor"] as? Int {
            IdenfyFaceCameraSessionUISettingsV2.idenfyFaceCameraPreviewSessionTakePhotoButtonFocusedTintColor = UIColor(argb: value)
        }
        if let value = map["idenfyFaceCameraPreviewSessionTakePhotoButtonUnFocusedBackgroundColor"] as? Int {
            IdenfyFaceCameraSessionUISettingsV2.idenfyFaceCameraPreviewSessionTakePhotoButtonUnFocusedBackgroundColor = UIColor(argb: value)
        }
        if let value = map["idenfyFaceCameraPreviewSessionFaceOvalColor"] as? Int {
            IdenfyFaceCameraSessionUISettingsV2.idenfyFaceCameraPreviewSessionFaceOvalColor = UIColor(argb: value)
        }

        // Photo Result -> IdenfyPhotoResultViewUISettingsV2
        if let value = map["idenfyDocumentPhotoResultViewRetakePhotoButtonTextColor"] as? Int {
            IdenfyPhotoResultViewUISettingsV2.idenfyPhotoResultViewRetakePhotoButtonTextColor = UIColor(argb: value)
        }
        if let value = map["idenfyDocumentPhotoResultViewNextButtonTextColor"] as? Int {
            IdenfyPhotoResultViewUISettingsV2.idenfyPhotoResultViewContinueButtonTextColor = UIColor(argb: value)
        }
        // Shared continue button text color
        if let value = map["idenfyContinueButtonTextColor"] as? Int {
            let color = UIColor(argb: value)
            IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewContinueButtonEnabledTextColor = color
            IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewContinueButtonDisabledTextColor = color
            IdenfyCountryAndDocumentSelectionViewUISettingsV2.idenfyCountryAndDocumentSelectionViewContinueButtonEnabledTextColor = color
            IdenfyCountryAndDocumentSelectionViewUISettingsV2.idenfyCountryAndDocumentSelectionViewContinueButtonDisabledTextColor = color
            IdenfyStaticCameraOnBoardingViewUISettingsV2.idenfyCameraOnBoardingEnabledContinueButtonTextColor = color
            IdenfyStaticCameraOnBoardingViewUISettingsV2.idenfyCameraOnBoardingDisabledContinueButtonTextColor = color
            IdenfyPrivacyPolicyViewUISettingsV2.idenfyPrivacyPolicyAgreeButtonTextColor = color
            IdenfyPhotoResultViewUISettingsV2.idenfyPhotoResultViewContinueButtonTextColor = color
            IdenfyPdfResultViewUISettingsV2.idenfyPdfResultViewContinueButtonTextColor = color
            IdenfyIdentificationResultsViewUISettingsV2.idenfyIdentificationResultsViewRetakeButtonTextColor = color
            IdenfyIdentificationSuspectedResultsViewUISettingsV2.idenfyIdentificationSuspectedResultsViewContinueButtonTextColor = color
            IdenfyFaceAuthenticationResultsViewUISettingsV2.idenfyFaceAuthenticationResultsViewContinueButtonTextColor = color
            IdenfyFaceAuthenticationInitialViewUISettingsV2.idenfyFaceAuthenticationInitialViewContinueButtonTextColor = color
            IdenfyManualReviewingStatusApprovedViewUISettingsV2.idenfyManualReviewingStatusApprovedContinueButtonTextColor = color
            IdenfyManualReviewingStatusFailedViewUISettingsV2.idenfyManualReviewingStatusFailedContinueButtonTextColor = color
            IdenfyNFCRequiredViewUISettingsV2.idenfyNFCRequiredContinueButtonTextColor = color
            IdenfyNFCReadingTimeOutViewUISettingsV2.idenfyNFCReadingTimeOutContinueButtonTextColor = color
            IdenfyNFCReadingViewUISettingsV2.idenfyNFCReadingContinueButtonTextColor = color
            IdenfyAdditionalSupportViewUISettingsV2.idenfyAdditionalSupportViewContinueButtonTextColor = color
            IdenfyIssuedCountryViewUISettingsV2.idenfyIssuedCountryViewBeginIdentificationButtonTextColor = color
            IdenfyProviderLoginViewUISettingsV2.idenfyProviderLoginViewContinueButtonTextColor = color
            IdenfyMFAGeneralViewUISettingsV2.idenfyMFAGeneralViewContinueButtonTextColor = color
            IdenfyMFACaptchaViewUISettingsV2.idenfyMFACaptchaViewContinueButtonTextColor = color
            IdenfyMFAMethodSelectionViewUISettingsV2.idenfyMFAMethodSelectionViewContinueButtonTextColor = color
            IdenfyInstructionAlertUISettigsV2.idenfyInstructionAlertContinueButtonTextColor = color
            IdenfyDocNotFoundAlertUISettigsV2.idenfyDocNotFoundAlertContinueButtonTextColor = color
            IdenfyMrzNotFoundAlertUISettigsV2.idenfyMrzNotFoundAlertContinueButtonTextColor = color
            IdenfyMismatchFoundAlertUISettigsV2.idenfyMismatchFoundAlertContinueButtonTextColor = color
            IdenfyBankVerificationViewUISettingsV2.idenfyBankVerificationViewContinueButtonEnabledTextColor = color
            IdenfyBankVerificationViewUISettingsV2.idenfyBankVerificationViewContinueButtonDisabledTextColor = color
            IdenfyEmailSMSVerificationViewUISettingsV2.idenfyEmailSMSVerificationViewContinueButtonEnabledTextColor = color
            IdenfyEmailSMSVerificationViewUISettingsV2.idenfyEmailSMSVerificationViewContinueButtonDisabledTextColor = color
            IdenfyQuestionnaireViewUISettingsV2.idenfyQuestionnaireViewContinueButtonEnabledTextColor = color
            IdenfyQuestionnaireViewUISettingsV2.idenfyQuestionnaireViewContinueButtonDisabledTextColor = color
            EIDSessionViewUISettingsV2.idenfyEIDSessionViewContinueButtonTextColor = color
            EIDSessionCodeVerificationViewUISettingsV2.idenfyEIDSessionCodeVerificationViewContinueButtonEnabledTextColor = color
            EIDSessionCodeVerificationViewUISettingsV2.idenfyEIDSessionCodeVerificationViewContinueButtonDisabledTextColor = color
            EIDSessionUploadViewUISettingsV2.idenfyEIDSessionUploadViewContinueButtonEnabledTextColor = color
            EIDSessionUploadViewUISettingsV2.idenfyEIDSessionUploadViewContinueButtonDisabledTextColor = color
            EIDSessionMultipleInputViewUISettingsV2.idenfyEIDSessionMultipleInputViewContinueButtonEnabledTextColor = color
            EIDSessionMultipleInputViewUISettingsV2.idenfyEIDSessionMultipleInputViewContinueButtonDisabledTextColor = color
            EIDSessionCNHUploadViewUISettingsV2.idenfyEIDSessionCNHUploadViewContinueButtonEnabledTextColor = color
            EIDSessionCNHUploadViewUISettingsV2.idenfyEIDSessionCNHUploadViewContinueButtonDisabledTextColor = color
            IdenfyUploadPhotoViewUISettingsV2.idenfyUploadPhotoViewContinuePhotoButtonTextColor = color
        }

        // Shared retake button text color
        if let value = map["idenfyRetakeButtonTextColor"] as? Int {
            let color = UIColor(argb: value)
            IdenfyPhotoResultViewUISettingsV2.idenfyPhotoResultViewRetakePhotoButtonTextColor = color
            IdenfyUploadPhotoViewUISettingsV2.idenfyUploadPhotoViewChooseAnotherPhotoButtonTextColor = color
            IdenfyMrzNotFoundAlertUISettigsV2.idenfyMrzNotFoundAlertRetakePhotoButtonTextColor = color
        }

        // Shared continue button spinner color
        if let value = map["idenfyContinueButtonSpinnerColor"] as? Int {
            let color = UIColor(argb: value)
            IdenfyPrivacyPolicyViewUISettingsV2.idenfyPrivacyPolicyAgreeButtonLoadingSpinnerTintColor = color
            IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewContinueButtonLoadingSpinnerTintColor = color
            IdenfyBankVerificationViewUISettingsV2.idenfyBankVerificationViewContinueButtonLoadingSpinnerTintColor = color
            IdenfyEmailSMSVerificationViewUISettingsV2.idenfyEmailSMSVerificationViewContinueButtonLoadingSpinnerTintColor = color
            IdenfyQuestionnaireViewUISettingsV2.idenfyQuestionnaireViewContinueButtonLoadingSpinnerTintColor = color
            IdenfyMFACaptchaViewUISettingsV2.idenfyMFACaptchaViewContinueButtonLoadingSpinnerTintColor = color
            IdenfyMFAGeneralViewUISettingsV2.idenfyMFAGeneralViewContinueButtonLoadingSpinnerTintColor = color
            IdenfyMFAMethodSelectionViewUISettingsV2.idenfyMFAMethodSelectionViewContinueButtonLoadingSpinnerTintColor = color
            IdenfyProviderLoginViewUISettingsV2.idenfyProviderLoginViewContinueButtonLoadingSpinnerTintColor = color
            IdenfyProviderSelectionViewUISettingsV2.idenfyProviderSelectionViewContinueButtonLoadingSpinnerTintColor = color
            EIDSessionCodeVerificationViewUISettingsV2.idenfyEIDSessionCodeVerificationViewContinueButtonLoadingSpinnerTintColor = color
            EIDSessionUploadViewUISettingsV2.idenfyEIDSessionUploadViewContinueButtonLoadingSpinnerTintColor = color
            EIDSessionMultipleInputViewUISettingsV2.idenfyEIDSessionMultipleInputViewContinueButtonLoadingSpinnerTintColor = color
            EIDSessionCNHUploadViewUISettingsV2.idenfyEIDSessionCNHUploadViewContinueButtonLoadingSpinnerTintColor = color
            IdenfyCountryAndDocumentSelectionViewUISettingsV2.idenfyCountryAndDocumentSelectionViewCountryLoadingSpinnerTintColor = color
            IdenfyCountrySelectionViewUISettingsV2.idenfyCountrySelectionViewCountryLoadingSpinnerTintColor = color
        }

        if let value = map["idenfyPhotoResultCardTitleColor"] as? Int {
            let color = UIColor(argb: value)
            IdenfyPhotoResultViewUISettingsV2.idenfyPhotoResultViewDetailsCardTitleColor = color
            IdenfyInstructionAlertUISettigsV2.idenfyInstructionAlertDetailsCardTitleColor = color
        }
        if let value = map["idenfyRetakeButtonBorderColor"] as? Int {
            IdenfyPhotoResultViewUISettingsV2.idenfyPhotoResultViewRetakePhotoButtonBorderColor = UIColor(argb: value)
            IdenfyUploadPhotoViewUISettingsV2.idenfyUploadPhotoViewChooseAnotherPhotoButtonBorderColor = UIColor(argb: value)
        }

        // Email/SMS Verification hint card
        if let value = map["idenfyEmailSMSVerificationViewVerifyEmailSMSContainerBorderColor"] as? Int {
            IdenfyEmailSMSVerificationViewUISettingsV2.idenfyEmailSMSVerificationViewEmailPhoneInputInformationCardBorderColor = UIColor(argb: value)
        }
        if let value = map["idenfyEmailSMSVerificationViewVerifyEmailSMSContainerBackgroundColor"] as? Int {
            IdenfyEmailSMSVerificationViewUISettingsV2.idenfyEmailSMSVerificationViewEmailPhoneInputInformationCardBackgroundColor = UIColor(argb: value)
        }
        if let value = map["idenfyEmailSMSVerificationViewVerifyEmailSMSContainerImageTintColor"] as? Int {
            IdenfyEmailSMSVerificationViewUISettingsV2.idenfyEmailSMSVerificationViewEmailPhoneInputInformationCardIconTintColor = UIColor(argb: value)
        }

        // Privacy Policy -> IdenfyPrivacyPolicyViewUISettingsV2
        if let value = map["idenfyPrivacyPolicyCardViewIconTintColor"] as? Int {
            IdenfyPrivacyPolicyViewUISettingsV2.idenfyPrivacyPolicyCardItemIconColor = UIColor(argb: value)
        }
        if let value = map["idenfyPrivacyPolicyContinueButtonTextColor"] as? Int {
            IdenfyPrivacyPolicyViewUISettingsV2.idenfyPrivacyPolicyAgreeButtonTextColor = UIColor(argb: value)
        }
        if let value = map["idenfyPrivacyPolicyCardViewBackgroundColor"] as? Int {
            IdenfyPrivacyPolicyViewUISettingsV2.idenfyPrivacyPolicyCardBackgroundColor = UIColor(argb: value)
        }

        // Document Selection -> IdenfyDocumentSelectionViewUISettingsV2
        if let value = map["idenfyDocumentSelectionViewContinueButtonEnabledTextColor"] as? Int {
            IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewContinueButtonEnabledTextColor = UIColor(argb: value)
        }
        if let value = map["idenfyDocumentSelectionViewContinueButtonDisabledTextColor"] as? Int {
            IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewContinueButtonDisabledTextColor = UIColor(argb: value)
        }

        // Country & Document Selection -> IdenfyCountryAndDocumentSelectionViewUISettingsV2
        if let value = map["idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedBackgroundColor"] as? Int {
            IdenfyCountryAndDocumentSelectionViewUISettingsV2.idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedBackgroundColor = UIColor(argb: value)
        }
        if let value = map["idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedBorderColor"] as? Int {
            IdenfyCountryAndDocumentSelectionViewUISettingsV2.idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedBorderColor = UIColor(argb: value)
        }
        if let value = map["idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedTextColor"] as? Int {
            IdenfyCountryAndDocumentSelectionViewUISettingsV2.idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedTextColor = UIColor(argb: value)
        }
        if let value = map["idenfyCountryAndDocumentSelectionViewContinueButtonEnabledTextColor"] as? Int {
            IdenfyCountryAndDocumentSelectionViewUISettingsV2.idenfyCountryAndDocumentSelectionViewContinueButtonEnabledTextColor = UIColor(argb: value)
        }
        if let value = map["idenfyCountryAndDocumentSelectionViewContinueButtonDisabledTextColor"] as? Int {
            IdenfyCountryAndDocumentSelectionViewUISettingsV2.idenfyCountryAndDocumentSelectionViewContinueButtonDisabledTextColor = UIColor(argb: value)
        }

        // Onboarding -> IdenfyStaticCameraOnBoardingViewUISettingsV2
        if let value = map["idenfyCameraStaticOnBoardingViewEnabledButtonTitleColor"] as? Int {
            IdenfyStaticCameraOnBoardingViewUISettingsV2.idenfyCameraOnBoardingEnabledContinueButtonTextColor = UIColor(argb: value)
        }
        if let value = map["idenfyCameraStaticOnBoardingViewDisabledButtonTitleColor"] as? Int {
            IdenfyStaticCameraOnBoardingViewUISettingsV2.idenfyCameraOnBoardingDisabledContinueButtonTextColor = UIColor(argb: value)
        }

        // Identification Results -> IdenfyIdentificationResultsViewUISettingsV2
        if let value = map["idenfyIdentificationResultsViewRetakeButtonTextColor"] as? Int {
            IdenfyIdentificationResultsViewUISettingsV2.idenfyIdentificationResultsViewRetakeButtonTextColor = UIColor(argb: value)
        }
        if let value = map["idenfyIdentificationResultsViewSuccessStepTextColor"] as? Int {
            IdenfyIdentificationResultsViewUISettingsV2.idenfyIdentificationResultsViewSuccessStepTextColor = UIColor(argb: value)
        }
        if let value = map["idenfyIdentificationResultsViewErrorStepTextColorV2"] as? Int {
            IdenfyIdentificationResultsViewUISettingsV2.idenfyIdentificationResultsViewErrorStepTextColorV2 = UIColor(argb: value)
        }
        if let value = map["idenfyIdentificationResultsViewDocumentStepLoadingSpinnerAccentColor"] as? Int {
            IdenfyIdentificationResultsViewUISettingsV2.idenfyIdentificationResultsViewDocumentStepLoadingSpinnerAccentColor = UIColor(argb: value)
        }

        // Splash Screen -> IdenfySplashScreenViewUISettingsV2
        if let value = map["idenfySplashScreenViewTitleTextColor"] as? Int {
            IdenfySplashScreenViewUISettingsV2.idenfySplashScreenViewTitleTextColor = UIColor(argb: value)
        }
        if let value = map["idenfySplashScreenViewDescriptionTextColor"] as? Int {
            IdenfySplashScreenViewUISettingsV2.idenfySplashScreenViewDescriptionTextColor = UIColor(argb: value)
        }
        if let value = map["idenfySplashScreenViewLoadingSpinnerTintColor"] as? Int {
            IdenfySplashScreenViewUISettingsV2.idenfySplashScreenViewSpinnerTintColor = UIColor(argb: value)
        }

        // Bottom Sheet -> IdenfyBottomSheetUISettingsV2
        if let value = map["idenfyBottomSheetBackgroundColor"] as? Int {
            IdenfyBottomSheetUISettingsV2.idenfyBottomSheetBackgroundColor = UIColor(argb: value)
        }
        if let value = map["idenfyBottomSheetDragHandleColor"] as? Int {
            IdenfyBottomSheetUISettingsV2.idenfyBottomSheetDragHandleColor = UIColor(argb: value)
        }
    }
}
