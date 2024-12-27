import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_icons.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_stylse.dart';
import 'package:jop_task/featurs/task/ui/screens/add_task/logic/cubit.dart';
import 'package:jop_task/featurs/task/ui/screens/add_task/logic/states.dart';

class PriorityWidget extends StatefulWidget {
  const PriorityWidget({super.key});

  @override
  State<PriorityWidget> createState() => _PriorityWidgetState();
}

class _PriorityWidgetState extends State<PriorityWidget> {
  List<String> priority = [
    'Low Priority',
    'Medium Priority',
    'Height Priority'
  ];
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AddTaskCubit>(context);
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<AddTaskCubit,AddTaskStates>(
        builder: (context,state){
          return Container(
            width: double.infinity,
            height: context.scaledHeight(50),
            decoration: BoxDecoration(
                color: AppColors.whit200, borderRadius: BorderRadius.circular(10)),
            child: DropdownButtonFormField(
              padding: EdgeInsets.symmetric(horizontal: context.scaledWidth(20)),
              icon: SvgPicture.asset(SvgIcons.arrowDown),
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
              value: state.selectedPriority,
              onChanged: (value) {
                if(value != null){
                  cubit.updatePriority(value);
                }
              },
              items: priority
                  .map(
                    (p) => DropdownMenuItem<String>(
                  value: p,
                  child: Row(
                    spacing: context.scaledWidth(10),
                    children: [
                      SvgPicture.asset(SvgIcons.flag),
                      Text(p),
                    ],
                  ),
                ),
              )
                  .toList(),
            ),
          );
        },

      ),
    );
  }
}
