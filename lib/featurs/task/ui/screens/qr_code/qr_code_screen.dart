import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jop_task/core/widgets/custom_snack_bar.dart';
import 'package:jop_task/featurs/task/logic/cubit.dart';
import 'package:jop_task/featurs/task/logic/state.dart';
import 'package:jop_task/featurs/task/ui/screens/qr_code/widgets/qr_code_app_bar.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  // final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // QRViewController? controller;

  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if (controller != null) {
  //     controller!.pauseCamera();
  //     controller!.resumeCamera();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const QrCodeAppBar(),
        body: BlocConsumer<TaskCubit, TaskStates>(
          listener: (context, state) {
            // if (state.isSuccess) {
            //   CustomSnackBar.show(
            //     context: context,
            //     massage: 'Scanner Successfully',
            //     snackBarType: SnackBarType.success
            //   );
            // }
          },
          builder: (context, state) {
            if (state.isScanningSuccess) {
              return Center(child: Text(state.scannedData));
            }
            return MobileScanner(onDetect: (BarcodeCapture capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                context
                    .read<TaskCubit>()
                    .setScannedData(barcode.rawValue ?? 'No data');
              }
            },);
          },
        )
      // Column(
      //   children: [
      //     Expanded(
      //       flex: 4,
      //       child: QRView(
      //         key: qrKey,
      //         onQRViewCreated: _onQRViewCreated,
      //       ),
      //     ),
      //     Expanded(
      //       flex: 1,
      //       child: BlocBuilder<TaskCubit,TaskStates>(
      //         builder: (context, state) {
      //           if(state.isScanning){
      //             return const Text('Scanning...');
      //           }if(state.scannedData.isNotEmpty){
      //             return Text('Scanned ${state.scannedData}');
      //           }else{
      //             return const Text('scan a code');
      //           }
      //         },
      //       ),
      //     )
      //   ],
      // ),
    );
  }

// void _onQRViewCreated(QRViewController controller) {
//   this.controller = controller;
//   context.read<TaskCubit>().startScanning();
//
//   controller.scannedDataStream.listen((scanData) {
//     context.read<TaskCubit>().setScannedData(scanData.code ?? '');
//     controller.pauseCamera();
//   });
// }
}
