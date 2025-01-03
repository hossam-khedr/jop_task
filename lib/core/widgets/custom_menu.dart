import 'package:flutter/material.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_stylse.dart';
import 'package:jop_task/core/widgets/custom_text.dart';

class CustomMenu extends StatefulWidget {
  final void Function(int)? onSelected;
  const CustomMenu({super.key, this.onSelected});

  @override
  State<CustomMenu> createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu> {
  @override
  Widget build(BuildContext context) {
     return PopupMenuButton<int>(
      onSelected: widget.onSelected,
      offset: const Offset(-25, 35),
      color: AppColors.whit,
      constraints: BoxConstraints(
        minHeight: context.scaledHeight(88),
        maxWidth: context.scaledWidth(82),
      ),
      menuPadding: EdgeInsets.symmetric(horizontal: context.scaledWidth(5)),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(12),
        bottomLeft: Radius.circular(12),
        topLeft: Radius.circular(12),
      )),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: CustomText(
            text: 'Edit',
            style: AppStyles.titleStyle().copyWith(fontSize: 14),
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          value: 2,
          child: CustomText(
            text: 'Delete',
            style: AppStyles.errorStyle().copyWith(fontSize: 14),
          ),
        ),
      ],
    );
  }
}