enum QrcodeEnum{
  init,
  scanningSuccess,
}
extension QrcodeExtension on QrcodeStates{
  get isInit => qrcodeEnum == QrcodeEnum.init;
  get isScanningSuccess => qrcodeEnum == QrcodeEnum.scanningSuccess;

}
class QrcodeStates{
  final QrcodeEnum qrcodeEnum;
  final String errorMsg;
  final String scannedData;


  QrcodeStates({
    this.qrcodeEnum = QrcodeEnum.init,
    this.errorMsg = '',
    this.scannedData ='',

  });
  QrcodeStates copyWith({
     QrcodeEnum? qrcodeEnum,
     String? errorMsg,
    String? scannedData,
  }){
    return QrcodeStates(
      errorMsg: errorMsg ?? this.errorMsg,
      scannedData: scannedData ?? this.scannedData,
      qrcodeEnum: qrcodeEnum ?? this.qrcodeEnum,
    );
  }
}