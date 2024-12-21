import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_router/route_name.dart';
import 'package:jop_task/core/app_stylse.dart';
import 'package:jop_task/core/widgets/custom_button.dart';
import 'package:jop_task/core/widgets/custom_snack_bar.dart';
import 'package:jop_task/featurs/task/logic/state.dart';

import '../../../../../../core/app_icons.dart';
import '../../../../logic/cubit.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<TaskCubit>(context);
    return BlocProvider.value(
      value: cubit,
      child: BlocConsumer<TaskCubit, TaskStates>(
        listener: (context, state) {
          if (state.isError) {
            CustomSnackBar.show(
              context: context,
              massage: state.errorMessage ?? '',
              snackBarType: SnackBarType.error,
            );
          }
          if (state.isSuccess) {
            CustomSnackBar.show(
              context: context,
              massage: 'Logout Successfully',
              snackBarType: SnackBarType.error,
            );
            Navigator.pushNamedAndRemoveUntil(
                context, RouteName.login, (route) => false);
          }
        },
        builder: (context, state) {
          return InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: SizedBox(
                    height: context.scaledHeight(120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'You are sure from logout',
                          style: AppStyles.hintStyle()
                              .copyWith(color: AppColors.black24),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:state.isLoading
                              ? const CircularProgressIndicator()
                              : Row(
                            spacing: context.scaledWidth(20),
                            children: [
                               Expanded(
                                      child: CustomButton(
                                        onPressed: () {
                                          cubit.logout();
                                        },
                                        text: 'Ok',
                                        height: context.scaledHeight(40),
                                        backgroundColor: AppColors.error,
                                      ),
                                    ),
                              Expanded(
                                child: CustomButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  text: 'No',
                                  height: context.scaledHeight(40),
                                  backgroundColor: AppColors.gry300,
                                ),
                              ),
                            ],
                          ),
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
