import 'package:flutter/material.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_stylse.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Widget? icons;
  final double? minWidth;
  final double? height;
  final void Function()? onPressed;

  const CustomButton(
      {super.key,
      required this.text,
      this.icons,
      this.onPressed,
      this.minWidth,
      this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? context.scaledHeight(49),
      width: minWidth ?? double.infinity,
      child: ElevatedButton(
       style: ElevatedButton.styleFrom(
         backgroundColor: AppColors.primary,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(12),
         ),
       ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppStyles.textButtonStyle(),
            ),
            icons ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
