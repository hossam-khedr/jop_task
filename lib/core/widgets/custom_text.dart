import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const CustomText({super.key, required this.text, required this.style, this.maxLines, this.textAlign, this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines:maxLines ,
      overflow:overflow ,
      textAlign: textAlign,
      text,
      style: style,
    );
  }
}
