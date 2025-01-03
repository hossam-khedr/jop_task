import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_icons.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_stylse.dart';
import 'package:jop_task/featurs/task/ui/screens/add_task/logic/cubit.dart';
import 'package:jop_task/featurs/task/ui/screens/add_task/logic/states.dart';

import '../../../../../../core/widgets/custom_snack_bar.dart';

class AddImage extends StatefulWidget {
  const AddImage({super.key});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AddTaskCubit>(context);
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<AddTaskCubit,AddTaskStates>(
          builder: (context,state){
            if(state.isImageUploadError){
              CustomSnackBar.show(
                context: context,
                massage: state.errorMsg ,
                snackBarType: SnackBarType.error,
              );
            }
            if(state.isImageUploadLoading){
              return const Center(child: CircularProgressIndicator(),);
            }
            if(state.isImageUploaded){
              return Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                      height: context.scaledHeight(100),
                      width: context.scaledWidth(100),
                      fit: BoxFit.cover,
                      state.selectedImage!),
                ),
              );
            }
            else{
              return DottedBorder(
                color: AppColors.primary,
                padding: EdgeInsets.all(context.scaledWidth(18)),
                radius: const Radius.circular(12),
                borderType: BorderType.RRect,
                child: GestureDetector(
                  onTap: (){
                    cubit.chooseImage();
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
      ),
    );
  }
}
