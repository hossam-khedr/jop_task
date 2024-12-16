import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_icons.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_router/route_name.dart';
import 'package:jop_task/core/app_strings.dart';
import 'package:jop_task/core/app_stylse.dart';
import 'package:jop_task/core/widgets/custom_button.dart';
import 'package:jop_task/core/widgets/custom_text.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../country_code.dart';
import '../dont_have_account.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: context.scaledHeight(10),
          ),
          Image.asset(
            height: context.scaledHeight(420),
            fit: BoxFit.cover,
            'assets/images/Frame.png',
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.scaledWidth(22)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: AppStrings.loginText, style: AppStyles.titleStyle()),
                SizedBox(
                  height: context.scaledHeight(24),
                ),
                const CustomTextFormField(
                  hintText: AppStrings.phoneHint,
                  keyboardType: TextInputType.phone,
                  prefixIcon: CountryCode(),
                ),
                SizedBox(
                  height: context.scaledHeight(20),
                ),
                CustomTextFormField(
                  suffixIcon: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.scaledWidth(12),
                    ),
                    child: SvgPicture.asset(SvgIcons.eye),
                  ),
                  hintText: AppStrings.passwordHint,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: context.scaledHeight(24),
                ),
                CustomButton(
                  text: AppStrings.signInText,
                  onPressed: () {},
                ),
                SizedBox(
                  height: context.scaledHeight(24),
                ),
                Align(
                  alignment: Alignment.center,
                  child: DontHaveAccount(
                    message: AppStrings.dontHaveAccount,
                    action: AppStrings.signUpHere,
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.register);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
