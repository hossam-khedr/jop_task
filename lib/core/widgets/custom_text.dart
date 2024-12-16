import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final int? maxLines;
  final TextAlign? textAlign;

  const CustomText({super.key, required this.text, required this.style, this.maxLines, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines:maxLines ,
      textAlign: textAlign,
      text,
      style: style,
    );
  }
}
