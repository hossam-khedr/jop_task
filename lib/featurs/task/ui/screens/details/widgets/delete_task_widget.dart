import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_router/route_name.dart';
import 'package:jop_task/core/app_stylse.dart';
import 'package:jop_task/core/widgets/custom_text.dart';
import 'package:jop_task/featurs/task/ui/screens/details/logic/cubit.dart';
import 'package:jop_task/featurs/task/ui/screens/details/logic/states.dart';

class DeleteTaskWidget extends StatelessWidget {
  final String taskId;
  const DeleteTaskWidget({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<TaskDetailsCubit, TaskDetailsStates>(
      listener: (context,state){
if (state.isDeleteTaskSuccess) {
          Navigator.pushNamed(context, RouteName.task);
        }
      },
      builder: (context, state) {
        if (state.isDeleteTaskError) {
          return CustomText(
            text: state.errorMasg,
            style: AppStyles.errorStyle(),
          );
        }
         else {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: context.scaledHeight(20),
              horizontal: context.scaledWidth(20),
            ),
            height: context.scaledHeight(65),
            decoration: const BoxDecoration(
              color: AppColors.lightGry200,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: context.scaledWidth(10),
              children: [
                state.isDeleteTaskLoading
                    ? const CircularProgressIndicator(
                      strokeWidth: 2,
                    )
                    : InkWell(
                      onTap: (){
                       context.read<TaskDetailsCubit>().deleteTask(taskId);
                      },
                      child: Icon(
                          Icons.delete_forever_outlined,
                          size: context.scaledHeight(30),
                        ),
                    ),
                CustomText(
                  text: 'Delete this task',
                  style: AppStyles.titleStyle().copyWith(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
