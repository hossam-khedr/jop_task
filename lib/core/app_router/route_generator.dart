import 'package:flutter/material.dart';
import 'package:jop_task/core/app_router/route_name.dart';
import 'package:jop_task/featurs/auth/ui/screens/login_screen.dart';
import 'package:jop_task/featurs/auth/ui/screens/register_screen.dart';
import 'package:jop_task/featurs/open_app/splash.dart';
import 'package:jop_task/featurs/open_app/welcome.dart';

class RouteGenerator {
  static Route? generateRoute(RouteSettings setting) {
    final arguments = setting.arguments;
    switch (setting.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_)=>const SplashScreen());
      case RouteName.welcome:
        return MaterialPageRoute(builder: (_)=>const WelcomeScreen());
      case RouteName.login:
        return MaterialPageRoute(builder: (_)=>const LoginScreen());
      case RouteName.register:
        return MaterialPageRoute(builder: (_)=>const RegisterScreen());
      default:
        return null;
    }
  }
}
