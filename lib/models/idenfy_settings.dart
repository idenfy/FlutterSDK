import 'idenfy_locale_enum.dart';
import 'idenfy_ui_settings.dart';

/// Idenfy settings class
class IdenfySettings {
  final bool? sslPinning;
  final IdenfyLocaleEnum? selectedLocale;
  final IdenfyUISettings? idenfyUISettings;

  IdenfySettings({this.sslPinning, this.selectedLocale, this.idenfyUISettings});

  Map<String, dynamic> toJson() => {
        'sslPinning': sslPinning,
        'selectedLocale': selectedLocale?.name,
        'idenfyUISettings': idenfyUISettings?.toJson(),
      };
}

/// Idenfy setting builder class
class IdenfyBuilder {
  bool? sslPinning;
  IdenfyLocaleEnum? selectedLocale;
  IdenfyUISettings? idenfyUISettings;

  IdenfyBuilder withSSLPinning(bool sslPinning) {
    this.sslPinning = sslPinning;
    return this;
  }

  IdenfyBuilder withSelectedLocale(IdenfyLocaleEnum selectedLocale) {
    this.selectedLocale = selectedLocale;
    return this;
  }

  IdenfyBuilder withUISettings(IdenfyUISettings idenfyUISettings) {
    this.idenfyUISettings = idenfyUISettings;
    return this;
  }

  IdenfySettings build() {
    IdenfySettings idenfySettings = IdenfySettings(
        sslPinning: sslPinning,
        selectedLocale: selectedLocale,
        idenfyUISettings: idenfyUISettings);
    return idenfySettings;
  }
}
