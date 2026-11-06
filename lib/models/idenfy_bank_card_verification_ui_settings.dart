import 'idenfy_color_scheme.dart';

/// Bank card verification settings class
class IdenfyBankCardVerificationUISettings {
  final IdenfyColorScheme? idenfyColorScheme;

  IdenfyBankCardVerificationUISettings({this.idenfyColorScheme});

  Map<String, dynamic> toJson() => {
        'idenfyColorScheme': idenfyColorScheme?.toJson(),
      };
}

/// Bank card verification setting builder class
class IdenfyBankCardVerificationUIBuilder {
  IdenfyColorScheme? idenfyColorScheme;

  IdenfyBankCardVerificationUIBuilder withColorScheme(
      IdenfyColorScheme idenfyColorScheme) {
    this.idenfyColorScheme = idenfyColorScheme;
    return this;
  }

  IdenfyBankCardVerificationUISettings build() {
    return IdenfyBankCardVerificationUISettings(
        idenfyColorScheme: idenfyColorScheme);
  }
}
