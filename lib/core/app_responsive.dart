import 'package:flutter/material.dart';

extension SizeExtension  on BuildContext{
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double  scaledHeight(double height) => height * screenHeight / 799.0;
  double  scaledWidth(double width) => width * screenWidth / 375.0;
}