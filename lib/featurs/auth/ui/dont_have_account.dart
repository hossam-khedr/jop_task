import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_stylse.dart';

class DontHaveAccount extends StatelessWidget {
  final String message;
  final String action;
  final void Function()? onTap;

  const DontHaveAccount(
      {super.key, required this.message, required this.action, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(text: message, style: AppStyles.hintStyle()),
      TextSpan(
          text: action,
          style: AppStyles.textButtonStyle().copyWith(
            color: AppColors.primary,
            fontSize: 14,
            decoration: TextDecoration.underline
          ),
          recognizer: TapGestureRecognizer()..onTap = onTap),
    ]));
  }
}
