import UIKit
import iDenfySDK
import idenfycore

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
                if let enumValue = ["single": 0, "multipleStatic": 1, "none": 2][onBoardingViewType] {
                    if let forcedEnum = IdenfyOnBoardingViewTypeEnum(rawValue: enumValue) {
                        idenfyUISettingsV2 = idenfyUISettingsV2.withOnBoadringViewType(forcedEnum)
                    }
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

            if let skipInternalPrivacyPolicyView = uiSettingsMap["skipInternalPrivacyPolicyView"] as? Bool {
                idenfyUISettingsV2.skipInternalPrivacyPolicyView = skipInternalPrivacyPolicyView
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
            idenfySettings = idenfySettings.withUISettingsV2(idenfyUISettingsV2.build())
        }
        return idenfySettings.withAuthToken(authToken).build()
    }

    static func decodeFaceAuthUISettings(_ json: [String: AnyObject?]?) -> IdenfyFaceAuthUISettings {
        let faceAuthUISettings = IdenfyFaceAuthUISettings()
        if let unwrappedLanguageSelectionNeeded = json?["isLanguageSelectionNeeded"] as? Bool {
            faceAuthUISettings.isLanguageSelectionNeeded = unwrappedLanguageSelectionNeeded
        }
        if let unwrappedSkipOnBoardingView = json?["skipOnBoardingView"] as? Bool {
            faceAuthUISettings.skipOnBoardingView = unwrappedSkipOnBoardingView
        }
        return faceAuthUISettings
    }
}
