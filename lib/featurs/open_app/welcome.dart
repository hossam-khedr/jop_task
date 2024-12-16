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

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.whit,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Image.asset('assets/images/Frame.png'),
            CustomText(
              text: AppStrings.welcomeTitleText,
              style: AppStyles.titleStyle(),
            ),
            CustomText(
              text: AppStrings.welcomeTitleText2,
              style: AppStyles.titleStyle(),
            ),
            SizedBox(
                width: context.scaledWidth(300),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomText(
                      text: AppStrings.welcomeSubTitleText,
                      style: AppStyles.hintStyle(),
                      //maxLines: 5,
                    ),
                    CustomText(
                      text: AppStrings.welcomeSubTitleText1,
                      style: AppStyles.hintStyle(),
                      //maxLines: 5,
                    ),
                    CustomText(
                      text: AppStrings.welcomeSubTitleText2,
                      style: AppStyles.hintStyle(),
                      //maxLines: 5,
                    ),
                  ],
                )),
            SizedBox(
              height: context.scaledHeight(32.5),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: context.scaledWidth(22)),
              child: CustomButton(
                text: AppStrings.letsStartText,
                icons: SvgPicture.asset(SvgIcons.arrowLeft),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RouteName.login, (route) => false);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
