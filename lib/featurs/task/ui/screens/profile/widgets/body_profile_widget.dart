import 'package:flutter/material.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_stylse.dart';

class BodyProfileWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget? leading;
  const BodyProfileWidget({super.key, required this.title, this.leading, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.scaledHeight(68),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightGry200,
        borderRadius: BorderRadius.circular(10)
      ),
      child: ListTile(
        titleTextStyle: AppStyles.listTileTitleStyle(),
        subtitleTextStyle: AppStyles.listTileSubTitleStyle(),
        title: Text(title),
        subtitle:  Text(subTitle),
        trailing:leading ,

      ),
    );
  }
}
