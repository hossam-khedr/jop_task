import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jop_task/core/app_router/route_name.dart';
import 'package:jop_task/core/di.dart';
import 'package:jop_task/featurs/auth/logic/cubit.dart';
import 'package:jop_task/featurs/auth/ui/screens/login_screen.dart';
import 'package:jop_task/featurs/auth/ui/screens/register_screen.dart';
import 'package:jop_task/featurs/open_app/splash.dart';
import 'package:jop_task/featurs/open_app/welcome.dart';
import 'package:jop_task/featurs/task/ui/screens/add_task/logic/cubit.dart';
import 'package:jop_task/featurs/task/ui/screens/all_tasks/logic/cubit.dart';
import 'package:jop_task/featurs/task/ui/screens/profile/logic/cubit.dart';
import 'package:jop_task/featurs/task/ui/screens/profile/profile_screen.dart';
import 'package:jop_task/featurs/task/ui/screens/qr_code/logic/cubit.dart';
import 'package:jop_task/featurs/task/ui/screens/qr_code/qr_code_screen.dart';

import '../../featurs/task/ui/screens/add_task/add_task_screen.dart';
import '../../featurs/task/ui/screens/all_tasks/tasks_screen.dart';

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
      case RouteName.task:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<TasksCubit>()..getAllTasks()..getInProgressTask('inProgress'),
            child: const TaskScreen(),
          ),
        );
      case RouteName.addNewTask:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<AddTaskCubit>(),
            child: const AddTaskScreen(),
          ),
        );
      case RouteName.profile:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<ProfileCubit>(),
            child: const ProfileScreen(),
          ),
        );
      case RouteName.qrcode:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<QrcodeCubit>(),
            child: const QrCodeScreen() ,
          ),
        );
      default:
        return null;
    }
  }
}
