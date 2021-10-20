import 'package:flutter/foundation.dart';

import 'AutoIdentificationStatus.dart';
import 'ManualIdentificationStatus.dart';

class IdenfyIdentificationResult {
  final AutoIdentificationStatus autoIdentificationStatus;
  final ManualIdentificationStatus manualIdentificationStatus;

  IdenfyIdentificationResult(
      this.autoIdentificationStatus, this.manualIdentificationStatus);

  factory IdenfyIdentificationResult.fromJson(dynamic json) {
    return IdenfyIdentificationResult(
        EnumTransform.valueOf(
            AutoIdentificationStatus.values, json['autoIdentificationStatus']),
        EnumTransform.valueOf(ManualIdentificationStatus.values,
            json['manualIdentificationStatus']));
  }
}

extension EnumTransform on List {
  static T valueOf<T>(Iterable<T> values, String value) {
    return values.where((e) => describeEnum(e!) == value).first;
  }
}
