
class BarCodeScannerStatus {
  final bool isCameraAvailable;
  final String error;
  final String barCode;
  final bool stopScanner;

  BarCodeScannerStatus(
      {this.stopScanner = false, this.isCameraAvailable = false, this.error = '', this.barCode = ''});

  factory BarCodeScannerStatus.available() =>
      BarCodeScannerStatus(
          isCameraAvailable: true, stopScanner: false);
  factory BarCodeScannerStatus.error(String message,) =>
      BarCodeScannerStatus(error: message,stopScanner: true);
  factory BarCodeScannerStatus.barCode(String barCode) =>
      BarCodeScannerStatus(barCode: barCode,stopScanner: true);

  bool get showCamera => isCameraAvailable && error.isEmpty;
  bool get hasErro => error.isNotEmpty;
  bool get hasBarCode => isCameraAvailable && error.isNotEmpty;
}
