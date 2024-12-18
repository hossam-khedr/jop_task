import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_icons.dart';
import 'package:jop_task/core/app_responsive.dart';

class TodoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TodoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        leading: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary
          ),
          child: Padding(
            padding:  EdgeInsets.all(context.scaledWidth(8)),
            child: Row(
              children: [
                Image.asset('assets/images/task.png',height: context.scaledHeight(11),),
                Image.asset('assets/images/y.png',height: context.scaledHeight(11),),
              ],
            ),
          ),
        ),
        actions: [
          SvgPicture.asset(SvgIcons.profile),
          SizedBox(width: context.scaledWidth(20),),
          SvgPicture.asset(SvgIcons.logout),
        ],
      ),

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 60);
}
