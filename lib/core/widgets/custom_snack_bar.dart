import 'package:flutter/material.dart';
import 'package:jop_task/core/app_responsive.dart';

import '../app_colors.dart';

enum SnackBarType { success, error, warning, info }

class CustomSnackBar {
  static void show({
    required BuildContext context,
    required String massage,
    SnackBarType snackBarType = SnackBarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    final snackBar = SnackBar(
      content:
      MySnackBarContent(massage: massage, snackBarType: snackBarType),
      duration: duration,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class MySnackBarContent extends StatelessWidget {
  final String massage;
  final SnackBarType snackBarType;

  const MySnackBarContent(
      {super.key, required this.massage, required this.snackBarType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:context.scaledWidth(16), vertical:context.scaledHeight(12)),
      decoration: BoxDecoration(
        color: _getBackGroundColor(),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          Icon(
            _getIcons(),
            color: AppColors.whit,
          ),
          SizedBox(height: context.scaledWidth(10)),
          Expanded(
            child: Text(
              massage,
              style:  const TextStyle(color: AppColors.whit, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }

  Color _getBackGroundColor() {
    switch (snackBarType) {
      case SnackBarType.success:
        return Colors.green;
      case SnackBarType.error:
        return Colors.red;
      case SnackBarType.warning:
        return Colors.orange;
      case SnackBarType.info:
        return Colors.grey;
    }
  }

  IconData _getIcons() {
    switch (snackBarType) {
      case SnackBarType.success:
        return Icons.check_circle;
      case SnackBarType.error:
        return Icons.error;
      case SnackBarType.warning:
        return Icons.warning;
      case SnackBarType.info:
        return Icons.info;
    }
  }
}