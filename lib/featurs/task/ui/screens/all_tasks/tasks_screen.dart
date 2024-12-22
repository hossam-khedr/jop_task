import 'package:flutter/material.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_stylse.dart';
import 'package:jop_task/core/widgets/custom_text.dart';
import 'package:jop_task/featurs/task/ui/screens/all_tasks/widgets/all_tasks.dart';
import 'package:jop_task/featurs/task/ui/screens/all_tasks/widgets/custom_flotting_action_button.dart';
import 'package:jop_task/featurs/task/ui/screens/all_tasks/widgets/finished.dart';
import 'package:jop_task/featurs/task/ui/screens/all_tasks/widgets/in_progress.dart';
import 'package:jop_task/featurs/task/ui/screens/all_tasks/widgets/tap_widgets.dart';
import 'package:jop_task/featurs/task/ui/screens/all_tasks/widgets/task_app_bar.dart';
import 'package:jop_task/featurs/task/ui/screens/all_tasks/widgets/waiting.dart';

enum TapType { all, inProgress, waiting, finished }

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TapType tapType = TapType.all;

  Widget _getCurrentTaskStatus() {
    switch (tapType) {
      case TapType.all:
        return const AllTasks();
      case TapType.inProgress:
        return const InProgress();
      case TapType.waiting:
        return const Waiting();
      case TapType.finished:
        return const Finished();
    }
  }

  Widget _buildTapWidget(TapType type, String label) {
  return  TapWidgets(
      onTap: () {
        setState(
          () {
            tapType = type;
          },
        );

      },
      libele: label,
      containerColor: tapType == type ? AppColors.primary : AppColors.whit200,
      textColor: tapType == type ? AppColors.whit : AppColors.gry400,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TodoAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.scaledWidth(22)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: context.scaledHeight(16),
          children: [
            SizedBox(
              height: context.scaledHeight(24),
            ),
            CustomText(text: 'My Tasks', style: AppStyles.todoTitleStyle()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTapWidget(TapType.all, 'All'),
                _buildTapWidget(TapType.inProgress, 'In Progress'),
                _buildTapWidget(TapType.waiting, 'Waiting'),
                _buildTapWidget(TapType.finished, 'Finished'),
              ],
            ),
            Expanded(
              child: _getCurrentTaskStatus()
              ),

          ],
        ),
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
