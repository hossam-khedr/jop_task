import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_icons.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_stylse.dart';
import 'package:jop_task/core/widgets/custom_text.dart';
import 'package:jop_task/featurs/task/ui/screens/details/logic/cubit.dart';
import 'package:jop_task/featurs/task/ui/screens/details/logic/states.dart';

class ChoossEndDate extends StatefulWidget {
  const ChoossEndDate({super.key});

  @override
  State<ChoossEndDate> createState() => _ChoossEndDateState();
}

class _ChoossEndDateState extends State<ChoossEndDate> {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<TaskDetailsCubit>(context);
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<TaskDetailsCubit, TaskDetailsStates>(
          builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: context.scaledWidth(20)),
          width: double.infinity,
          height: context.scaledHeight(50),
          decoration: BoxDecoration(
            color: AppColors.whit200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'End Date',
                    style: AppStyles.hintStyle().copyWith(
                      fontSize: 9,
                    ),
                  ),
                  CustomText(
                    text: state.dateFormate,
                    style: AppStyles.titleStyle().copyWith(
                      fontSize: 14,
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  cubit.pickeDate(context);
                },
                child: SvgPicture.asset(
                  SvgIcons.calender,
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
