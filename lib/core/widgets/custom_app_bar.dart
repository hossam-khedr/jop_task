import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jop_task/core/app_icons.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_stylse.dart';
import 'package:jop_task/core/widgets/custom_text.dart';

class CustomAppBat extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>?actions;
  const CustomAppBat({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.all(
          context.scaledWidth(17),
        ),
        child: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: SvgPicture.asset(SvgIcons.arrowR),
        ),
      ),
      title: CustomText(
      text:   title,
        style: AppStyles.appBarTitleStyle(),
      ),
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 60);
}