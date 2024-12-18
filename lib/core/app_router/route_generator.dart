import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jop_task/core/app_router/route_name.dart';
import 'package:jop_task/core/di.dart';
import 'package:jop_task/featurs/auth/logic/cubit.dart';
import 'package:jop_task/featurs/auth/ui/screens/login_screen.dart';
import 'package:jop_task/featurs/auth/ui/screens/register_screen.dart';
import 'package:jop_task/featurs/open_app/splash.dart';
import 'package:jop_task/featurs/open_app/welcome.dart';
import 'package:jop_task/featurs/todo/ui/screens/todo_screen.dart';

class RouteGenerator {
  static Route? generateRoute(RouteSettings setting) {
    final arguments = setting.arguments;
    switch (setting.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case RouteName.login:
        initAuthModule();
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<AuthCubit>(),
            child: const LoginScreen(),
          ),
        );
      case RouteName.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<AuthCubit>(),
            child: const RegisterScreen(),
          ),
        );
      case RouteName.todo:
        return MaterialPageRoute(builder: (_)=>const TodoScreen());
      default:
        return null;
    }
  }
}
