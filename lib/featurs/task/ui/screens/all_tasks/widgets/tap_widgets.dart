import 'package:flutter/material.dart';
import 'package:jop_task/core/app_responsive.dart';

import '../../../../../../core/app_constants.dart';




class TapWidgets extends StatelessWidget {
  final String libele;
  final Color containerColor;
  final Color textColor;
  final void Function()? onTap;
  const TapWidgets({super.key, required this.libele, required this.containerColor, required this.textColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(context.scaledWidth(10)),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(24)
        ),
        child: Text(libele,style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: textColor,
          fontFamily: AppConstants.fontFamily,
        )),
      ),
    );
  }
}
