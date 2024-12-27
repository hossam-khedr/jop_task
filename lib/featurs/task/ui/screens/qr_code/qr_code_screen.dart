import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jop_task/featurs/task/ui/screens/qr_code/logic/cubit.dart';
import 'package:jop_task/featurs/task/ui/screens/qr_code/logic/states.dart';
import 'package:jop_task/featurs/task/ui/screens/qr_code/widgets/qr_code_app_bar.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const QrCodeAppBar(),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: QRView(
                key: context.read<QrcodeCubit>().qrKey,
                onQRViewCreated: (controller) {
                  context.read<QrcodeCubit>().onQRViewCreated(controller);
                },
              ),
            ),
            BlocBuilder<QrcodeCubit, QrcodeStates>(
                builder: (context, state) {
              return Expanded(
                flex: 2,
                  child: state.isScanningSuccess
                  ?  Text(state.scannedData)
                  : const Text('No data scanning'));
            })
          ],
        ));
  }
}
