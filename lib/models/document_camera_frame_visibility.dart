class DocumentCameraFrameVisibility {
  Map<String, dynamic> toJson() => {};
}

class HiddenForAllCountriesAndDocumentTypes extends DocumentCameraFrameVisibility {

  @override
  Map<String, dynamic> toJson() => {
    'value': 'HiddenForAllCountriesAndDocumentTypes',
  };
}

class HiddenForSpecificCountriesAndDocumentTypes extends DocumentCameraFrameVisibility {
  final Map<String, List<String>> countriesAndDocuments;

  HiddenForSpecificCountriesAndDocumentTypes(this.countriesAndDocuments);

  @override
  Map<String, dynamic> toJson() => {
    'value': 'HiddenForSpecificCountriesAndDocumentTypes',
    'countriesAndDocuments': countriesAndDocuments
  };
}