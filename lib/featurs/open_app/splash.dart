import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_router/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 late Timer _timer;
 void _start(){
   _timer = Timer(const Duration(seconds: 3), _next);
 }
 void _next(){
   Navigator.pushNamedAndRemoveUntil(context, RouteName.welcome, (roure)=>false);
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
