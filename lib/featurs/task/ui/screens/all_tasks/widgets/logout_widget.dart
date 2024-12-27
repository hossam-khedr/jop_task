import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_router/route_name.dart';
import 'package:jop_task/core/app_stylse.dart';
import 'package:jop_task/core/widgets/custom_button.dart';
import 'package:jop_task/core/widgets/custom_snack_bar.dart';
import 'package:jop_task/core/widgets/custom_text.dart';

import 'package:jop_task/featurs/task/ui/screens/all_tasks/logic/cubit.dart';
import 'package:jop_task/featurs/task/ui/screens/all_tasks/logic/states.dart';

import '../../../../../../core/app_icons.dart';


class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<TasksCubit>(context);
    return BlocProvider.value(
      value: cubit,
      child: BlocConsumer<TasksCubit, TasksStates>(
        listener: (context, state) {
          debugPrint('Listener State : ${state.toString()}');
          if (state.isLogoutError) {
            CustomSnackBar.show(
              context: context,
              massage: state.errorMsg,
              snackBarType: SnackBarType.error,
            );
          }
          if (state.isLogoutSuccess) {
            CustomSnackBar.show(
              context: context,
              massage: 'Logout Successfully',
              snackBarType: SnackBarType.success,
            );
            Navigator.pushNamedAndRemoveUntil(
                context, RouteName.welcome, (route) => false);
          }
        },
        builder: (context, state) {
          debugPrint('Builder State : ${state.toString()}');
          return InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.scaledWidth(20),
                      vertical: context.scaledHeight(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: context.scaledHeight(10),
                      children: [
                        Container(
                          height: context.scaledHeight(50),
                          width: context.scaledWidth(50),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red.withOpacity(0.2),
                          ),
                          child: const Icon(
                            Icons.error_outline,
                            color: Colors.red,
                          ),
                        ),
                        CustomText(
                          text: 'You are about to logout',
                          style: AppStyles.hintStyle()
                              .copyWith(color: AppColors.black24),
                        ),
                        CustomText(
                            text:
                                'Are you sure you wont to logout? This action cannot be undone',
                            style:
                                AppStyles.hintStyle().copyWith(fontSize: 12)),
                        state.isLogoutLoading && state.isGetTasksSuccess
                            ? const CircularProgressIndicator()
                            : Row(
                              spacing: context.scaledWidth(20),
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    onPressed: () {
                                      cubit.logout();
                                    },
                                    text: 'Logout',
                                    textStyle: AppStyles.taskItemStyle().copyWith(color: AppColors.whit),
                                    height: context.scaledHeight(35),
                                    backgroundColor: AppColors.primary,
                                    icons:  Icon(
                                      Icons.done,
                                      size: context.scaledWidth(20),
                                      color: AppColors.whit,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: CustomButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    text: 'cancel',
                                    textStyle: AppStyles.taskItemStyle().copyWith(color: AppColors.gry200),
                                    height: context.scaledHeight(35),
                                    backgroundColor: AppColors.whit,
                                    icons:  Icon(
                                      Icons.cancel_outlined,
                                      size:context.scaledWidth(20),
                                      color: AppColors.gry200,
                                    ),
                                  ),
                                ),
                              ],
                            )
                      ],
                    ),
                  ),
                ),
              );
            },
            child: SvgPicture.asset(SvgIcons.logout),
          );
        },
      ),
    );
  }
}
