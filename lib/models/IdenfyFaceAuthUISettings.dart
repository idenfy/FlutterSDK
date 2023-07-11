class IdenfyFaceAuthUISettings {
  final bool isLanguageSelectionNeeded;
  final bool skipOnBoardingView;

  IdenfyFaceAuthUISettings(
      {this.isLanguageSelectionNeeded = true, this.skipOnBoardingView = false});

  Map<String, dynamic> toJson() => {
        'isLanguageSelectionNeeded': isLanguageSelectionNeeded,
        'skipOnBoardingView': skipOnBoardingView,
      };
}

class IdenfyFaceAuthUIBuilder {
  bool isLanguageSelectionNeeded = true;
  bool skipOnBoardingView = false;

  IdenfyFaceAuthUIBuilder withLanguageSelection(
      bool isLanguageSelectionNeeded) {
    this.isLanguageSelectionNeeded = isLanguageSelectionNeeded;
    return this;
  }

  IdenfyFaceAuthUIBuilder withOnBoardingView(bool isOnBoardingViewNeeded) {
    this.skipOnBoardingView = !isOnBoardingViewNeeded;
    return this;
  }

  IdenfyFaceAuthUISettings build() {
    IdenfyFaceAuthUISettings idenfyFaceAuthUISettingsV2 =
        IdenfyFaceAuthUISettings(
            isLanguageSelectionNeeded: isLanguageSelectionNeeded,
            skipOnBoardingView: skipOnBoardingView);
    return idenfyFaceAuthUISettingsV2;
  }
}
