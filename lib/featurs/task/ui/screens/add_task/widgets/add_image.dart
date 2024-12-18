import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_icons.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_stylse.dart';
import 'package:jop_task/featurs/task/logic/cubit.dart';

class AddImage extends StatefulWidget {
  const AddImage({super.key});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.primary,
   padding: EdgeInsets.all(context.scaledWidth(18)),
      radius: const Radius.circular(12),
      borderType: BorderType.RRect,
      child: GestureDetector(
        onTap: (){
          context.read<TaskCubit>().chooseImage();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: context.scaledWidth(5),
          children: [
            SvgPicture.asset(SvgIcons.addImg),
            Text('Add Img',style: AppStyles.addImgStyle(),),
          ],
        ),
      ),
    );
  }
}
