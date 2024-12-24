import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/widgets/custom_text.dart';

import '../../../../../../core/app_icons.dart';
import '../../../../../../core/app_stylse.dart';

class AddTaskAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddTaskAppBar({super.key});

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
       text:  'Add new task',
        style: AppStyles.appBarTitleStyle(),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 60);
}
