import 'package:flutter/material.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_stylse.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final bool? readOnly;

  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.keyboardType,
      this.maxLines, this.obscureText, this.validator, this.readOnly});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText??false,
      readOnly:readOnly??false ,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: context.scaledHeight(15),
          horizontal: context.scaledWidth(15),
        ),
        hintText: hintText,
        hintStyle: AppStyles.hintStyle(),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.gry200,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.gry200,
            width: 0.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 1,
          ),
        ),
      ),
    );
  }
}
