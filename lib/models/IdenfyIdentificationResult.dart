import 'AutoIdentificationStatus.dart';
import 'ManualIdentificationStatus.dart';

class IdenfyIdentificationResult {
  final AutoIdentificationStatus autoIdentificationStatus;
  final ManualIdentificationStatus manualIdentificationStatus;

  IdenfyIdentificationResult(this.autoIdentificationStatus, this.manualIdentificationStatus);

  factory IdenfyIdentificationResult.fromJson(dynamic json) {
    return IdenfyIdentificationResult(
      AutoIdentificationStatus.values.enumFromString(json['autoIdentificationStatus']),
      ManualIdentificationStatus.values.enumFromString(json['manualIdentificationStatus']),
    );
  }
}

extension EnumTransform on List {
  String? string<T>(T value) {
    if (value == null || (isEmpty)) return null;
    var occurence = singleWhere((enumItem) => enumItem.toString() == value.toString(), orElse: null);
    if (occurence == null) return null;
    return occurence.toString().split('.').last;
  }

  T? enumFromString<T>(String value) {
    return firstWhere((type) => type.toString().split('.').last == value, orElse: null);
  }
}
