import 'package:flutter/foundation.dart';
import 'package:idenfy_sdk_flutter/models/suspected_identification_status.dart';

import 'auto_identification_status.dart';
import 'manual_identification_status.dart';

/// Identification session result, that contains identification auto, manual and suspected statuses
class IdenfyIdentificationResult {
  final AutoIdentificationStatus autoIdentificationStatus;
  final ManualIdentificationStatus manualIdentificationStatus;
  final SuspectedIdentificationStatus suspectedIdentificationStatus;

  IdenfyIdentificationResult(this.autoIdentificationStatus,
      this.manualIdentificationStatus, this.suspectedIdentificationStatus);

  factory IdenfyIdentificationResult.fromJson(dynamic json) {
    var suspectedStatus = SuspectedIdentificationStatus(
        json['suspectedIdentificationStatus']['autoSuspected'],
        json['suspectedIdentificationStatus']['manualSuspected']);
    return IdenfyIdentificationResult(
        EnumTransform.valueOf(
            AutoIdentificationStatus.values, json['autoIdentificationStatus']),
        EnumTransform.valueOf(ManualIdentificationStatus.values,
            json['manualIdentificationStatus']),
        suspectedStatus);
  }
}

extension EnumTransform on List {
  static T valueOf<T>(Iterable<T> values, String value) {
    return values.where((e) => describeEnum(e!) == value).first;
  }
}
