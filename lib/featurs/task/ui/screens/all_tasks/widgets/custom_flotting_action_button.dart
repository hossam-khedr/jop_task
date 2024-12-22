import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_icons.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_router/route_name.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: context.scaledHeight(14),
      children: [
        FloatingActionButton.small(
          heroTag: 'small',
          backgroundColor: AppColors.whit300,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: SvgPicture.asset(SvgIcons.qrcode),
          onPressed: () {
            Navigator.pushNamed(context, RouteName.qrcode);
          },
        ),
        FloatingActionButton(
          heroTag: 'mainFab',
          backgroundColor: AppColors.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: const Icon(
            Icons.add,
            color: AppColors.whit,
          ),
          onPressed: () {
            Navigator.pushNamed(context, RouteName.addNewTask);
          },
        ),
      ],
    );
  }
}
