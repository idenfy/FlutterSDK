import 'document_camera_frame_visibility.dart';
import 'idenfy_document_selection_type.dart';
import 'idenfy_identification_results_ui_settings.dart';
import 'idenfy_instructions_enum.dart';
import 'idenfy_onboarding_view_type.dart';
import 'immediate_redirect_enum.dart';

/// Idenfy UI settings class
class IdenfyUISettings {
  final bool? isAdditionalSupportEnabled;
  final IdenfyOnBoardingViewType? idenfyOnBoardingViewType;
  final IdenfyDocumentSelectionType? idenfyDocumentSelectionType;
  final bool? isLanguageSelectionNeeded;
  final IdenfyInstructionsEnum? idenfyInstructionsEnum;
  final IdenfyIdentificationResultsUISettingsV2?
      idenfyIdentificationResultsUISettingsV2;
  final ImmediateRedirectEnum? immediateRedirectEnum;
  final bool? skipInternalPrivacyPolicyView;
  final DocumentCameraFrameVisibility? documentCameraFrameVisibility;

  IdenfyUISettings(
      {this.isAdditionalSupportEnabled,
      this.idenfyOnBoardingViewType,
      this.idenfyDocumentSelectionType,
      this.isLanguageSelectionNeeded,
      this.idenfyInstructionsEnum,
      this.idenfyIdentificationResultsUISettingsV2,
      this.immediateRedirectEnum,
      this.skipInternalPrivacyPolicyView,
      this.documentCameraFrameVisibility});

  Map<String, dynamic> toJson() => {
        'isAdditionalSupportEnabled': isAdditionalSupportEnabled,
        'idenfyOnBoardingViewType': idenfyOnBoardingViewType?.name,
        'idenfyDocumentSelectionType': idenfyDocumentSelectionType?.name,
        'isLanguageSelectionNeeded': isLanguageSelectionNeeded,
        'idenfyInstructionsEnum': idenfyInstructionsEnum?.name,
        'idenfyIdentificationResultsUISettingsV2':
            idenfyIdentificationResultsUISettingsV2?.toJson(),
        'immediateRedirectEnum': immediateRedirectEnum?.name,
        'skipInternalPrivacyPolicyView': skipInternalPrivacyPolicyView,
        'documentCameraFrameVisibility': documentCameraFrameVisibility?.toJson()
      };
}

/// Idenfy UI setting builder class
class IdenfyUIBuilder {
  bool? isAdditionalSupportEnabled;
  IdenfyOnBoardingViewType? idenfyOnBoardingViewType;
  IdenfyDocumentSelectionType? idenfyDocumentSelectionType;
  bool? isLanguageSelectionNeeded;
  IdenfyInstructionsEnum? idenfyInstructionsEnum;
  IdenfyIdentificationResultsUISettingsV2?
      idenfyIdentificationResultsUISettingsV2;
  ImmediateRedirectEnum? immediateRedirectEnum;
  bool? skipInternalPrivacyPolicyView;
  DocumentCameraFrameVisibility? documentCameraFrameVisibility;

  IdenfyUIBuilder withAdditionalSupportView(bool isAdditionalSupportEnabled) {
    this.isAdditionalSupportEnabled = isAdditionalSupportEnabled;
    return this;
  }

  IdenfyUIBuilder withOnBoardingViewType(
      IdenfyOnBoardingViewType idenfyOnBoardingViewType) {
    this.idenfyOnBoardingViewType = idenfyOnBoardingViewType;
    return this;
  }

  IdenfyUIBuilder withIdenfyDocumentSelectionType(
      IdenfyDocumentSelectionType idenfyDocumentSelectionType) {
    this.idenfyDocumentSelectionType = idenfyDocumentSelectionType;
    return this;
  }

  IdenfyUIBuilder withLanguageSelection(bool isLanguageSelectionNeeded) {
    this.isLanguageSelectionNeeded = isLanguageSelectionNeeded;
    return this;
  }

  IdenfyUIBuilder withInstructions(
      IdenfyInstructionsEnum idenfyInstructionsEnum) {
    this.idenfyInstructionsEnum = idenfyInstructionsEnum;
    return this;
  }

  IdenfyUIBuilder withIdenfyIdentificationResultsUISettingsV2(
      IdenfyIdentificationResultsUISettingsV2
          idenfyIdentificationResultsUISettingsV2) {
    this.idenfyIdentificationResultsUISettingsV2 =
        idenfyIdentificationResultsUISettingsV2;
    return this;
  }

  IdenfyUIBuilder withImmediateRedirect(
      ImmediateRedirectEnum immediateRedirectEnum) {
    this.immediateRedirectEnum = immediateRedirectEnum;
    return this;
  }

  IdenfyUIBuilder withSkipInternalPrivacyPolicy(
      bool skipInternalPrivacyPolicyView) {
    this.skipInternalPrivacyPolicyView = skipInternalPrivacyPolicyView;
    return this;
  }

  IdenfyUIBuilder withDocumentCameraFrameVisibility(
      DocumentCameraFrameVisibility documentCameraFrameVisibility) {
    this.documentCameraFrameVisibility = documentCameraFrameVisibility;
    return this;
  }

  IdenfyUISettings build() {
    IdenfyUISettings idenfyUISettings = IdenfyUISettings(
        isAdditionalSupportEnabled: isAdditionalSupportEnabled,
        idenfyOnBoardingViewType: idenfyOnBoardingViewType,
        idenfyDocumentSelectionType: idenfyDocumentSelectionType,
        isLanguageSelectionNeeded: isLanguageSelectionNeeded,
        idenfyInstructionsEnum: idenfyInstructionsEnum,
        idenfyIdentificationResultsUISettingsV2:
            idenfyIdentificationResultsUISettingsV2,
        immediateRedirectEnum: immediateRedirectEnum,
        skipInternalPrivacyPolicyView: skipInternalPrivacyPolicyView,
        documentCameraFrameVisibility: documentCameraFrameVisibility);
    return idenfyUISettings;
  }
}
