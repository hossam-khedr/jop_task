import 'package:flutter/material.dart';
import 'package:jop_task/core/cach_helper.dart';
import 'package:jop_task/core/di.dart';
import 'package:jop_task/core/secure_manager.dart';
import 'package:jop_task/tasky.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SecureManager.initSecureManager();
  await initDI();
  await initTaskModule();
  runApp(const Tasky());
}


