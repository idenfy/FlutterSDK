///  Stores additional info, whether identification was automatically or manually set as SUSPECTED
class SuspectedIdentificationStatus {
  final bool autoSuspected;
  final bool manualSuspected;

  SuspectedIdentificationStatus(this.autoSuspected, this.manualSuspected);
}
