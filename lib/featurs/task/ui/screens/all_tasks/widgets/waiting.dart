import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_icons.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_stylse.dart';
import 'package:jop_task/core/widgets/custom_text.dart';
import 'package:jop_task/featurs/task/ui/screens/all_tasks/logic/cubit.dart';
import 'package:jop_task/featurs/task/ui/screens/all_tasks/logic/states.dart';

class Waiting extends StatefulWidget {
  const Waiting({super.key});

  @override
  State<Waiting> createState() => _WaitingState();
}

class _WaitingState extends State<Waiting> {
  @override
  void initState() {
    super.initState();
    context.read<TasksCubit>().getInWaitingTask('waiting');
  }

  Color checkPriorityStatus(String status) {
    switch (status) {
      case 'low':
        return AppColors.blu;

      case 'medium':
        return AppColors.primary;
    }
    return AppColors.error;
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<TasksCubit>(context);
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<TasksCubit, TasksStates>(builder: (context, state) {
        if (state.isGetTasksSuccess) {
          if (state.waitingList.isEmpty) {
            return Center(
              child: Image.asset(
                'assets/images/empty.png',
                height: context.scaledHeight(150),
              ),
            );
          } else {
            return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                      height: context.scaledHeight(10),
                    ),
                itemCount: state.waitingList.length,
                itemBuilder: (context, index) {
                  DateTime dateTime =
                      DateTime.parse(state.waitingList[index].createdAt ?? '');
                  String formattedDate =
                      DateFormat('d/M/yyyy').format(dateTime);
                  return Row(
                    spacing: context.scaledWidth(10),
                    children: [
                      CircleAvatar(
                        radius: 30,
                  
                        backgroundImage: NetworkImage(
                          state.waitingList[index].image ?? 'no image',
                        ),
                      ),
                      Expanded(
                        child: Column(
                          spacing: context.scaledHeight(5),
                          crossAxisAlignment: CrossAxisAlignment.start,
                                        
                          children: [
                            CustomText(
                              text: state.waitingList[index].title ?? 'no title',
                              style:
                                  AppStyles.titleStyle().copyWith(fontSize: 16),
                            ),
                            CustomText(
                              text: state.waitingList[index].desc ?? 'no desc',
                              style: AppStyles.hintStyle(),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          
                              children: [
                                Row(
                                  spacing: context.scaledWidth(5),
                                  children: [
                                    SvgPicture.asset(
                                      SvgIcons.smallFlag,
                                      colorFilter: ColorFilter.mode(
                                        checkPriorityStatus(
                                            state.waitingList[index].priority ??
                                                ''),
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    CustomText(
                                      text: state.waitingList[index].priority ??
                                          'no priority',
                                      style:
                                          AppStyles.priorityTextStyle().copyWith(
                                        fontSize: 12,
                                        color: checkPriorityStatus(
                                          state.waitingList[index].priority ?? '',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                CustomText(
                                  text: formattedDate,
                                  style: AppStyles.hintStyle(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                });
          }
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }
}
