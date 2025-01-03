import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_stylse.dart';

class DropdownMenuWidget extends StatefulWidget {
  final List<String>item;
  final String svgIconPath;
  final String value;
  final void Function(String?)?onChange;
  final Widget child;
  const DropdownMenuWidget({super.key, required this.item, required this.svgIconPath, required this.value, this.onChange, required this.child});

  @override
  State<DropdownMenuWidget> createState() => _DropdownMenuWidgetState();
}

class _DropdownMenuWidgetState extends State<DropdownMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
            width: double.infinity,
            height: context.scaledHeight(50),
            decoration: BoxDecoration(
                color: AppColors.whit200, borderRadius: BorderRadius.circular(10)),
            child: DropdownButtonFormField(
              padding: EdgeInsets.symmetric(horizontal: context.scaledWidth(20)),
              icon: SvgPicture.asset(widget.svgIconPath),
              dropdownColor: AppColors.whit200,
              style: AppStyles.priorityTextStyle(),
              decoration: InputDecoration(
                border: InputBorder.none,
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.error,
                    width: 1,
                  ),
                ),
              ),
              value: widget.value,
              onChanged: widget.onChange,
              items: widget.item
                  .map(
                    (p) => DropdownMenuItem<String>(
                  value: p,
                  child: widget.value==p?widget.child:Text(p)
                ),
              )
                  .toList(),
            ),
          );
  }
}