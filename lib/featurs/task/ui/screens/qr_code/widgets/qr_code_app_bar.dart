import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jop_task/core/app_responsive.dart';

import '../../../../../../core/app_icons.dart';
import '../../../../../../core/app_stylse.dart';

class QrCodeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const QrCodeAppBar({super.key});

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
      title: Text(
        'QR code',
        style: AppStyles.appBarTitleStyle(),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 60);
}
