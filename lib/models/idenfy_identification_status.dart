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
        AutoIdentificationStatus.values
            .byName(json['autoIdentificationStatus']),
        ManualIdentificationStatus.values
            .byName(json['manualIdentificationStatus']),
        suspectedStatus);
  }
}
