import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jop_task/core/app_icons.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_stylse.dart';
import 'package:jop_task/core/widgets/custom_app_bar.dart';
import 'package:jop_task/core/widgets/custom_menu.dart';
import 'package:jop_task/core/widgets/custom_text.dart';
import 'package:jop_task/featurs/task/data/models/task_model.dart';
import 'package:jop_task/featurs/task/ui/screens/details/logic/cubit.dart';
import 'package:jop_task/featurs/task/ui/screens/details/logic/states.dart';
import 'package:jop_task/featurs/task/ui/screens/details/widgets/chooss_end_date.dart';
import 'package:jop_task/featurs/task/ui/screens/details/widgets/delete_task_widget.dart';
import 'package:jop_task/featurs/task/ui/screens/details/widgets/dropdown_menu.dart';

class DetailsScreen extends StatefulWidget {
  final TaskModel taskModel;
  const DetailsScreen({
    super.key,
    required this.taskModel,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TaskDetailsCubit>().getTaskInfo(widget.taskModel.sId!);
  }

  @override
  Widget build(BuildContext context) {
    final perentContext = context;
    return Scaffold(
      appBar: CustomAppBat(
        title: 'Task Details',
        actions: [
          CustomMenu(
            onSelected: (value) {
              if (value == 2) {
                showModalBottomSheet(
                  context: perentContext,
                  builder: (context) => BlocProvider.value(
                    value: BlocProvider.of<TaskDetailsCubit>(perentContext),
                    child: DeleteTaskWidget(
                      taskId: widget.taskModel.sId!,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<TaskDetailsCubit, TaskDetailsStates>(
        builder: (context, state) {
          var taskStatus = state.taskStatus.toList();
          var pirority = state.priority.toList();
          if (state.isGetDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.isGetDetailsError) {
            return Center(
              child: Text(state.errorMasg),
            );
          }
          if (state.isGetDetailsSuccess ||
              state.isUpdateStatus ||
              state.isupdatePriority ||
              state.isupdateDateTime) {
            return Padding(
              padding: EdgeInsets.all(context.scaledWidth(20)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                        height: context.scaledHeight(225),
                        'assets/images/caver.png'),
                    SizedBox(
                      height: context.scaledHeight(16),
                    ),
                    CustomText(
                      text: state.model?.title ?? 'No title',
                      style: AppStyles.titleStyle(),
                    ),
                    SizedBox(
                      height: context.scaledHeight(8),
                    ),
                    CustomText(
                      text: state.model?.desc ?? 'No Desc',
                      style: AppStyles.hintStyle(),
                    ),
                    SizedBox(
                      height: context.scaledHeight(16),
                    ),
                    const ChoossEndDate(),
                    SizedBox(
                      height: context.scaledHeight(8),
                    ),
                    DropdownMenuWidget(
                      value: state.initTaskStatus,
                      item: taskStatus,
                      onChange: (value) {
                        if (value != null) {
                          context
                              .read<TaskDetailsCubit>()
                              .updateTaskStatus(value);
                        }
                      },
                      svgIconPath: SvgIcons.arrowDown,
                      child: Text(state.initTaskStatus),
                    ),
                    SizedBox(
                      height: context.scaledHeight(8),
                    ),
                    DropdownMenuWidget(
                      value: state.initpriority,
                      item: pirority,
                      onChange: (value) {
                        if (value != null) {
                          context
                              .read<TaskDetailsCubit>()
                              .updatePriority(value);
                        }
                      },
                      svgIconPath: SvgIcons.arrowDown,
                      child: Row(
                        spacing: context.scaledWidth(5),
                        children: [
                          SvgPicture.asset(SvgIcons.flag),
                          Text(state.initpriority),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.scaledHeight(16),
                    ),
                    // Image.network(state.model?.user??'no qrCode')
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
