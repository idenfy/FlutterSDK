import 'idenfy_color_scheme.dart';

/// Face authentication settings class
class IdenfyFaceAuthUISettings {
  final bool isLanguageSelectionNeeded;
  final bool skipOnBoardingView;
  final IdenfyColorScheme? idenfyColorScheme;

  IdenfyFaceAuthUISettings(
      {this.isLanguageSelectionNeeded = true,
      this.skipOnBoardingView = false,
      this.idenfyColorScheme});

  Map<String, dynamic> toJson() => {
        'isLanguageSelectionNeeded': isLanguageSelectionNeeded,
        'skipOnBoardingView': skipOnBoardingView,
        'idenfyColorScheme': idenfyColorScheme?.toJson(),
      };
}

/// Face authentication setting builder class
class IdenfyFaceAuthUIBuilder {
  bool isLanguageSelectionNeeded = true;
  bool skipOnBoardingView = false;
  IdenfyColorScheme? idenfyColorScheme;

  IdenfyFaceAuthUIBuilder withLanguageSelection(
      bool isLanguageSelectionNeeded) {
    this.isLanguageSelectionNeeded = isLanguageSelectionNeeded;
    return this;
  }

  IdenfyFaceAuthUIBuilder withOnBoardingView(bool isOnBoardingViewNeeded) {
    this.skipOnBoardingView = !isOnBoardingViewNeeded;
    return this;
  }

  IdenfyFaceAuthUIBuilder withColorScheme(IdenfyColorScheme idenfyColorScheme) {
    this.idenfyColorScheme = idenfyColorScheme;
    return this;
  }

  IdenfyFaceAuthUISettings build() {
    IdenfyFaceAuthUISettings idenfyFaceAuthUISettingsV2 =
        IdenfyFaceAuthUISettings(
            isLanguageSelectionNeeded: isLanguageSelectionNeeded,
            skipOnBoardingView: skipOnBoardingView,
            idenfyColorScheme: idenfyColorScheme);
    return idenfyFaceAuthUISettingsV2;
  }
}
