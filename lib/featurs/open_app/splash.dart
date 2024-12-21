import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_constants.dart';
import 'package:jop_task/core/app_router/route_name.dart';
import 'package:jop_task/core/secure_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  getUserToken()async{

  }

  late Timer _timer;

  void _start() {
    _timer = Timer(const Duration(seconds: 3), _next);
  }

   _next()async {
    var accessToken =await SecureManager.getData(key: AppConstants.accessToken);
    if(!mounted)return;
    if(accessToken != null){
      Navigator.pushNamedAndRemoveUntil(
          context, RouteName.task, (roure) => false);
    }else{
      Navigator.pushNamedAndRemoveUntil(
          context, RouteName.welcome, (roure) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    _start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/task.png'),
            Image.asset('assets/images/y.png'),
          ],
        ),
      ),
    );
  }
}
