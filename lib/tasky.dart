import 'package:flutter/material.dart';
import 'package:jop_task/core/app_router/route_generator.dart';

import 'core/app_router/route_name.dart';

class Tasky extends StatefulWidget {
  const Tasky({super.key});

  @override
  State<Tasky> createState() => _TaskyState();
}

class _TaskyState extends State<Tasky> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
