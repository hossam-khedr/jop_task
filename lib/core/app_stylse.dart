import 'package:flutter/material.dart';
import 'package:jop_task/core/app_constants.dart';

import 'app_colors.dart';

abstract class AppStyles{
 static TextStyle titleStyle(){
    return const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
      fontFamily: AppConstants.fontFamily,

    );
  }
 static TextStyle textButtonStyle(){
    return const TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w700,
      color: AppColors.whit,
      fontFamily: AppConstants.fontFamily,
    );
  }
 static TextStyle hintStyle(){
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.gry200,
      fontFamily: AppConstants.fontFamily,
    );
  }
 static TextStyle dropDownHintStyle(){
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.black24,
      fontFamily: AppConstants.fontFamily,
    );
  }
 static TextStyle profileHintStyle(){
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColors.black24,
      fontFamily: AppConstants.fontFamily,
    );
  }
}