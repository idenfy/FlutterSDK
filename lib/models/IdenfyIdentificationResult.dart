import 'package:flutter/foundation.dart';

import 'AutoIdentificationStatus.dart';
import 'ManualIdentificationStatus.dart';
import 'SuspectedIdentificationStatus.dart';

class IdenfyIdentificationResult {
  final AutoIdentificationStatus autoIdentificationStatus;
  final ManualIdentificationStatus manualIdentificationStatus;
  final SuspectedIdentificationStatus suspectedIdentificationStatus;

  IdenfyIdentificationResult(
      this.autoIdentificationStatus, this.manualIdentificationStatus, this.suspectedIdentificationStatus);

  factory IdenfyIdentificationResult.fromJson(dynamic json) {
    var suspectedStatus = SuspectedIdentificationStatus(json['suspectedIdentificationStatus']['autoSuspected'], json['suspectedIdentificationStatus']['manualSuspected']);
    return IdenfyIdentificationResult(
        EnumTransform.valueOf(
            AutoIdentificationStatus.values, json['autoIdentificationStatus']),
        EnumTransform.valueOf(ManualIdentificationStatus.values,
            json['manualIdentificationStatus']), suspectedStatus);
  }
}

extension EnumTransform on List {
  static T valueOf<T>(Iterable<T> values, String value) {
    return values.where((e) => describeEnum(e!) == value).first;
  }
}
