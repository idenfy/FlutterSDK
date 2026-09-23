import com.idenfy.idenfySdk.CoreSdkInitialization.IdenfyController
import com.idenfy.idenfySdk.CoreSdkInitialization.IdenfyLocaleEnum
import com.idenfy.idenfySdk.api.initialization.IdenfySettingsV2
import com.idenfy.idenfySdk.api.models.DocumentCameraFrameVisibility
import com.idenfy.idenfySdk.api.models.IdenfyOnBoardingViewTypeEnum
import com.idenfy.idenfySdk.api.models.ImmediateRedirectEnum
import com.idenfy.idenfySdk.api.response.FaceAuthenticationResult
import com.idenfy.idenfySdk.api.response.IdenfyIdentificationResult
import com.idenfy.idenfySdk.api.ui.IdenfyFaceAuthUISettings
import com.idenfy.idenfySdk.api.ui.IdenfyIdentificationResultsUISettingsV2
import com.idenfy.idenfySdk.api.ui.IdenfyUISettingsV2
import com.idenfy.idenfySdk.api.ui.colors.IdenfyColorScheme
import com.idenfy.idenfySdk.faceauthentication.api.FaceAuthenticationInitialization
import com.idenfy.idenfySdk.idenfycore.models.documentTypeData.DocumentTypeEnum

object IdenfySettingsDecoder {

    fun decodeIdenfySettings(json: Map<String, Any?>?): IdenfySettingsV2 {
        val idenfySettings = IdenfySettingsV2()
        if (json?.get("sslPinning") as? Boolean != null) {
            idenfySettings.sslPinning = json["sslPinning"] as Boolean
        }
        if (json?.get("selectedLocale") as? String != null) {
            val locale = json["selectedLocale"] as String
            idenfySettings.selectedLocale = IdenfyLocaleEnum.valueOf(locale).locale
        }
        if (json?.get("idenfyUISettings") as? Map<*, *>? != null) {
            val uiSettingsMap = json["idenfyUISettings"] as Map<*, *>
            val idenfyUISettingsV2 = IdenfyUISettingsV2()
            if (uiSettingsMap["isAdditionalSupportEnabled"] as? Boolean != null) {
                idenfyUISettingsV2.isAdditionalSupportEnabled =
                    uiSettingsMap["isAdditionalSupportEnabled"] as Boolean
            }
            if (uiSettingsMap["idenfyDocumentSelectionType"] as? String != null) {
                val enum =
                    (uiSettingsMap["idenfyDocumentSelectionType"] as String).camelToSnakeCase()
                idenfyUISettingsV2.idenfyDocumentSelectionType =
                    com.idenfy.idenfySdk.api.models.IdenfyDocumentSelectionTypeEnum.valueOf(enum)
            }
            if (uiSettingsMap["idenfyOnBoardingViewType"] as? String != null) {
                val enum = (uiSettingsMap["idenfyOnBoardingViewType"] as String).camelToSnakeCase()
                idenfyUISettingsV2.idenfyOnBoardingViewTypeEnum =
                    IdenfyOnBoardingViewTypeEnum.valueOf(enum)
            }
            if (uiSettingsMap["isLanguageSelectionNeeded"] as? Boolean != null) {
                idenfyUISettingsV2.isLanguageSelectionNeeded =
                    uiSettingsMap["isLanguageSelectionNeeded"] as Boolean
            }
            if (uiSettingsMap["idenfyInstructionsEnum"] as? String != null) {
                val enum = (uiSettingsMap["idenfyInstructionsEnum"] as String).uppercase()
                idenfyUISettingsV2.idenfyInstructionsType =
                    com.idenfy.idenfySdk.camerasession.commoncamerasession.presentation.model.IdenfyInstructionsType.valueOf(
                        enum
                    )
            }
            val idenfyIdentificationResultsUISettingsV2 = IdenfyIdentificationResultsUISettingsV2()
            if (uiSettingsMap["idenfyIdentificationResultsUISettingsV2"] as? Map<*, *>? != null) {
                val resultsUISettingsMap =
                    uiSettingsMap["idenfyIdentificationResultsUISettingsV2"] as Map<*, *>
                if (resultsUISettingsMap["isShowErrorSpinnerImmediateRedirect"] as? Boolean != null) {
                    idenfyIdentificationResultsUISettingsV2.isShowErrorSpinnerImmediateRedirect =
                        resultsUISettingsMap["isShowErrorSpinnerImmediateRedirect"] as Boolean
                }
                if (resultsUISettingsMap["isAdditionalUploadingInformationVisible"] as? Boolean != null) {
                    idenfyIdentificationResultsUISettingsV2.isAdditionalUploadingInformationVisible =
                        resultsUISettingsMap["isAdditionalUploadingInformationVisible"] as Boolean
                }
                if (resultsUISettingsMap["isShowSuccessSpinnerImmediateRedirect"] as? Boolean != null) {
                    idenfyIdentificationResultsUISettingsV2.isShowSuccessSpinnerImmediateRedirect =
                        resultsUISettingsMap["isShowSuccessSpinnerImmediateRedirect"] as Boolean
                }
            }
            idenfyUISettingsV2.idenfyIdentificationResultsUISettingsV2 =
                idenfyIdentificationResultsUISettingsV2

            if (uiSettingsMap["immediateRedirectEnum"] as? String != null) {
                val enum = (uiSettingsMap["immediateRedirectEnum"] as String).camelToSnakeCase()
                idenfyUISettingsV2.immediateRedirectEnum = ImmediateRedirectEnum.valueOf(enum)
            }
            if (uiSettingsMap["mismatchTagsAlert"] as? Boolean != null) {
                idenfyUISettingsV2.mismatchTagsAlert =
                    uiSettingsMap["mismatchTagsAlert"] as Boolean
            }

            if (uiSettingsMap["withCountryAndDocumentSelectionJoined"] as? Boolean != null) {
                idenfyUISettingsV2.withCountryAndDocumentSelectionJoined =
                    uiSettingsMap["withCountryAndDocumentSelectionJoined"] as Boolean
            }

            if (uiSettingsMap["useBottomSheetDialogs"] as? Boolean != null) {
                idenfyUISettingsV2.useBottomSheetDialogs =
                    uiSettingsMap["useBottomSheetDialogs"] as Boolean
            }

            if (uiSettingsMap["documentCameraFrameVisibility"] as? Map<*, *> != null) {
                if (uiSettingsMap["documentCameraFrameVisibility"] as? Map<*, *> != null) {
                    val enum = uiSettingsMap["documentCameraFrameVisibility"] as Map<*, *>
                    if (enum["value"] == "HiddenForAllCountriesAndDocumentTypes") {
                        idenfyUISettingsV2.documentFrameVisibility = DocumentCameraFrameVisibility.HiddenForAllCountriesAndDocumentTypes
                    } else if (enum["value"] == "HiddenForSpecificCountriesAndDocumentTypes") {
                        val map: MutableMap<String, List<Any>> = enum["countriesAndDocuments"] as MutableMap<String, List<Any>>
                        map.forEach { (key, value) ->
                            val updatedList = value.mapNotNull {
                                try {
                                    DocumentTypeEnum.valueOf(it as String)
                                } catch (e: IllegalArgumentException) {
                                    null
                                }
                            }
                            map[key] = updatedList
                        }
                        idenfyUISettingsV2.documentFrameVisibility = DocumentCameraFrameVisibility.HiddenForSpecificCountriesAndDocumentTypes(map as Map<String, List<DocumentTypeEnum>>)
                    }
                }
            }
            if (uiSettingsMap["idenfyColorScheme"] as? Map<*, *> != null) {
                @Suppress("UNCHECKED_CAST")
                val colorSchemeMap = uiSettingsMap["idenfyColorScheme"] as Map<String, Any?>
                decodeColorScheme(colorSchemeMap)?.let {
                    idenfyUISettingsV2.idenfyColorScheme = it
                }
            }

            idenfySettings.idenfyUISettingsV2 = idenfyUISettingsV2
        }
        return idenfySettings
    }

    fun decodeFaceAuthUISettings(json: Map<String, Any?>?): IdenfyFaceAuthUISettings {
        val faceAuthUISettings = IdenfyFaceAuthUISettings()
        if (json?.get("isLanguageSelectionNeeded") as? Boolean != null) {
            faceAuthUISettings.isLanguageSelectionNeeded =
                json["isLanguageSelectionNeeded"] as Boolean
        }
        if (json?.get("skipOnBoardingView") as? Boolean != null) {
            faceAuthUISettings.skipOnBoardingView = json["skipOnBoardingView"] as Boolean
        }
        if (json?.get("idenfyColorScheme") as? Map<*, *> != null) {
            @Suppress("UNCHECKED_CAST")
            val colorSchemeMap = json["idenfyColorScheme"] as Map<String, Any?>
            decodeColorScheme(colorSchemeMap)?.let {
                faceAuthUISettings.idenfyColorScheme = it
            }
        }
        return faceAuthUISettings
    }

    private fun String.camelToSnakeCase(): String {
        return "(?<=[a-zA-Z])[A-Z]".toRegex().replace(this) {
            "_${it.value}"
        }.uppercase()
    }

