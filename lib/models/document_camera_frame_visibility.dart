/// Document camera visibility class
class DocumentCameraFrameVisibility {
  Map<String, dynamic> toJson() => {};
}

/// Document camera visibility hidden for all document types
class HiddenForAllCountriesAndDocumentTypes
    extends DocumentCameraFrameVisibility {
  @override
  Map<String, dynamic> toJson() => {
        'value': 'HiddenForAllCountriesAndDocumentTypes',
      };
}

/// Document camera visibility hidden for provided countries and their document types
class HiddenForSpecificCountriesAndDocumentTypes
    extends DocumentCameraFrameVisibility {
  final Map<String, List<String>> countriesAndDocuments;

  HiddenForSpecificCountriesAndDocumentTypes(this.countriesAndDocuments);

  @override
  Map<String, dynamic> toJson() => {
        'value': 'HiddenForSpecificCountriesAndDocumentTypes',
        'countriesAndDocuments': countriesAndDocuments
      };
}
