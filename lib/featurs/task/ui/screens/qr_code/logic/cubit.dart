import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jop_task/featurs/task/ui/screens/qr_code/logic/states.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrcodeCubit extends Cubit<QrcodeStates> {
  QrcodeCubit() : super(QrcodeStates());
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
 // Barcode? result;
  QRViewController? controller;

  void onQRViewCreated(QRViewController controller) {
   this. controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!isClosed) {
        emit(state.copyWith(
          qrcodeEnum: QrcodeEnum.scanningSuccess,
          scannedData: scanData.code,
        ));
        debugPrint('======== ${scanData.code} ========= ');
      }
    });
  }

  // void setScannedData(String data) {
  //   if (!isClosed) {
  //     emit(state.copyWith(
  //         qrcodeEnum: QrcodeEnum.scanningSuccess, scannedData: data));
  //   }
  // }
  @override
  Future<void> close() {
   controller?.dispose();
    return super.close();
  }
}