    fun decodeColorScheme(map: Map<String, Any?>?): com.idenfy.idenfySdk.api.ui.colors.IdenfyColorScheme? {
        if (map == null || map.isEmpty()) return null
        val scheme = com.idenfy.idenfySdk.api.ui.colors.IdenfyColorScheme()
        (map["idenfyBackgroundColorV2"] as? Number)?.let { scheme.idenfyBackgroundColorV2 = it.toInt() }
        (map["idenfyMainColorV2"] as? Number)?.let { scheme.idenfyMainColorV2 = it.toInt() }
        (map["idenfyMainDarkerColorV2"] as? Number)?.let { scheme.idenfyMainDarkerColorV2 = it.toInt() }
        (map["idenfySecondColorV2"] as? Number)?.let { scheme.idenfySecondColorV2 = it.toInt() }
        (map["idenfyMainColor50percentV2"] as? Number)?.let { scheme.idenfyMainColor50percentV2 = it.toInt() }
        (map["idenfySecondColor6percentV2"] as? Number)?.let { scheme.idenfySecondColor6percentV2 = it.toInt() }
        (map["idenfySecondColor20percentV2"] as? Number)?.let { scheme.idenfySecondColor20percentV2 = it.toInt() }
        (map["idenfySecondColor50percentV2"] as? Number)?.let { scheme.idenfySecondColor50percentV2 = it.toInt() }
        (map["idenfySecondColor80percentV2"] as? Number)?.let { scheme.idenfySecondColor80percentV2 = it.toInt() }
        (map["idenfyInactiveColorV2"] as? Number)?.let { scheme.idenfyInactiveColorV2 = it.toInt() }
        (map["idenfyStepSuccessColorV2"] as? Number)?.let { scheme.idenfyStepSuccessColorV2 = it.toInt() }
        (map["idenfyStepErrorColorV2"] as? Number)?.let { scheme.idenfyStepErrorColorV2 = it.toInt() }
        (map["idenfyFaceOvalStrokeColor"] as? Number)?.let { scheme.idenfyFaceOvalStrokeColor = it.toInt() }
        (map["idenfyTakePhotoButtonBackgroundFocused"] as? Number)?.let { scheme.idenfyTakePhotoButtonBackgroundFocused = it.toInt() }
        (map["idenfyTakePhotoButtonIconUnFocused"] as? Number)?.let { scheme.idenfyTakePhotoButtonIconUnFocused = it.toInt() }
        (map["idenfyTransparentCameraOverlayV2"] as? Number)?.let { scheme.idenfyTransparentCameraOverlayV2 = it.toInt() }
        (map["idenfyDrawerCurrentInstructionIndicatorColorV2"] as? Number)?.let { scheme.idenfyDrawerCurrentInstructionIndicatorColorV2 = it.toInt() }
        (map["idenfyDrawerInstructionControlsTintColorV2"] as? Number)?.let { scheme.idenfyDrawerInstructionControlsTintColorV2 = it.toInt() }
        (map["idenfyPhotoResultDetailsCardBackgroundColorV2"] as? Number)?.let { scheme.idenfyPhotoResultDetailsCardBackgroundColorV2 = it.toInt() }
        (map["idenfyRedColorV2"] as? Number)?.let { scheme.idenfyRedColorV2 = it.toInt() }
        (map["idenfyErrorRedColorV2"] as? Number)?.let { scheme.idenfyErrorRedColorV2 = it.toInt() }
        (map["idenfyErrorLightRedColorV2"] as? Number)?.let { scheme.idenfyErrorLightRedColorV2 = it.toInt() }
        (map["idenfyGreenColorV2"] as? Number)?.let { scheme.idenfyGreenColorV2 = it.toInt() }
        (map["idenfyGrayColorV2"] as? Number)?.let { scheme.idenfyGrayColorV2 = it.toInt() }
        (map["idenfyTransparentCameraOverlay"] as? Number)?.let { scheme.idenfyTransparentCameraOverlay = it.toInt() }
        (map["idenfyHelpSheetOverlay"] as? Number)?.let { scheme.idenfyHelpSheetOverlay = it.toInt() }
        (map["idenfyLivenessBackgroundColor"] as? Number)?.let { scheme.idenfyLivenessBackgroundColor = it.toInt() }
        (map["idenfyBlack"] as? Number)?.let { scheme.idenfyBlack = it.toInt() }
        (map["idenfyWhite"] as? Number)?.let { scheme.idenfyWhite = it.toInt() }
        (map["idenfyWarningLightYellowV2"] as? Number)?.let { scheme.idenfyWarningLightYellowV2 = it.toInt() }
        (map["idenfyWarningYellowV2"] as? Number)?.let { scheme.idenfyWarningYellowV2 = it.toInt() }
        (map["idenfyBackgroundGreenV2"] as? Number)?.let { scheme.idenfyBackgroundGreenV2 = it.toInt() }
        (map["idenfyBorderGreenV2"] as? Number)?.let { scheme.idenfyBorderGreenV2 = it.toInt() }
        (map["idenfyPurpleColor"] as? Number)?.let { scheme.idenfyPurpleColor = it.toInt() }
        (map["idenfyPurpleTextColor"] as? Number)?.let { scheme.idenfyPurpleTextColor = it.toInt() }
        (map["idenfyPurpleBackgroundColor"] as? Number)?.let { scheme.idenfyPurpleBackgroundColor = it.toInt() }
        (map["idenfyLightBlueColor"] as? Number)?.let { scheme.idenfyLightBlueColor = it.toInt() }
        (map["idenfyBlueColor"] as? Number)?.let { scheme.idenfyBlueColor = it.toInt() }
        (map["idenfyLightGrayColor"] as? Number)?.let { scheme.idenfyLightGrayColor = it.toInt() }
        (map["idenfyBlackV2"] as? Number)?.let { scheme.idenfyBlackV2 = it.toInt() }
        (map["idenfyDefaultAppBarBackgroundColor"] as? Number)?.let { scheme.idenfyDefaultAppBarBackgroundColor = it.toInt() }
        (map["idenfyDefaultAppBarIconTintColor"] as? Number)?.let { scheme.idenfyDefaultAppBarIconTintColor = it.toInt() }
        (map["idenfyCameraPreviewSessionAppBarBackgroundColor"] as? Number)?.let { scheme.idenfyCameraPreviewSessionAppBarBackgroundColor = it.toInt() }
        (map["idenfyCameraPreviewSessionAppBarBackButtonTintColor"] as? Number)?.let { scheme.idenfyCameraPreviewSessionAppBarBackButtonTintColor = it.toInt() }
        (map["idenfyCameraPreviewSessionAppBarCameraFlashButtonTintColor"] as? Number)?.let { scheme.idenfyCameraPreviewSessionAppBarCameraFlashButtonTintColor = it.toInt() }
        (map["idenfyCameraPreviewSessionAppBarBackButtonTextColor"] as? Number)?.let { scheme.idenfyCameraPreviewSessionAppBarBackButtonTextColor = it.toInt() }
        (map["idenfyCameraPreviewSessionAppBarFaceNotDetectedAlertTintColor"] as? Number)?.let { scheme.idenfyCameraPreviewSessionAppBarFaceNotDetectedAlertTintColor = it.toInt() }
        (map["idenfyFaceAuthenticationCameraPreviewSessionAppBarCameraLanguageSelectionTintColor"] as? Number)?.let { scheme.idenfyFaceAuthenticationCameraPreviewSessionAppBarCameraLanguageSelectionTintColor = it.toInt() }
        (map["idenfyNoBackButtonAppBarBackgroundColor"] as? Number)?.let { scheme.idenfyNoBackButtonAppBarBackgroundColor = it.toInt() }
        (map["idenfyPhotoResultAppBarBackgroundColor"] as? Number)?.let { scheme.idenfyPhotoResultAppBarBackgroundColor = it.toInt() }
        (map["idenfyPhotoResultAppBarBackButtonTextColor"] as? Number)?.let { scheme.idenfyPhotoResultAppBarBackButtonTextColor = it.toInt() }
        (map["idenfyIdentificationResultsViewInstructionsAlertBackgroundColorV2"] as? Number)?.let { scheme.idenfyIdentificationResultsViewInstructionsAlertBackgroundColorV2 = it.toInt() }
        (map["idenfyIdentificationResultsViewInstructionsAlertLoadingSpinnerColor"] as? Number)?.let { scheme.idenfyIdentificationResultsViewInstructionsAlertLoadingSpinnerColor = it.toInt() }
        (map["idenfyIdentificationResultsViewInstructionsAlertTitleTextColorV2"] as? Number)?.let { scheme.idenfyIdentificationResultsViewInstructionsAlertTitleTextColorV2 = it.toInt() }
        (map["idenfyIdentificationResultsViewInstructionsAlertContinueButtonTextColorV2"] as? Number)?.let { scheme.idenfyIdentificationResultsViewInstructionsAlertContinueButtonTextColorV2 = it.toInt() }
        (map["idenfyIdentificationResultsViewInstructionsAlertProgressBarProgressColorV2"] as? Number)?.let { scheme.idenfyIdentificationResultsViewInstructionsAlertProgressBarProgressColorV2 = it.toInt() }
        (map["idenfyDocumentSelectionViewBackgroundColor"] as? Number)?.let { scheme.idenfyDocumentSelectionViewBackgroundColor = it.toInt() }
        (map["idenfyDocumentSelectionViewTitleTextColor"] as? Number)?.let { scheme.idenfyDocumentSelectionViewTitleTextColor = it.toInt() }
        (map["idenfyDocumentSelectionViewDescriptionTextColor"] as? Number)?.let { scheme.idenfyDocumentSelectionViewDescriptionTextColor = it.toInt() }
        (map["idenfyDocumentSelectionViewRecyclerViewBorderColor"] as? Number)?.let { scheme.idenfyDocumentSelectionViewRecyclerViewBorderColor = it.toInt() }
        (map["idenfyDocumentSelectionViewRecyclerViewBackgroundColor"] as? Number)?.let { scheme.idenfyDocumentSelectionViewRecyclerViewBackgroundColor = it.toInt() }
        (map["idenfyDocumentSelectionViewRecyclerViewItemBackgroundColor"] as? Number)?.let { scheme.idenfyDocumentSelectionViewRecyclerViewItemBackgroundColor = it.toInt() }
        (map["idenfyDocumentSelectionViewRecyclerViewItemBorderColor"] as? Number)?.let { scheme.idenfyDocumentSelectionViewRecyclerViewItemBorderColor = it.toInt() }
        (map["idenfyDocumentSelectionViewRecyclerViewItemTitleTextColor"] as? Number)?.let { scheme.idenfyDocumentSelectionViewRecyclerViewItemTitleTextColor = it.toInt() }
        (map["idenfyDocumentSelectionViewRecyclerViewItemHighlightedTextColor"] as? Number)?.let { scheme.idenfyDocumentSelectionViewRecyclerViewItemHighlightedTextColor = it.toInt() }
        (map["idenfyDocumentSelectionViewRecyclerViewItemHighlightedBackgroundColor"] as? Number)?.let { scheme.idenfyDocumentSelectionViewRecyclerViewItemHighlightedBackgroundColor = it.toInt() }
        (map["idenfyDocumentSelectionViewContinueButtonDisabledBackgroundColor"] as? Number)?.let { scheme.idenfyDocumentSelectionViewContinueButtonDisabledBackgroundColor = it.toInt() }
        (map["idenfyDocumentSelectionViewContinueButtonDisabledTextColor"] as? Number)?.let { scheme.idenfyDocumentSelectionViewContinueButtonDisabledTextColor = it.toInt() }
        (map["idenfyDocumentSelectionViewContinueButtonEnabledTextColor"] as? Number)?.let { scheme.idenfyDocumentSelectionViewContinueButtonEnabledTextColor = it.toInt() }
        (map["idenfyDocumentSelectionViewLoadingSpinnerTintColor"] as? Number)?.let { scheme.idenfyDocumentSelectionViewLoadingSpinnerTintColor = it.toInt() }
        (map["idenfyFaceAuthenticationResultsViewBackgroundColor"] as? Number)?.let { scheme.idenfyFaceAuthenticationResultsViewBackgroundColor = it.toInt() }
        (map["idenfyFaceAuthenticationResultsCommonInformationTitleTextColor"] as? Number)?.let { scheme.idenfyFaceAuthenticationResultsCommonInformationTitleTextColor = it.toInt() }
        (map["idenfyFaceAuthenticationResultsCommonInformationDescriptionTextColor"] as? Number)?.let { scheme.idenfyFaceAuthenticationResultsCommonInformationDescriptionTextColor = it.toInt() }
        (map["idenfyFaceAuthenticationResultsContinueButtonTextColor"] as? Number)?.let { scheme.idenfyFaceAuthenticationResultsContinueButtonTextColor = it.toInt() }
        (map["idenfyFaceCameraPreviewSessionBackgroundColor"] as? Number)?.let { scheme.idenfyFaceCameraPreviewSessionBackgroundColor = it.toInt() }
        (map["idenfyFaceCameraPreviewSessionOvalOutsideColor"] as? Number)?.let { scheme.idenfyFaceCameraPreviewSessionOvalOutsideColor = it.toInt() }
        (map["idenfyFaceCameraPreviewSessionBottomActionButtonsViewBackgroundColor"] as? Number)?.let { scheme.idenfyFaceCameraPreviewSessionBottomActionButtonsViewBackgroundColor = it.toInt() }
        (map["idenfyFaceCameraPreviewSessionTakePhotoButtonUnFocusedTintColor"] as? Number)?.let { scheme.idenfyFaceCameraPreviewSessionTakePhotoButtonUnFocusedTintColor = it.toInt() }
        (map["idenfyFaceCameraPreviewSessionTakePhotoButtonFocusedTintColor"] as? Number)?.let { scheme.idenfyFaceCameraPreviewSessionTakePhotoButtonFocusedTintColor = it.toInt() }
        (map["idenfyFaceCameraPreviewSessionTakePhotoButtonUnFocusedBackgroundColor"] as? Number)?.let { scheme.idenfyFaceCameraPreviewSessionTakePhotoButtonUnFocusedBackgroundColor = it.toInt() }
        (map["idenfyFaceCameraPreviewSessionTakePhotoButtonFocusedBackgroundColor"] as? Number)?.let { scheme.idenfyFaceCameraPreviewSessionTakePhotoButtonFocusedBackgroundColor = it.toInt() }
        (map["idenfyFaceCameraPreviewSessionFaceOvalColor"] as? Number)?.let { scheme.idenfyFaceCameraPreviewSessionFaceOvalColor = it.toInt() }
        (map["idenfyFaceCameraPreviewSessionFaceOvalNotDetectedColor"] as? Number)?.let { scheme.idenfyFaceCameraPreviewSessionFaceOvalNotDetectedColor = it.toInt() }
        (map["idenfyFaceCameraPreviewSessionFaceOvalLoadingColor"] as? Number)?.let { scheme.idenfyFaceCameraPreviewSessionFaceOvalLoadingColor = it.toInt() }
        (map["idenfyFaceCameraPreviewSessionFaceDetectedColor"] as? Number)?.let { scheme.idenfyFaceCameraPreviewSessionFaceDetectedColor = it.toInt() }
        (map["idenfyFaceCameraPreviewTitleTextColor"] as? Number)?.let { scheme.idenfyFaceCameraPreviewTitleTextColor = it.toInt() }
        (map["idenfyFaceCameraPreviewDescriptionTextColor"] as? Number)?.let { scheme.idenfyFaceCameraPreviewDescriptionTextColor = it.toInt() }
        (map["idenfyFaceCameraPreviewSessionLivenessAccentColor"] as? Number)?.let { scheme.idenfyFaceCameraPreviewSessionLivenessAccentColor = it.toInt() }
        (map["idenfyGradientButtonColorStart"] as? Number)?.let { scheme.idenfyGradientButtonColorStart = it.toInt() }
        (map["idenfyGradientButtonColorEnd"] as? Number)?.let { scheme.idenfyGradientButtonColorEnd = it.toInt() }
        (map["idenfyRetakeButtonBackgroundColor"] as? Number)?.let { scheme.idenfyRetakeButtonBackgroundColor = it.toInt() }
        (map["idenfyRetakeButtonBorderColor"] as? Number)?.let { scheme.idenfyRetakeButtonBorderColor = it.toInt() }
        (map["idenfyIdentificationResultsViewBackgroundColor"] as? Number)?.let { scheme.idenfyIdentificationResultsViewBackgroundColor = it.toInt() }
        (map["idenfyIdentificationResultsViewTitleTextColor"] as? Number)?.let { scheme.idenfyIdentificationResultsViewTitleTextColor = it.toInt() }
        (map["idenfyIdentificationResultsViewDescriptionTextColor"] as? Number)?.let { scheme.idenfyIdentificationResultsViewDescriptionTextColor = it.toInt() }
        (map["idenfyIdentificationResultsViewDocumentStepTitleTextColor"] as? Number)?.let { scheme.idenfyIdentificationResultsViewDocumentStepTitleTextColor = it.toInt() }
        (map["idenfyIdentificationResultsViewDocumentStepLoadingStepDividerLoadingColor"] as? Number)?.let { scheme.idenfyIdentificationResultsViewDocumentStepLoadingStepDividerLoadingColor = it.toInt() }
        (map["idenfyIdentificationResultsViewDocumentStepLoadingSpinnerAccentColor"] as? Number)?.let { scheme.idenfyIdentificationResultsViewDocumentStepLoadingSpinnerAccentColor = it.toInt() }
        (map["idenfyIdentificationResultsViewDocumentStepLoadingStepDividerSuccessColor"] as? Number)?.let { scheme.idenfyIdentificationResultsViewDocumentStepLoadingStepDividerSuccessColor = it.toInt() }
        (map["idenfyIdentificationResultsViewDocumentStepLoadingStepDividerErrorColor"] as? Number)?.let { scheme.idenfyIdentificationResultsViewDocumentStepLoadingStepDividerErrorColor = it.toInt() }
        (map["idenfyIdentificationResultsViewDocumentStepScrollBarThumbColor"] as? Number)?.let { scheme.idenfyIdentificationResultsViewDocumentStepScrollBarThumbColor = it.toInt() }
        (map["idenfyIdentificationResultsViewRetakeButtonTextColor"] as? Number)?.let { scheme.idenfyIdentificationResultsViewRetakeButtonTextColor = it.toInt() }
        (map["idenfyIdentificationResultsViewContentMaskForegroundColor"] as? Number)?.let { scheme.idenfyIdentificationResultsViewContentMaskForegroundColor = it.toInt() }
        (map["idenfyIdentificationResultsViewSuccessStepTextColor"] as? Number)?.let { scheme.idenfyIdentificationResultsViewSuccessStepTextColor = it.toInt() }
        (map["idenfyIdentificationResultsViewErrorStepTextColorV2"] as? Number)?.let { scheme.idenfyIdentificationResultsViewErrorStepTextColorV2 = it.toInt() }
        (map["idenfyIdentificationResultsViewDocNotFoundAlertBackgroundColorV2"] as? Number)?.let { scheme.idenfyIdentificationResultsViewDocNotFoundAlertBackgroundColorV2 = it.toInt() }
        (map["idenfyIdentificationResultsViewDocNotFoundAlertTitleTextColorV2"] as? Number)?.let { scheme.idenfyIdentificationResultsViewDocNotFoundAlertTitleTextColorV2 = it.toInt() }
        (map["idenfyIdentificationResultsViewDocNotFoundAlertDescriptionTextColorV2"] as? Number)?.let { scheme.idenfyIdentificationResultsViewDocNotFoundAlertDescriptionTextColorV2 = it.toInt() }
        (map["idenfyIdentificationResultsViewDocNotFoundAlertDescriptionDocumentHighlightColorV2"] as? Number)?.let { scheme.idenfyIdentificationResultsViewDocNotFoundAlertDescriptionDocumentHighlightColorV2 = it.toInt() }
        (map["idenfyIdentificationResultsViewDocNotFoundAlertContinueButtonTextColorV2"] as? Number)?.let { scheme.idenfyIdentificationResultsViewDocNotFoundAlertContinueButtonTextColorV2 = it.toInt() }
        (map["idenfyIdentificationResultsViewMrzNotFoundAlertBackgroundColorV2"] as? Number)?.let { scheme.idenfyIdentificationResultsViewMrzNotFoundAlertBackgroundColorV2 = it.toInt() }
        (map["idenfyIdentificationResultsViewMrzNotFoundAlertTitleTextColorV2"] as? Number)?.let { scheme.idenfyIdentificationResultsViewMrzNotFoundAlertTitleTextColorV2 = it.toInt() }
        (map["idenfyIdentificationResultsViewMrzNotFoundAlertDescriptionTextColorV2"] as? Number)?.let { scheme.idenfyIdentificationResultsViewMrzNotFoundAlertDescriptionTextColorV2 = it.toInt() }
        (map["idenfyIdentificationResultsViewMrzNotFoundAlertContinueButtonTextColorV2"] as? Number)?.let { scheme.idenfyIdentificationResultsViewMrzNotFoundAlertContinueButtonTextColorV2 = it.toInt() }
        (map["idenfyIdentificationResultsViewMrzNotFoundAlertBackButtonTextColorV2"] as? Number)?.let { scheme.idenfyIdentificationResultsViewMrzNotFoundAlertBackButtonTextColorV2 = it.toInt() }
        (map["idenfyIdentificationResultsViewMismatchTagsFoundAlertBackgroundColorV2"] as? Number)?.let { scheme.idenfyIdentificationResultsViewMismatchTagsFoundAlertBackgroundColorV2 = it.toInt() }
        (map["idenfyIdentificationResultsViewMismatchTagsFoundAlertTitleTextColorV2"] as? Number)?.let { scheme.idenfyIdentificationResultsViewMismatchTagsFoundAlertTitleTextColorV2 = it.toInt() }
        (map["idenfyIdentificationResultsViewMismatchTagsFoundAlertDescriptionTextColorV2"] as? Number)?.let { scheme.idenfyIdentificationResultsViewMismatchTagsFoundAlertDescriptionTextColorV2 = it.toInt() }
        (map["idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonDisabledTextColorV2"] as? Number)?.let { scheme.idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonDisabledTextColorV2 = it.toInt() }
        (map["idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonDisabledBackgroundColorV2"] as? Number)?.let { scheme.idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonDisabledBackgroundColorV2 = it.toInt() }
        (map["idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonEnabledTextColorV2"] as? Number)?.let { scheme.idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonEnabledTextColorV2 = it.toInt() }
        (map["idenfyIdentificationSuccessResultsViewBackgroundColor"] as? Number)?.let { scheme.idenfyIdentificationSuccessResultsViewBackgroundColor = it.toInt() }
        (map["idenfyIdentificationSuccessResultsViewTitleTextColor"] as? Number)?.let { scheme.idenfyIdentificationSuccessResultsViewTitleTextColor = it.toInt() }
        (map["idenfyIdentificationSuccessResultsViewDescriptionTextColor"] as? Number)?.let { scheme.idenfyIdentificationSuccessResultsViewDescriptionTextColor = it.toInt() }
        (map["idenfyIdentificationSuccessResultsViewIdentifiedTextColor"] as? Number)?.let { scheme.idenfyIdentificationSuccessResultsViewIdentifiedTextColor = it.toInt() }
        (map["idenfyIdentificationSuspectedResultsViewTitleColor"] as? Number)?.let { scheme.idenfyIdentificationSuspectedResultsViewTitleColor = it.toInt() }
        (map["idenfyIdentificationSuspectedResultsViewDescriptionColor"] as? Number)?.let { scheme.idenfyIdentificationSuspectedResultsViewDescriptionColor = it.toInt() }
        (map["idenfyIdentificationSuspectedResultsViewDescriptionEmailColor"] as? Number)?.let { scheme.idenfyIdentificationSuspectedResultsViewDescriptionEmailColor = it.toInt() }
        (map["idenfyIdentificationSuspectedResultsViewContinueButtonBackgroundColor"] as? Number)?.let { scheme.idenfyIdentificationSuspectedResultsViewContinueButtonBackgroundColor = it.toInt() }
        (map["idenfyIdentificationSuspectedResultsViewContinueButtonTitleColor"] as? Number)?.let { scheme.idenfyIdentificationSuspectedResultsViewContinueButtonTitleColor = it.toInt() }
        (map["idenfyLanguageSelectionViewBackgroundColor"] as? Number)?.let { scheme.idenfyLanguageSelectionViewBackgroundColor = it.toInt() }
        (map["idenfyLanguageSelectionViewTitleTextColor"] as? Number)?.let { scheme.idenfyLanguageSelectionViewTitleTextColor = it.toInt() }
        (map["idenfyLanguageSelectionViewLanguageRecyclerViewBackgroundColor"] as? Number)?.let { scheme.idenfyLanguageSelectionViewLanguageRecyclerViewBackgroundColor = it.toInt() }
        (map["idenfyLanguageSelectionViewLanguageRecyclerViewBorderColor"] as? Number)?.let { scheme.idenfyLanguageSelectionViewLanguageRecyclerViewBorderColor = it.toInt() }
        (map["idenfyLanguageSelectionViewLanguageRecyclerViewItemBackgroundColor"] as? Number)?.let { scheme.idenfyLanguageSelectionViewLanguageRecyclerViewItemBackgroundColor = it.toInt() }
        (map["idenfyLanguageSelectionViewLanguageRecyclerViewItemBorderColor"] as? Number)?.let { scheme.idenfyLanguageSelectionViewLanguageRecyclerViewItemBorderColor = it.toInt() }
        (map["idenfyLanguageSelectionViewLanguageRecyclerViewItemTextColor"] as? Number)?.let { scheme.idenfyLanguageSelectionViewLanguageRecyclerViewItemTextColor = it.toInt() }
        (map["idenfyLanguageSelectionViewLanguageRecyclerViewItemHighlightedTextColor"] as? Number)?.let { scheme.idenfyLanguageSelectionViewLanguageRecyclerViewItemHighlightedTextColor = it.toInt() }
        (map["idenfyLanguageSelectionViewLanguageRecyclerViewItemHighlightedBackgroundColor"] as? Number)?.let { scheme.idenfyLanguageSelectionViewLanguageRecyclerViewItemHighlightedBackgroundColor = it.toInt() }
        (map["idenfyManualReviewingStatusApprovedViewBackgroundColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusApprovedViewBackgroundColor = it.toInt() }
        (map["idenfyManualReviewingStatusApprovedCommonInformationTitleTextColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusApprovedCommonInformationTitleTextColor = it.toInt() }
        (map["idenfyManualReviewingStatusApprovedCommonInformationDescriptionTextColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusApprovedCommonInformationDescriptionTextColor = it.toInt() }
        (map["idenfyManualReviewingStatusApprovedContinueButtonTextColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusApprovedContinueButtonTextColor = it.toInt() }
        (map["idenfyManualReviewingStatusFailedViewBackgroundColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusFailedViewBackgroundColor = it.toInt() }
        (map["idenfyManualReviewingStatusFailedCommonInformationTitleTextColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusFailedCommonInformationTitleTextColor = it.toInt() }
        (map["idenfyManualReviewingStatusFailedCommonInformationDescriptionTextColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusFailedCommonInformationDescriptionTextColor = it.toInt() }
        (map["idenfyManualReviewingStatusFailedCommonInformationDescriptionSupportEmailTextColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusFailedCommonInformationDescriptionSupportEmailTextColor = it.toInt() }
        (map["idenfyManualReviewingStatusFailedContinueButtonTextColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusFailedContinueButtonTextColor = it.toInt() }
        (map["idenfyManualReviewingStatusWaitingViewBackgroundColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusWaitingViewBackgroundColor = it.toInt() }
        (map["idenfyManualReviewingStatusWaitingCommonInformationTitleTextColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusWaitingCommonInformationTitleTextColor = it.toInt() }
        (map["idenfyManualReviewingStatusWaitingCommonInformationDescriptionTextColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusWaitingCommonInformationDescriptionTextColor = it.toInt() }
        (map["idenfyManualReviewingStatusWaitingCommonReviewBoxFinishedBackgroundColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusWaitingCommonReviewBoxFinishedBackgroundColor = it.toInt() }
        (map["idenfyManualReviewingStatusWaitingCommonReviewBoxFinishedTitleColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusWaitingCommonReviewBoxFinishedTitleColor = it.toInt() }
        (map["idenfyManualReviewingStatusWaitingCommonReviewBoxFinishedTickImageTintColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusWaitingCommonReviewBoxFinishedTickImageTintColor = it.toInt() }
        (map["idenfyManualReviewingStatusWaitingCommonReviewBoxWaitingBackgroundColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusWaitingCommonReviewBoxWaitingBackgroundColor = it.toInt() }
        (map["idenfyManualReviewingStatusWaitingCommonReviewBoxWaitingTitleColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusWaitingCommonReviewBoxWaitingTitleColor = it.toInt() }
        (map["idenfyManualReviewingStatusWaitingCommonReviewBoxWaitingSpinnerColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusWaitingCommonReviewBoxWaitingSpinnerColor = it.toInt() }
        (map["idenfyManualReviewingStatusWaitingCommonWaitingDurationTitleColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusWaitingCommonWaitingDurationTitleColor = it.toInt() }
        (map["idenfyManualReviewingStatusWaitingCommonWaitingTimerBoxBackgroundColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusWaitingCommonWaitingTimerBoxBackgroundColor = it.toInt() }
        (map["idenfyManualReviewingStatusWaitingCommonWaitingTimerImageTintColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusWaitingCommonWaitingTimerImageTintColor = it.toInt() }
        (map["idenfyManualReviewingStatusWaitingCommonWaitingTimerTitleColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusWaitingCommonWaitingTimerTitleColor = it.toInt() }
        (map["idenfyManualReviewingStatusWaitingBackToAccountButtonBackgroundColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusWaitingBackToAccountButtonBackgroundColor = it.toInt() }
        (map["idenfyManualReviewingStatusWaitingBackToAccountButtonTextColor"] as? Number)?.let { scheme.idenfyManualReviewingStatusWaitingBackToAccountButtonTextColor = it.toInt() }
        (map["idenfyNFCReadingTimeOutViewBackgroundColor"] as? Number)?.let { scheme.idenfyNFCReadingTimeOutViewBackgroundColor = it.toInt() }
        (map["idenfyNFCReadingTimeOutCommonInformationTitleTextColor"] as? Number)?.let { scheme.idenfyNFCReadingTimeOutCommonInformationTitleTextColor = it.toInt() }
        (map["idenfyNFCReadingTimeOutCommonInformationDescriptionTextColor"] as? Number)?.let { scheme.idenfyNFCReadingTimeOutCommonInformationDescriptionTextColor = it.toInt() }
        (map["idenfyNFCReadingTimeOutContinueButtonTextColor"] as? Number)?.let { scheme.idenfyNFCReadingTimeOutContinueButtonTextColor = it.toInt() }
        (map["idenfyNFCReadingViewBackgroundColor"] as? Number)?.let { scheme.idenfyNFCReadingViewBackgroundColor = it.toInt() }
        (map["idenfyNFCReadingCommonInformationTitleTextColor"] as? Number)?.let { scheme.idenfyNFCReadingCommonInformationTitleTextColor = it.toInt() }
        (map["idenfyNFCReadingCommonInformationDescriptionTextColor"] as? Number)?.let { scheme.idenfyNFCReadingCommonInformationDescriptionTextColor = it.toInt() }
        (map["idenfyNFCRequiredViewBackgroundColor"] as? Number)?.let { scheme.idenfyNFCRequiredViewBackgroundColor = it.toInt() }
        (map["idenfyNFCRequiredCommonInformationTitleTextColor"] as? Number)?.let { scheme.idenfyNFCRequiredCommonInformationTitleTextColor = it.toInt() }
        (map["idenfyNFCRequiredCommonInformationDescriptionTextColor"] as? Number)?.let { scheme.idenfyNFCRequiredCommonInformationDescriptionTextColor = it.toInt() }
        (map["idenfyNFCRequiredContinueButtonTextColor"] as? Number)?.let { scheme.idenfyNFCRequiredContinueButtonTextColor = it.toInt() }
        (map["idenfyQuestionnaireViewBackgroundColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewBackgroundColor = it.toInt() }
        (map["idenfyQuestionnaireViewTitleTextColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewTitleTextColor = it.toInt() }
        (map["idenfyQuestionnaireViewDescriptionTextColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewDescriptionTextColor = it.toInt() }
        (map["idenfyQuestionnaireViewSectionTitleTextColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewSectionTitleTextColor = it.toInt() }
        (map["idenfyQuestionnaireViewSectionDescriptionTextColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewSectionDescriptionTextColor = it.toInt() }
        (map["idenfyQuestionnaireViewContinueButtonDisabledBackgroundColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewContinueButtonDisabledBackgroundColor = it.toInt() }
        (map["idenfyQuestionnaireViewContinueButtonDisabledTextColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewContinueButtonDisabledTextColor = it.toInt() }
        (map["idenfyQuestionnaireViewContinueButtonEnabledTextColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewContinueButtonEnabledTextColor = it.toInt() }
        (map["idenfyQuestionnaireViewLoadingSpinnerTintColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewLoadingSpinnerTintColor = it.toInt() }
        (map["idenfyQuestionnaireViewQuestionItemTitleTextColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewQuestionItemTitleTextColor = it.toInt() }
        (map["idenfyQuestionnaireViewQuestionItemDescriptionTextColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewQuestionItemDescriptionTextColor = it.toInt() }
        (map["idenfyQuestionnaireViewTextQuestionItemEditTextTitleColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewTextQuestionItemEditTextTitleColor = it.toInt() }
        (map["idenfyQuestionnaireViewTextQuestionItemEditTextHintColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewTextQuestionItemEditTextHintColor = it.toInt() }
        (map["idenfyQuestionnaireViewTextQuestionItemEditTextHighlightedBorderColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewTextQuestionItemEditTextHighlightedBorderColor = it.toInt() }
        (map["idenfyQuestionnaireViewTextQuestionItemEditTextBackgroundColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewTextQuestionItemEditTextBackgroundColor = it.toInt() }
        (map["idenfyQuestionnaireViewTextQuestionItemEditTextBorderColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewTextQuestionItemEditTextBorderColor = it.toInt() }
        (map["idenfyQuestionnaireViewCheckBoxQuestionItemCheckBoxColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewCheckBoxQuestionItemCheckBoxColor = it.toInt() }
        (map["idenfyQuestionnaireViewCheckBoxQuestionItemCheckBoxDescriptionColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewCheckBoxQuestionItemCheckBoxDescriptionColor = it.toInt() }
        (map["idenfyQuestionnaireViewCountryQuestionTrailingIconTintColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewCountryQuestionTrailingIconTintColor = it.toInt() }
        (map["idenfyQuestionnaireViewDateQuestionTrailingIconTintColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewDateQuestionTrailingIconTintColor = it.toInt() }
        (map["idenfyQuestionnaireViewFileQuestionUploadIconTintColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewFileQuestionUploadIconTintColor = it.toInt() }
        (map["idenfyQuestionnaireViewFileQuestionCancelIconTintColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewFileQuestionCancelIconTintColor = it.toInt() }
        (map["idenfyQuestionnaireViewFileQuestionFilePickerPlaceHolderTextColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewFileQuestionFilePickerPlaceHolderTextColor = it.toInt() }
        (map["idenfyQuestionnaireViewImageQuestionUploadIconTintColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewImageQuestionUploadIconTintColor = it.toInt() }
        (map["idenfyQuestionnaireViewImageQuestionCancelIconTintColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewImageQuestionCancelIconTintColor = it.toInt() }
        (map["idenfyQuestionnaireViewImageQuestionImagePickerPlaceHolderTextColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewImageQuestionImagePickerPlaceHolderTextColor = it.toInt() }
        (map["idenfyQuestionnaireViewPasswordQuestionTrailingIconTintColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewPasswordQuestionTrailingIconTintColor = it.toInt() }
        (map["idenfyQuestionnaireViewRadioQuestionRadioButtonTintColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewRadioQuestionRadioButtonTintColor = it.toInt() }
        (map["idenfyQuestionnaireViewRadioQuestionRadioButtonBackgroundColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewRadioQuestionRadioButtonBackgroundColor = it.toInt() }
        (map["idenfyQuestionnaireViewRadioQuestionRadioButtonTextColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewRadioQuestionRadioButtonTextColor = it.toInt() }
        (map["idenfyQuestionnaireViewSelectMultiQuestionCheckBoxTintColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewSelectMultiQuestionCheckBoxTintColor = it.toInt() }
        (map["idenfyQuestionnaireViewSelectMultiQuestionCheckBoxTextColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewSelectMultiQuestionCheckBoxTextColor = it.toInt() }
        (map["idenfyQuestionnaireViewInputFieldErrorMessageTextColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewInputFieldErrorMessageTextColor = it.toInt() }
        (map["idenfyQuestionnaireViewCountryMultiQuestionCountryPickerPlaceHolderTextColor"] as? Number)?.let { scheme.idenfyQuestionnaireViewCountryMultiQuestionCountryPickerPlaceHolderTextColor = it.toInt() }
        (map["idenfyUploadPhotoViewBackgroundColor"] as? Number)?.let { scheme.idenfyUploadPhotoViewBackgroundColor = it.toInt() }
        (map["idenfyUploadPhotoViewTitleTextColor"] as? Number)?.let { scheme.idenfyUploadPhotoViewTitleTextColor = it.toInt() }
        (map["idenfyUploadPhotoViewDescriptionTextColor"] as? Number)?.let { scheme.idenfyUploadPhotoViewDescriptionTextColor = it.toInt() }
        (map["idenfyUploadPhotoViewCroppingBorderColor"] as? Number)?.let { scheme.idenfyUploadPhotoViewCroppingBorderColor = it.toInt() }
        (map["idenfyUploadPhotoViewCroppingBackgroundColor"] as? Number)?.let { scheme.idenfyUploadPhotoViewCroppingBackgroundColor = it.toInt() }
        (map["idenfyUploadPhotoViewCroppingPhotoLoadingSpinnerColor"] as? Number)?.let { scheme.idenfyUploadPhotoViewCroppingPhotoLoadingSpinnerColor = it.toInt() }
        (map["idenfyUploadPhotoViewChooseAnotherPhotoButtonTextColor"] as? Number)?.let { scheme.idenfyUploadPhotoViewChooseAnotherPhotoButtonTextColor = it.toInt() }
        (map["idenfyUploadPhotoViewContinuePhotoButtonTextColor"] as? Number)?.let { scheme.idenfyUploadPhotoViewContinuePhotoButtonTextColor = it.toInt() }
        (map["idenfyBankVerificationViewBackgroundColor"] as? Number)?.let { scheme.idenfyBankVerificationViewBackgroundColor = it.toInt() }
        (map["idenfyBankVerificationCommonInformationTitleTextColor"] as? Number)?.let { scheme.idenfyBankVerificationCommonInformationTitleTextColor = it.toInt() }
        (map["idenfyBankVerificationCommonInformationDescriptionTextColor"] as? Number)?.let { scheme.idenfyBankVerificationCommonInformationDescriptionTextColor = it.toInt() }
        (map["idenfyBankVerificationViewItemSelectionBorderColor"] as? Number)?.let { scheme.idenfyBankVerificationViewItemSelectionBorderColor = it.toInt() }
        (map["idenfyBankVerificationViewItemSelectionBackgroundColor"] as? Number)?.let { scheme.idenfyBankVerificationViewItemSelectionBackgroundColor = it.toInt() }
        (map["idenfyBankVerificationViewItemSelectionTextColor"] as? Number)?.let { scheme.idenfyBankVerificationViewItemSelectionTextColor = it.toInt() }
        (map["idenfyBankVerificationViewItemSelectionTrailingIconTintColor"] as? Number)?.let { scheme.idenfyBankVerificationViewItemSelectionTrailingIconTintColor = it.toInt() }
        (map["idenfyBankVerificationViewCheckBoxColor"] as? Number)?.let { scheme.idenfyBankVerificationViewCheckBoxColor = it.toInt() }
        (map["idenfyBankVerificationViewCheckBoxDescriptionColor"] as? Number)?.let { scheme.idenfyBankVerificationViewCheckBoxDescriptionColor = it.toInt() }
        (map["idenfyBankVerificationViewCheckBoxInformationTrailingIconTintColor"] as? Number)?.let { scheme.idenfyBankVerificationViewCheckBoxInformationTrailingIconTintColor = it.toInt() }
        (map["idenfyBankVerificationContinueButtonTextColor"] as? Number)?.let { scheme.idenfyBankVerificationContinueButtonTextColor = it.toInt() }
        (map["idenfyBankVerificationContinueButtonDisabledTextColor"] as? Number)?.let { scheme.idenfyBankVerificationContinueButtonDisabledTextColor = it.toInt() }
        (map["idenfyBankVerificationViewContinueButtonDisabledBackgroundColor"] as? Number)?.let { scheme.idenfyBankVerificationViewContinueButtonDisabledBackgroundColor = it.toInt() }
        (map["idenfyBankVerificationContinueButtonEnabledTextColor"] as? Number)?.let { scheme.idenfyBankVerificationContinueButtonEnabledTextColor = it.toInt() }
        (map["idenfyBankVerificationViewSuccessStatusContainerBackgroundColor"] as? Number)?.let { scheme.idenfyBankVerificationViewSuccessStatusContainerBackgroundColor = it.toInt() }
        (map["idenfyBankVerificationViewSuccessStatusContainerBorderColor"] as? Number)?.let { scheme.idenfyBankVerificationViewSuccessStatusContainerBorderColor = it.toInt() }
        (map["idenfyBankVerificationViewFailedStatusContainerBackgroundColor"] as? Number)?.let { scheme.idenfyBankVerificationViewFailedStatusContainerBackgroundColor = it.toInt() }
        (map["idenfyBankVerificationViewFailedStatusContainerBorderColor"] as? Number)?.let { scheme.idenfyBankVerificationViewFailedStatusContainerBorderColor = it.toInt() }
        (map["idenfyBankVerificationViewSuccessStatusDescriptionIconTintColor"] as? Number)?.let { scheme.idenfyBankVerificationViewSuccessStatusDescriptionIconTintColor = it.toInt() }
        (map["idenfyBankVerificationViewBanksRecyclerViewItemBorderColor"] as? Number)?.let { scheme.idenfyBankVerificationViewBanksRecyclerViewItemBorderColor = it.toInt() }
        (map["idenfyBankVerificationViewBanksRecyclerViewItemBackgroundColor"] as? Number)?.let { scheme.idenfyBankVerificationViewBanksRecyclerViewItemBackgroundColor = it.toInt() }
        (map["idenfyBankVerificationViewBankRecyclerViewItemTextColor"] as? Number)?.let { scheme.idenfyBankVerificationViewBankRecyclerViewItemTextColor = it.toInt() }
        (map["idenfyBankVerificationViewLoadingSpinnerTintColor"] as? Number)?.let { scheme.idenfyBankVerificationViewLoadingSpinnerTintColor = it.toInt() }
        (map["idenfyBankVerificationViewContinueButtonLoadingSpinnerTintColor"] as? Number)?.let { scheme.idenfyBankVerificationViewContinueButtonLoadingSpinnerTintColor = it.toInt() }
        (map["idenfyCameraPermissionViewBackgroundColor"] as? Number)?.let { scheme.idenfyCameraPermissionViewBackgroundColor = it.toInt() }
        (map["idenfyCameraPermissionViewTitleTextColor"] as? Number)?.let { scheme.idenfyCameraPermissionViewTitleTextColor = it.toInt() }
        (map["idenfyCameraPermissionViewDescriptionTextColor"] as? Number)?.let { scheme.idenfyCameraPermissionViewDescriptionTextColor = it.toInt() }
        (map["idenfyCameraPermissionViewGuidanceDescriptionTextColor"] as? Number)?.let { scheme.idenfyCameraPermissionViewGuidanceDescriptionTextColor = it.toInt() }
        (map["idenfyCameraPermissionViewGoToSettingsButtonTextColor"] as? Number)?.let { scheme.idenfyCameraPermissionViewGoToSettingsButtonTextColor = it.toInt() }
        (map["idenfyCameraOnBoardingViewBackgroundColor"] as? Number)?.let { scheme.idenfyCameraOnBoardingViewBackgroundColor = it.toInt() }
        (map["idenfyCameraOnBoardingViewLoadingSpinnerColor"] as? Number)?.let { scheme.idenfyCameraOnBoardingViewLoadingSpinnerColor = it.toInt() }
        (map["idenfyCameraStaticOnBoardingViewTitleColor"] as? Number)?.let { scheme.idenfyCameraStaticOnBoardingViewTitleColor = it.toInt() }
        (map["idenfyCameraStaticOnBoardingViewDescriptionColor"] as? Number)?.let { scheme.idenfyCameraStaticOnBoardingViewDescriptionColor = it.toInt() }
        (map["idenfyCameraStaticOnBoardingViewProgressBarBackgroundColor"] as? Number)?.let { scheme.idenfyCameraStaticOnBoardingViewProgressBarBackgroundColor = it.toInt() }
        (map["idenfyCameraStaticOnBoardingViewProgressBarForegroundColor"] as? Number)?.let { scheme.idenfyCameraStaticOnBoardingViewProgressBarForegroundColor = it.toInt() }
        (map["idenfyCameraStaticOnBoardingViewVideoDescriptionsTitleColor"] as? Number)?.let { scheme.idenfyCameraStaticOnBoardingViewVideoDescriptionsTitleColor = it.toInt() }
        (map["idenfyCameraStaticOnBoardingViewVideoDescriptionsCircleImageTintColor"] as? Number)?.let { scheme.idenfyCameraStaticOnBoardingViewVideoDescriptionsCircleImageTintColor = it.toInt() }
        (map["idenfyCameraStaticOnBoardingViewVideoDescriptionsTextColor"] as? Number)?.let { scheme.idenfyCameraStaticOnBoardingViewVideoDescriptionsTextColor = it.toInt() }
        (map["idenfyCameraStaticOnBoardingViewEnabledButtonTitleColor"] as? Number)?.let { scheme.idenfyCameraStaticOnBoardingViewEnabledButtonTitleColor = it.toInt() }
        (map["idenfyCameraStaticOnBoardingViewDisabledButtonBackgroundColor"] as? Number)?.let { scheme.idenfyCameraStaticOnBoardingViewDisabledButtonBackgroundColor = it.toInt() }
        (map["idenfyCameraStaticOnBoardingViewDisabledButtonTitleColor"] as? Number)?.let { scheme.idenfyCameraStaticOnBoardingViewDisabledButtonTitleColor = it.toInt() }
        (map["idenfyCameraStaticOnBoardingViewLoadingSpinnerColor"] as? Number)?.let { scheme.idenfyCameraStaticOnBoardingViewLoadingSpinnerColor = it.toInt() }
        (map["idenfyCountrySelectionViewBackgroundColor"] as? Number)?.let { scheme.idenfyCountrySelectionViewBackgroundColor = it.toInt() }
        (map["idenfyCountrySelectionViewTitleTextColor"] as? Number)?.let { scheme.idenfyCountrySelectionViewTitleTextColor = it.toInt() }
        (map["idenfyCountrySelectionViewDescriptionTextColor"] as? Number)?.let { scheme.idenfyCountrySelectionViewDescriptionTextColor = it.toInt() }
        (map["idenfyCountrySelectionViewCountrySearchBarBackgroundColor"] as? Number)?.let { scheme.idenfyCountrySelectionViewCountrySearchBarBackgroundColor = it.toInt() }
        (map["idenfyCountrySelectionViewCountrySearchBarHighlightedTextColor"] as? Number)?.let { scheme.idenfyCountrySelectionViewCountrySearchBarHighlightedTextColor = it.toInt() }
        (map["idenfyCountrySelectionViewCountrySearchBarTextColor"] as? Number)?.let { scheme.idenfyCountrySelectionViewCountrySearchBarTextColor = it.toInt() }
        (map["idenfyCountrySelectionViewCountryRecyclerViewBackgroundColor"] as? Number)?.let { scheme.idenfyCountrySelectionViewCountryRecyclerViewBackgroundColor = it.toInt() }
        (map["idenfyCountrySelectionViewCountryRecyclerViewBorderColor"] as? Number)?.let { scheme.idenfyCountrySelectionViewCountryRecyclerViewBorderColor = it.toInt() }
        (map["idenfyCountrySelectionViewCountryRecyclerViewItemBackgroundColor"] as? Number)?.let { scheme.idenfyCountrySelectionViewCountryRecyclerViewItemBackgroundColor = it.toInt() }
        (map["idenfyCountrySelectionViewCountryRecyclerViewItemBorderColor"] as? Number)?.let { scheme.idenfyCountrySelectionViewCountryRecyclerViewItemBorderColor = it.toInt() }
        (map["idenfyCountrySelectionViewCountryRecyclerViewItemTextColor"] as? Number)?.let { scheme.idenfyCountrySelectionViewCountryRecyclerViewItemTextColor = it.toInt() }
        (map["idenfyCountrySelectionViewCountryRecyclerViewItemHighlightedTextColor"] as? Number)?.let { scheme.idenfyCountrySelectionViewCountryRecyclerViewItemHighlightedTextColor = it.toInt() }
        (map["idenfyCountrySelectionViewCountryRecyclerViewItemHighlightedBackgroundColor"] as? Number)?.let { scheme.idenfyCountrySelectionViewCountryRecyclerViewItemHighlightedBackgroundColor = it.toInt() }
        (map["idenfyCountrySelectionViewCountryRecyclerViewItemLoadingSpinnerTintColor"] as? Number)?.let { scheme.idenfyCountrySelectionViewCountryRecyclerViewItemLoadingSpinnerTintColor = it.toInt() }
        (map["idenfyCountryViewSelectionCountrySearchBarBorderColor"] as? Number)?.let { scheme.idenfyCountryViewSelectionCountrySearchBarBorderColor = it.toInt() }
        (map["idenfyCountrySelectionViewPredefinedCountryContinueButtonTextColor"] as? Number)?.let { scheme.idenfyCountrySelectionViewPredefinedCountryContinueButtonTextColor = it.toInt() }
        (map["idenfyDocumentPhotoResultViewBackgroundColor"] as? Number)?.let { scheme.idenfyDocumentPhotoResultViewBackgroundColor = it.toInt() }
        (map["idenfyDocumentPhotoResultViewTitleTextColor"] as? Number)?.let { scheme.idenfyDocumentPhotoResultViewTitleTextColor = it.toInt() }
        (map["idenfyDocumentPhotoResultViewDescriptionTextColor"] as? Number)?.let { scheme.idenfyDocumentPhotoResultViewDescriptionTextColor = it.toInt() }
        (map["idenfyDocumentPhotoResultViewRetakePhotoButtonTextColor"] as? Number)?.let { scheme.idenfyDocumentPhotoResultViewRetakePhotoButtonTextColor = it.toInt() }
        (map["idenfyDocumentPhotoResultViewNextButtonTextColor"] as? Number)?.let { scheme.idenfyDocumentPhotoResultViewNextButtonTextColor = it.toInt() }
        (map["idenfyDocumentPhotoResultViewPhotoLoadingSpinnerColor"] as? Number)?.let { scheme.idenfyDocumentPhotoResultViewPhotoLoadingSpinnerColor = it.toInt() }
        (map["idenfyDocumentPhotoResultViewPhotoBorderColor"] as? Number)?.let { scheme.idenfyDocumentPhotoResultViewPhotoBorderColor = it.toInt() }
        (map["idenfyDocumentPhotoResultViewAutoCaptureFailureCardImageColor"] as? Number)?.let { scheme.idenfyDocumentPhotoResultViewAutoCaptureFailureCardImageColor = it.toInt() }
        (map["idenfyDocumentPhotoResultViewAutoCaptureFailureCardTitleColor"] as? Number)?.let { scheme.idenfyDocumentPhotoResultViewAutoCaptureFailureCardTitleColor = it.toInt() }
        (map["idenfyDocumentPhotoResultViewAutoCaptureFailureCardBackgroundColor"] as? Number)?.let { scheme.idenfyDocumentPhotoResultViewAutoCaptureFailureCardBackgroundColor = it.toInt() }
        (map["idenfyDocumentPhotoResultViewBlurGlareWarningCardImageColor"] as? Number)?.let { scheme.idenfyDocumentPhotoResultViewBlurGlareWarningCardImageColor = it.toInt() }
        (map["idenfyDocumentPhotoResultViewBlurGlareWarningCardTitleColor"] as? Number)?.let { scheme.idenfyDocumentPhotoResultViewBlurGlareWarningCardTitleColor = it.toInt() }
        (map["idenfyDocumentPhotoResultViewBlurGlareWarningCardBackgroundColor"] as? Number)?.let { scheme.idenfyDocumentPhotoResultViewBlurGlareWarningCardBackgroundColor = it.toInt() }
        (map["idenfyEmailSMSVerificationViewBackgroundColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationViewBackgroundColor = it.toInt() }
        (map["idenfyEmailSMSVerificationCommonInformationTitleTextColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationCommonInformationTitleTextColor = it.toInt() }
        (map["idenfyEmailSMSVerificationCommonInformationDescriptionTextColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationCommonInformationDescriptionTextColor = it.toInt() }
        (map["idenfyEmailSMSVerificationPinCodeTextColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationPinCodeTextColor = it.toInt() }
        (map["idenfyEmailSMSVerificationCodeInputRetryContainerBorderColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationCodeInputRetryContainerBorderColor = it.toInt() }
        (map["idenfyEmailSMSVerificationCodeInputRetryContainerBackgroundColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationCodeInputRetryContainerBackgroundColor = it.toInt() }
        (map["idenfyEmailSMSVerificationCodeInputFailedContainerBorderColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationCodeInputFailedContainerBorderColor = it.toInt() }
        (map["idenfyEmailSMSVerificationCodeInputFailedContainerBackgroundColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationCodeInputFailedContainerBackgroundColor = it.toInt() }
        (map["idenfyEmailSMSVerificationCodeInputSuccessContainerBorderColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationCodeInputSuccessContainerBorderColor = it.toInt() }
        (map["idenfyEmailSMSVerificationCodeInputSuccessContainerBackgroundColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationCodeInputSuccessContainerBackgroundColor = it.toInt() }
        (map["idenfyEmailSMSVerificationViewCodeStatusTitleTextColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationViewCodeStatusTitleTextColor = it.toInt() }
        (map["idenfyEmailSMSVerificationViewCodeFailedStatusImageTintColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationViewCodeFailedStatusImageTintColor = it.toInt() }
        (map["idenfyEmailSMSVerificationViewCodeSuccessStatusImageTintColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationViewCodeSuccessStatusImageTintColor = it.toInt() }
        (map["idenfyEmailSMSVerificationViewCodeExpirationTitleTextColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationViewCodeExpirationTitleTextColor = it.toInt() }
        (map["idenfyEmailSMSVerificationViewResendCodeTitleTextColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationViewResendCodeTitleTextColor = it.toInt() }
        (map["idenfyEmailSMSVerificationViewResendCodeTitleDisabledTextColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationViewResendCodeTitleDisabledTextColor = it.toInt() }
        (map["idenfyEmailSMSVerificationViewVerifyEmailSMSContainerBorderColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationViewVerifyEmailSMSContainerBorderColor = it.toInt() }
        (map["idenfyEmailSMSVerificationViewVerifyEmailSMSContainerBackgroundColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationViewVerifyEmailSMSContainerBackgroundColor = it.toInt() }
        (map["idenfyEmailSMSVerificationVerifyEmailSMSContainerTitleTextColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationVerifyEmailSMSContainerTitleTextColor = it.toInt() }
        (map["idenfyEmailSMSVerificationVerifyEmailSMSContainerDescriptionTextColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationVerifyEmailSMSContainerDescriptionTextColor = it.toInt() }
        (map["idenfyEmailSMSVerificationViewVerifyEmailSMSContainerImageTintColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationViewVerifyEmailSMSContainerImageTintColor = it.toInt() }
        (map["idenfyEmailSMSVerificationEmailSMSInputEditTextBorderColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationEmailSMSInputEditTextBorderColor = it.toInt() }
        (map["idenfyEmailSMSVerificationEmailSMSInputEditTextBackgroundColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationEmailSMSInputEditTextBackgroundColor = it.toInt() }
        (map["idenfyEmailSMSVerificationViewEmailSMSInputEditTextTitleColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationViewEmailSMSInputEditTextTitleColor = it.toInt() }
        (map["idenfyEmailSMSVerificationViewEmailSMSInputEditTextHintColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationViewEmailSMSInputEditTextHintColor = it.toInt() }
        (map["idenfyEmailSMSVerificationViewEmailSMSInputFieldErrorMessageTextColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationViewEmailSMSInputFieldErrorMessageTextColor = it.toInt() }
        (map["idenfyEmailSMSVerificationContinueButtonTextColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationContinueButtonTextColor = it.toInt() }
        (map["idenfyEmailSMSVerificationContinueButtonDisabledTextColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationContinueButtonDisabledTextColor = it.toInt() }
        (map["idenfyEmailSMSVerificationViewContinueButtonDisabledBackgroundColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationViewContinueButtonDisabledBackgroundColor = it.toInt() }
        (map["idenfyEmailSMSVerificationContinueButtonEnabledTextColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationContinueButtonEnabledTextColor = it.toInt() }
        (map["idenfyEmailSMSVerificationContinueButtonLoadingSpinnerTintColor"] as? Number)?.let { scheme.idenfyEmailSMSVerificationContinueButtonLoadingSpinnerTintColor = it.toInt() }
        (map["idenfyFacePhotoResultViewBackgroundColor"] as? Number)?.let { scheme.idenfyFacePhotoResultViewBackgroundColor = it.toInt() }
        (map["idenfyFacePhotoResultViewTitleTextColor"] as? Number)?.let { scheme.idenfyFacePhotoResultViewTitleTextColor = it.toInt() }
        (map["idenfyFacePhotoResultViewDescriptionTextColor"] as? Number)?.let { scheme.idenfyFacePhotoResultViewDescriptionTextColor = it.toInt() }
        (map["idenfyFacePhotoResultViewRetakePhotoButtonTextColor"] as? Number)?.let { scheme.idenfyFacePhotoResultViewRetakePhotoButtonTextColor = it.toInt() }
        (map["idenfyFacePhotoResultViewNextButtonTextColor"] as? Number)?.let { scheme.idenfyFacePhotoResultViewNextButtonTextColor = it.toInt() }
        (map["idenfyFacePhotoResultViewPhotoLoadingSpinnerColor"] as? Number)?.let { scheme.idenfyFacePhotoResultViewPhotoLoadingSpinnerColor = it.toInt() }
        (map["idenfyFacePhotoResultViewPhotoBorderColor"] as? Number)?.let { scheme.idenfyFacePhotoResultViewPhotoBorderColor = it.toInt() }
        (map["idenfyPhotoResultCardTitleColor"] as? Number)?.toInt()?.let { color ->
            scheme.idenfyDocumentPhotoResultViewCardTitleColor = color
            scheme.idenfyFacePhotoResultViewCardTitleColor = color
        }
        (map["idenfyContinueButtonTextColor"] as? Number)?.toInt()?.let { color ->
            scheme.idenfyDocumentSelectionViewContinueButtonEnabledTextColor = color
            scheme.idenfyDocumentSelectionViewContinueButtonDisabledTextColor = color
            scheme.idenfyCountryAndDocumentSelectionViewContinueButtonEnabledTextColor = color
            scheme.idenfyCountryAndDocumentSelectionViewContinueButtonDisabledTextColor = color
            scheme.idenfyCountrySelectionViewPredefinedCountryContinueButtonTextColor = color
            scheme.idenfyCameraStaticOnBoardingViewEnabledButtonTitleColor = color
            scheme.idenfyCameraStaticOnBoardingViewDisabledButtonTitleColor = color
            scheme.idenfyPrivacyPolicyContinueButtonTextColor = color
            scheme.idenfyIdentificationResultsViewRetakeButtonTextColor = color
            scheme.idenfyIdentificationResultsViewInstructionsAlertContinueButtonTextColorV2 = color
            scheme.idenfyIdentificationResultsViewDocNotFoundAlertContinueButtonTextColorV2 = color
            scheme.idenfyIdentificationResultsViewMrzNotFoundAlertContinueButtonTextColorV2 = color
            scheme.idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonEnabledTextColorV2 = color
            scheme.idenfyIdentificationResultsViewMismatchTagsFoundAlertContinueButtonDisabledTextColorV2 = color
            scheme.idenfyIdentificationSuspectedResultsViewContinueButtonTitleColor = color
            scheme.idenfyFaceAuthenticationResultsContinueButtonTextColor = color
            scheme.idenfyManualReviewingStatusApprovedContinueButtonTextColor = color
            scheme.idenfyManualReviewingStatusFailedContinueButtonTextColor = color
            scheme.idenfyNFCReadingTimeOutContinueButtonTextColor = color
            scheme.idenfyNFCRequiredContinueButtonTextColor = color
            scheme.idenfyQuestionnaireViewContinueButtonEnabledTextColor = color
            scheme.idenfyQuestionnaireViewContinueButtonDisabledTextColor = color
            scheme.idenfyBankVerificationContinueButtonTextColor = color
            scheme.idenfyBankVerificationContinueButtonEnabledTextColor = color
            scheme.idenfyBankVerificationContinueButtonDisabledTextColor = color
            scheme.idenfyEmailSMSVerificationContinueButtonTextColor = color
            scheme.idenfyEmailSMSVerificationContinueButtonEnabledTextColor = color
            scheme.idenfyEmailSMSVerificationContinueButtonDisabledTextColor = color
            scheme.idenfyAdditionalSupportContinueButtonTextColor = color
            scheme.idenfyMFACaptchaMethodViewContinueButtonTextColor = color
            scheme.idenfyMFAGeneralViewContinueButtonTextColor = color
            scheme.idenfyMFAMethodSelectionViewContinueButtonTextColor = color
            scheme.idenfyProviderLoginViewContinueButtonTextColor = color
            scheme.idenfyEIDSessionViewContinueButtonEnabledTextColor = color
            scheme.idenfyEIDSessionViewContinueButtonDisabledTextColor = color
            scheme.idenfyDocumentPhotoResultViewNextButtonTextColor = color
            scheme.idenfyFacePhotoResultViewNextButtonTextColor = color
            scheme.idenfyUploadPhotoViewContinuePhotoButtonTextColor = color
        }
        (map["idenfyRetakeButtonTextColor"] as? Number)?.toInt()?.let { color ->
            scheme.idenfyDocumentPhotoResultViewRetakePhotoButtonTextColor = color
            scheme.idenfyFacePhotoResultViewRetakePhotoButtonTextColor = color
            scheme.idenfyUploadPhotoViewChooseAnotherPhotoButtonTextColor = color
            scheme.idenfyIdentificationResultsViewMrzNotFoundAlertBackButtonTextColorV2 = color
        }
        (map["idenfyContinueButtonSpinnerColor"] as? Number)?.toInt()?.let { color ->
            scheme.idenfyPrivacyPolicyContinueButtonLoadingSpinnerTintColor = color
            scheme.idenfyCountryAndDocumentSelectionViewContinueButtonLoadingSpinnerTintColor = color
            scheme.idenfyBankVerificationViewContinueButtonLoadingSpinnerTintColor = color
            scheme.idenfyEmailSMSVerificationContinueButtonLoadingSpinnerTintColor = color
            scheme.idenfyMFACaptchaMethodViewContinueButtonLoadingSpinnerColor = color
            scheme.idenfyMFAGeneralViewContinueButtonLoadingSpinnerTintColor = color
            scheme.idenfyMFAMethodSelectionViewContinueButtonLoadingSpinnerTintColor = color
            scheme.idenfyProviderLoginViewContinueButtonLoadingSpinnerTintColor = color
            scheme.idenfyEIDSessionViewButtonLoadingSpinnerTintColor = color
        }
        (map["idenfyMFACaptchaMethodViewBackgroundColor"] as? Number)?.let { scheme.idenfyMFACaptchaMethodViewBackgroundColor = it.toInt() }
        (map["idenfyMFACaptchaMethodViewTitleTextColor"] as? Number)?.let { scheme.idenfyMFACaptchaMethodViewTitleTextColor = it.toInt() }
        (map["idenfyMFACaptchaMethodViewDescriptionTextColor"] as? Number)?.let { scheme.idenfyMFACaptchaMethodViewDescriptionTextColor = it.toInt() }
        (map["idenfyMFACaptchaMethodViewCaptchaEditTextBackgroundColor"] as? Number)?.let { scheme.idenfyMFACaptchaMethodViewCaptchaEditTextBackgroundColor = it.toInt() }
        (map["idenfyMFACaptchaMethodViewCaptchaEditTextTitleColor"] as? Number)?.let { scheme.idenfyMFACaptchaMethodViewCaptchaEditTextTitleColor = it.toInt() }
        (map["idenfyMFACaptchaMethodViewCaptchaEditTextBorderColor"] as? Number)?.let { scheme.idenfyMFACaptchaMethodViewCaptchaEditTextBorderColor = it.toInt() }
        (map["idenfyMFACaptchaMethodViewCaptchaEditTextHighlightedBorderColor"] as? Number)?.let { scheme.idenfyMFACaptchaMethodViewCaptchaEditTextHighlightedBorderColor = it.toInt() }
        (map["idenfyMFACaptchaMethodViewCaptchaEditTextHintTitleColor"] as? Number)?.let { scheme.idenfyMFACaptchaMethodViewCaptchaEditTextHintTitleColor = it.toInt() }
        (map["idenfyMFACaptchaMethodViewCaptchaEditTextTopHintTitleColor"] as? Number)?.let { scheme.idenfyMFACaptchaMethodViewCaptchaEditTextTopHintTitleColor = it.toInt() }
        (map["idenfyMFACaptchaMethodViewContinueButtonTextColor"] as? Number)?.let { scheme.idenfyMFACaptchaMethodViewContinueButtonTextColor = it.toInt() }
        (map["idenfyMFACaptchaMethodViewContinueButtonLoadingSpinnerColor"] as? Number)?.let { scheme.idenfyMFACaptchaMethodViewContinueButtonLoadingSpinnerColor = it.toInt() }
        (map["idenfyMFAGeneralViewBackgroundColor"] as? Number)?.let { scheme.idenfyMFAGeneralViewBackgroundColor = it.toInt() }
        (map["idenfyMFAGeneralViewTitleTextColor"] as? Number)?.let { scheme.idenfyMFAGeneralViewTitleTextColor = it.toInt() }
        (map["idenfyMFAGeneralViewDescriptionTextColor"] as? Number)?.let { scheme.idenfyMFAGeneralViewDescriptionTextColor = it.toInt() }
        (map["idenfyMFAGeneralViewEditTextBackgroundColor"] as? Number)?.let { scheme.idenfyMFAGeneralViewEditTextBackgroundColor = it.toInt() }
        (map["idenfyMFAGeneralViewEditTextTitleColor"] as? Number)?.let { scheme.idenfyMFAGeneralViewEditTextTitleColor = it.toInt() }
        (map["idenfyMFAGeneralViewEditTextBorderColor"] as? Number)?.let { scheme.idenfyMFAGeneralViewEditTextBorderColor = it.toInt() }
        (map["idenfyMFAGeneralViewEditTextHighlightedBorderColor"] as? Number)?.let { scheme.idenfyMFAGeneralViewEditTextHighlightedBorderColor = it.toInt() }
        (map["idenfyMFAGeneralViewEditTextHintTitleColor"] as? Number)?.let { scheme.idenfyMFAGeneralViewEditTextHintTitleColor = it.toInt() }
        (map["idenfyMFAGeneralViewEditTextTopHintTitleColor"] as? Number)?.let { scheme.idenfyMFAGeneralViewEditTextTopHintTitleColor = it.toInt() }
        (map["idenfyMFAGeneralViewContinueButtonTextColor"] as? Number)?.let { scheme.idenfyMFAGeneralViewContinueButtonTextColor = it.toInt() }
        (map["idenfyMFAGeneralViewContinueButtonLoadingSpinnerTintColor"] as? Number)?.let { scheme.idenfyMFAGeneralViewContinueButtonLoadingSpinnerTintColor = it.toInt() }
        (map["idenfyMFAMethodSelectionViewBackgroundColor"] as? Number)?.let { scheme.idenfyMFAMethodSelectionViewBackgroundColor = it.toInt() }
        (map["idenfyMFAMethodSelectionViewTitleTextColor"] as? Number)?.let { scheme.idenfyMFAMethodSelectionViewTitleTextColor = it.toInt() }
        (map["idenfyMFAMethodSelectionViewDescriptionTextColor"] as? Number)?.let { scheme.idenfyMFAMethodSelectionViewDescriptionTextColor = it.toInt() }
        (map["idenfyMFAMethodSelectionViewTopHintTitleColor"] as? Number)?.let { scheme.idenfyMFAMethodSelectionViewTopHintTitleColor = it.toInt() }
        (map["idenfyMFAMethodSelectionViewContinueButtonTextColor"] as? Number)?.let { scheme.idenfyMFAMethodSelectionViewContinueButtonTextColor = it.toInt() }
        (map["idenfyMFAMethodSelectionViewContinueButtonLoadingSpinnerTintColor"] as? Number)?.let { scheme.idenfyMFAMethodSelectionViewContinueButtonLoadingSpinnerTintColor = it.toInt() }
        (map["idenfyProviderLoginViewBackgroundColor"] as? Number)?.let { scheme.idenfyProviderLoginViewBackgroundColor = it.toInt() }
        (map["idenfyProviderLoginViewTitleTextColor"] as? Number)?.let { scheme.idenfyProviderLoginViewTitleTextColor = it.toInt() }
        (map["idenfyProviderLoginViewDescriptionTextColor"] as? Number)?.let { scheme.idenfyProviderLoginViewDescriptionTextColor = it.toInt() }
        (map["idenfyProviderLoginViewUsernameAndPasswordEditTextBackgroundColor"] as? Number)?.let { scheme.idenfyProviderLoginViewUsernameAndPasswordEditTextBackgroundColor = it.toInt() }
        (map["idenfyProviderLoginViewUsernameAndPasswordEditTextTitleColor"] as? Number)?.let { scheme.idenfyProviderLoginViewUsernameAndPasswordEditTextTitleColor = it.toInt() }
        (map["idenfyProviderLoginViewUsernameAndPasswordEditTextBorderColor"] as? Number)?.let { scheme.idenfyProviderLoginViewUsernameAndPasswordEditTextBorderColor = it.toInt() }
        (map["idenfyProviderLoginViewUsernameAndPasswordEditTextHighlightedBorderColor"] as? Number)?.let { scheme.idenfyProviderLoginViewUsernameAndPasswordEditTextHighlightedBorderColor = it.toInt() }
        (map["idenfyProviderLoginViewUsernameAndPasswordEditTextHintTitleColor"] as? Number)?.let { scheme.idenfyProviderLoginViewUsernameAndPasswordEditTextHintTitleColor = it.toInt() }
        (map["idenfyProviderLoginViewUsernameAndPasswordEditTextTopHintTitleColor"] as? Number)?.let { scheme.idenfyProviderLoginViewUsernameAndPasswordEditTextTopHintTitleColor = it.toInt() }
        (map["idenfyProviderLoginViewContinueButtonTextColor"] as? Number)?.let { scheme.idenfyProviderLoginViewContinueButtonTextColor = it.toInt() }
        (map["idenfyProviderLoginViewContinueButtonLoadingSpinnerTintColor"] as? Number)?.let { scheme.idenfyProviderLoginViewContinueButtonLoadingSpinnerTintColor = it.toInt() }
        (map["idenfyProviderSelectionViewBackgroundColor"] as? Number)?.let { scheme.idenfyProviderSelectionViewBackgroundColor = it.toInt() }
        (map["idenfyProviderSelectionViewTitleTextColor"] as? Number)?.let { scheme.idenfyProviderSelectionViewTitleTextColor = it.toInt() }
        (map["idenfyProviderSelectionViewDescriptionTextColor"] as? Number)?.let { scheme.idenfyProviderSelectionViewDescriptionTextColor = it.toInt() }
        (map["idenfyProviderSelectionViewProviderSearchBarBackgroundColor"] as? Number)?.let { scheme.idenfyProviderSelectionViewProviderSearchBarBackgroundColor = it.toInt() }
        (map["idenfyProviderSelectionViewProviderSearchBarHighlightedTextColor"] as? Number)?.let { scheme.idenfyProviderSelectionViewProviderSearchBarHighlightedTextColor = it.toInt() }
        (map["idenfyProviderSelectionViewProviderSearchBarTextColor"] as? Number)?.let { scheme.idenfyProviderSelectionViewProviderSearchBarTextColor = it.toInt() }
        (map["idenfyProviderSelectionViewProviderRecyclerViewBackgroundColor"] as? Number)?.let { scheme.idenfyProviderSelectionViewProviderRecyclerViewBackgroundColor = it.toInt() }
        (map["idenfyProviderSelectionViewProviderRecyclerViewBorderColor"] as? Number)?.let { scheme.idenfyProviderSelectionViewProviderRecyclerViewBorderColor = it.toInt() }
        (map["idenfyProviderSelectionViewProviderRecyclerViewItemBackgroundColor"] as? Number)?.let { scheme.idenfyProviderSelectionViewProviderRecyclerViewItemBackgroundColor = it.toInt() }
        (map["idenfyProviderSelectionViewProviderRecyclerViewItemBorderColor"] as? Number)?.let { scheme.idenfyProviderSelectionViewProviderRecyclerViewItemBorderColor = it.toInt() }
        (map["idenfyProviderSelectionViewProviderRecyclerViewItemTextColor"] as? Number)?.let { scheme.idenfyProviderSelectionViewProviderRecyclerViewItemTextColor = it.toInt() }
        (map["idenfyProviderSelectionViewProviderRecyclerViewItemHighlightedTextColor"] as? Number)?.let { scheme.idenfyProviderSelectionViewProviderRecyclerViewItemHighlightedTextColor = it.toInt() }
        (map["idenfyProviderSelectionViewProviderRecyclerViewItemHighlightedBackgroundColor"] as? Number)?.let { scheme.idenfyProviderSelectionViewProviderRecyclerViewItemHighlightedBackgroundColor = it.toInt() }
        (map["idenfyProviderViewSelectionProviderSearchBarBorderColor"] as? Number)?.let { scheme.idenfyProviderViewSelectionProviderSearchBarBorderColor = it.toInt() }
        (map["idenfyProviderSelectionViewProviderRecyclerViewItemLoadingSpinnerTintColor"] as? Number)?.let { scheme.idenfyProviderSelectionViewProviderRecyclerViewItemLoadingSpinnerTintColor = it.toInt() }
        (map["idenfyAdditionalSupportViewBackgroundColor"] as? Number)?.let { scheme.idenfyAdditionalSupportViewBackgroundColor = it.toInt() }
        (map["idenfyAdditionalSupportCommonInformationTitleTextColor"] as? Number)?.let { scheme.idenfyAdditionalSupportCommonInformationTitleTextColor = it.toInt() }
        (map["idenfyAdditionalSupportCommonInformationDescriptionTextColor"] as? Number)?.let { scheme.idenfyAdditionalSupportCommonInformationDescriptionTextColor = it.toInt() }
        (map["idenfyAdditionalSupportContinueButtonTextColor"] as? Number)?.let { scheme.idenfyAdditionalSupportContinueButtonTextColor = it.toInt() }
        (map["idenfyCountryAndDocumentSelectionViewBackgroundColor"] as? Number)?.let { scheme.idenfyCountryAndDocumentSelectionViewBackgroundColor = it.toInt() }
        (map["idenfyCountryAndDocumentSelectionViewTitleTextColor"] as? Number)?.let { scheme.idenfyCountryAndDocumentSelectionViewTitleTextColor = it.toInt() }
        (map["idenfyCountryAndDocumentSelectionViewDescriptionTextColor"] as? Number)?.let { scheme.idenfyCountryAndDocumentSelectionViewDescriptionTextColor = it.toInt() }
        (map["idenfyCountryAndDocumentSelectionViewItemSelectionBorderColor"] as? Number)?.let { scheme.idenfyCountryAndDocumentSelectionViewItemSelectionBorderColor = it.toInt() }
        (map["idenfyCountryAndDocumentSelectionViewItemSelectionBackgroundColor"] as? Number)?.let { scheme.idenfyCountryAndDocumentSelectionViewItemSelectionBackgroundColor = it.toInt() }
        (map["idenfyCountryAndDocumentSelectionViewItemSelectionTextColor"] as? Number)?.let { scheme.idenfyCountryAndDocumentSelectionViewItemSelectionTextColor = it.toInt() }
        (map["idenfyCountryAndDocumentSelectionViewItemSelectionTrailingIconTintColor"] as? Number)?.let { scheme.idenfyCountryAndDocumentSelectionViewItemSelectionTrailingIconTintColor = it.toInt() }
        (map["idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedBorderColor"] as? Number)?.let { scheme.idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedBorderColor = it.toInt() }
        (map["idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedBackgroundColor"] as? Number)?.let { scheme.idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedBackgroundColor = it.toInt() }
        (map["idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedTextColor"] as? Number)?.let { scheme.idenfyCountryAndDocumentSelectionViewItemSelectionHighlightedTextColor = it.toInt() }
        (map["idenfyCountryAndDocumentSelectionViewContinueButtonDisabledBackgroundColor"] as? Number)?.let { scheme.idenfyCountryAndDocumentSelectionViewContinueButtonDisabledBackgroundColor = it.toInt() }
        (map["idenfyCountryAndDocumentSelectionViewContinueButtonDisabledTextColor"] as? Number)?.let { scheme.idenfyCountryAndDocumentSelectionViewContinueButtonDisabledTextColor = it.toInt() }
        (map["idenfyCountryAndDocumentSelectionViewContinueButtonEnabledTextColor"] as? Number)?.let { scheme.idenfyCountryAndDocumentSelectionViewContinueButtonEnabledTextColor = it.toInt() }
        (map["idenfyCountryAndDocumentSelectionViewContinueButtonLoadingSpinnerTintColor"] as? Number)?.let { scheme.idenfyCountryAndDocumentSelectionViewContinueButtonLoadingSpinnerTintColor = it.toInt() }
        (map["idenfyCountryAndDocumentSelectionViewPhysicalDocumentTitleDividerColor"] as? Number)?.let { scheme.idenfyCountryAndDocumentSelectionViewPhysicalDocumentTitleDividerColor = it.toInt() }
        (map["idenfyDocumentCameraPreviewSessionBackgroundColor"] as? Number)?.let { scheme.idenfyDocumentCameraPreviewSessionBackgroundColor = it.toInt() }
        (map["idenfyDocumentCameraPreviewSessionBottomActionButtonsViewBackgroundColor"] as? Number)?.let { scheme.idenfyDocumentCameraPreviewSessionBottomActionButtonsViewBackgroundColor = it.toInt() }
        (map["idenfyDocumentCameraPreviewSessionTakePhotoButtonUnFocusedTintColor"] as? Number)?.let { scheme.idenfyDocumentCameraPreviewSessionTakePhotoButtonUnFocusedTintColor = it.toInt() }
        (map["idenfyDocumentCameraPreviewSessionTakePhotoButtonFocusedTintColor"] as? Number)?.let { scheme.idenfyDocumentCameraPreviewSessionTakePhotoButtonFocusedTintColor = it.toInt() }
        (map["idenfyDocumentCameraPreviewSessionTakePhotoButtonUnFocusedBackgroundColor"] as? Number)?.let { scheme.idenfyDocumentCameraPreviewSessionTakePhotoButtonUnFocusedBackgroundColor = it.toInt() }
        (map["idenfyDocumentCameraPreviewSessionTakePhotoButtonFocusedBackgroundColor"] as? Number)?.let { scheme.idenfyDocumentCameraPreviewSessionTakePhotoButtonFocusedBackgroundColor = it.toInt() }
        (map["idenfyDocumentCameraPreviewSessionAcceptedDocumentsSelectedCountryHighlightColor"] as? Number)?.let { scheme.idenfyDocumentCameraPreviewSessionAcceptedDocumentsSelectedCountryHighlightColor = it.toInt() }
        (map["idenfyDocumentCameraPreviewTitleTextColor"] as? Number)?.let { scheme.idenfyDocumentCameraPreviewTitleTextColor = it.toInt() }
        (map["idenfyDocumentCameraPreviewDescriptionTextColor"] as? Number)?.let { scheme.idenfyDocumentCameraPreviewDescriptionTextColor = it.toInt() }
        (map["idenfyPrivacyPolicyViewBackgroundColor"] as? Number)?.let { scheme.idenfyPrivacyPolicyViewBackgroundColor = it.toInt() }
        (map["idenfyPrivacyPolicyCommonInformationTitleTextColor"] as? Number)?.let { scheme.idenfyPrivacyPolicyCommonInformationTitleTextColor = it.toInt() }
        (map["idenfyPrivacyPolicyCommonInformationDescriptionTextColor"] as? Number)?.let { scheme.idenfyPrivacyPolicyCommonInformationDescriptionTextColor = it.toInt() }
        (map["idenfyPrivacyPolicyCardViewTextColor"] as? Number)?.let { scheme.idenfyPrivacyPolicyCardViewTextColor = it.toInt() }
        (map["idenfyPrivacyPolicyCardViewBackgroundColor"] as? Number)?.let { scheme.idenfyPrivacyPolicyCardViewBackgroundColor = it.toInt() }
        (map["idenfyPrivacyPolicyCardViewArrowIconTintColor"] as? Number)?.let { scheme.idenfyPrivacyPolicyCardViewArrowIconTintColor = it.toInt() }
        (map["idenfyPrivacyPolicyCardViewIconTintColor"] as? Number)?.let { scheme.idenfyPrivacyPolicyCardViewIconTintColor = it.toInt() }
        (map["idenfyPrivacyPolicyContinueButtonTextColor"] as? Number)?.let { scheme.idenfyPrivacyPolicyContinueButtonTextColor = it.toInt() }
        (map["idenfyPrivacyPolicyContinueButtonLoadingSpinnerTintColor"] as? Number)?.let { scheme.idenfyPrivacyPolicyContinueButtonLoadingSpinnerTintColor = it.toInt() }
        (map["idenfyPartnerPrivacyPolicyDialogViewBackgroundColor"] as? Number)?.let { scheme.idenfyPartnerPrivacyPolicyDialogViewBackgroundColor = it.toInt() }
        (map["idenfySplashScreenViewTitleTextColor"] as? Number)?.let { scheme.idenfySplashScreenViewTitleTextColor = it.toInt() }
        (map["idenfySplashScreenViewDescriptionTextColor"] as? Number)?.let { scheme.idenfySplashScreenViewDescriptionTextColor = it.toInt() }
        (map["idenfySplashScreenViewLoadingSpinnerTintColor"] as? Number)?.let { scheme.idenfySplashScreenViewLoadingSpinnerTintColor = it.toInt() }
        (map["idenfyBottomSheetBackgroundColor"] as? Number)?.let { scheme.idenfyBottomSheetBackgroundColor = it.toInt() }
        (map["idenfyBottomSheetDragHandleColor"] as? Number)?.let { scheme.idenfyBottomSheetDragHandleColor = it.toInt() }
        (map["idenfyBottomSheetButtonTextColor"] as? Number)?.let { scheme.idenfyBottomSheetButtonTextColor = it.toInt() }
        (map["idenfyBottomSheetTitleTextColor"] as? Number)?.let { scheme.idenfyBottomSheetTitleTextColor = it.toInt() }
        (map["idenfyBottomSheetDateTimePickerAccentColor"] as? Number)?.let { scheme.idenfyBottomSheetDateTimePickerAccentColor = it.toInt() }
        (map["idenfyBottomSheetDateTimePickerActivatedColor"] as? Number)?.let { scheme.idenfyBottomSheetDateTimePickerActivatedColor = it.toInt() }
        (map["idenfyBottomSheetDateTimePickerHighlightColor"] as? Number)?.let { scheme.idenfyBottomSheetDateTimePickerHighlightColor = it.toInt() }
        (map["idenfyCustomAlertDialogNegativeButtonColor"] as? Number)?.let { scheme.idenfyCustomAlertDialogNegativeButtonColor = it.toInt() }
        (map["idenfyCustomAlertDialogBackgroundColor"] as? Number)?.let { scheme.idenfyCustomAlertDialogBackgroundColor = it.toInt() }
        (map["idenfyDefaultAlertDialogBackgroundColor"] as? Number)?.let { scheme.idenfyDefaultAlertDialogBackgroundColor = it.toInt() }
        (map["idenfyDefaultAlertDialogTitleColor"] as? Number)?.let { scheme.idenfyDefaultAlertDialogTitleColor = it.toInt() }
        (map["idenfyDefaultAlertDialogMessageColor"] as? Number)?.let { scheme.idenfyDefaultAlertDialogMessageColor = it.toInt() }
        (map["idenfyDefaultAlertDialogPositiveButtonColor"] as? Number)?.let { scheme.idenfyDefaultAlertDialogPositiveButtonColor = it.toInt() }
        (map["idenfyDefaultAlertDialogNegativeButtonColor"] as? Number)?.let { scheme.idenfyDefaultAlertDialogNegativeButtonColor = it.toInt() }
        (map["idenfyEIDSessionViewBackgroundColor"] as? Number)?.let { scheme.idenfyEIDSessionViewBackgroundColor = it.toInt() }
        (map["idenfyEIDSessionViewTitleTextColor"] as? Number)?.let { scheme.idenfyEIDSessionViewTitleTextColor = it.toInt() }
        (map["idenfyEIDSessionViewDescriptionTextColor"] as? Number)?.let { scheme.idenfyEIDSessionViewDescriptionTextColor = it.toInt() }
        (map["idenfyEIDSessionViewButtonTextColor"] as? Number)?.let { scheme.idenfyEIDSessionViewButtonTextColor = it.toInt() }
        (map["idenfyEIDSessionViewButtonLoadingSpinnerTintColor"] as? Number)?.let { scheme.idenfyEIDSessionViewButtonLoadingSpinnerTintColor = it.toInt() }
        (map["idenfyEIDSessionViewCodeInputEditTextTitleColor"] as? Number)?.let { scheme.idenfyEIDSessionViewCodeInputEditTextTitleColor = it.toInt() }
        (map["idenfyEIDSessionViewCodeInputEditTextHintColor"] as? Number)?.let { scheme.idenfyEIDSessionViewCodeInputEditTextHintColor = it.toInt() }
        (map["idenfyEIDSessionViewCodeInputFieldErrorMessageTextColor"] as? Number)?.let { scheme.idenfyEIDSessionViewCodeInputFieldErrorMessageTextColor = it.toInt() }
        (map["idenfyEIDSessionViewCodeInputFailedContainerBorderColor"] as? Number)?.let { scheme.idenfyEIDSessionViewCodeInputFailedContainerBorderColor = it.toInt() }
        (map["idenfyEIDSessionViewCodeInputFailedContainerBackgroundColor"] as? Number)?.let { scheme.idenfyEIDSessionViewCodeInputFailedContainerBackgroundColor = it.toInt() }
        (map["idenfyEIDSessionViewCodeStatusTitleTextColor"] as? Number)?.let { scheme.idenfyEIDSessionViewCodeStatusTitleTextColor = it.toInt() }
        (map["idenfyEIDSessionViewCodeFailedStatusImageTintColor"] as? Number)?.let { scheme.idenfyEIDSessionViewCodeFailedStatusImageTintColor = it.toInt() }
        (map["idenfyEIDSessionViewCodeHintTextColor"] as? Number)?.let { scheme.idenfyEIDSessionViewCodeHintTextColor = it.toInt() }
        (map["idenfyEIDSessionViewContinueButtonEnabledTextColor"] as? Number)?.let { scheme.idenfyEIDSessionViewContinueButtonEnabledTextColor = it.toInt() }
        (map["idenfyEIDSessionViewContinueButtonDisabledTextColor"] as? Number)?.let { scheme.idenfyEIDSessionViewContinueButtonDisabledTextColor = it.toInt() }
        (map["idenfyEIDSessionViewContinueButtonDisabledBackgroundColor"] as? Number)?.let { scheme.idenfyEIDSessionViewContinueButtonDisabledBackgroundColor = it.toInt() }
        (map["idenfyEIDSessionViewUploadIconTintColor"] as? Number)?.let { scheme.idenfyEIDSessionViewUploadIconTintColor = it.toInt() }
        (map["idenfyEIDSessionViewClickToUploadTextColor"] as? Number)?.let { scheme.idenfyEIDSessionViewClickToUploadTextColor = it.toInt() }
        (map["idenfyEIDSessionViewInputFieldBorderColor"] as? Number)?.let { scheme.idenfyEIDSessionViewInputFieldBorderColor = it.toInt() }
        (map["idenfyEIDSessionViewInputFieldBackgroundColor"] as? Number)?.let { scheme.idenfyEIDSessionViewInputFieldBackgroundColor = it.toInt() }
        return scheme
    }

}