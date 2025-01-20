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
            if (uiSettingsMap["skipInternalPrivacyPolicyView"] as? Boolean != null) {
                idenfyUISettingsV2.skipInternalPrivacyPolicyView =
                    uiSettingsMap["skipInternalPrivacyPolicyView"] as Boolean
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
        return faceAuthUISettings
    }

    private fun String.camelToSnakeCase(): String {
        return "(?<=[a-zA-Z])[A-Z]".toRegex().replace(this) {
            "_${it.value}"
        }.uppercase()
    }
}