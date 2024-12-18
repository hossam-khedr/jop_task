import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_stylse.dart';
import 'package:jop_task/core/widgets/custom_text.dart';


import '../widgets/all_tasks.dart';
import '../widgets/custom_flotting_action_button.dart';
import '../widgets/finished.dart';
import '../widgets/in_progress.dart';
import '../widgets/tap_widgets.dart';
import '../widgets/task_app_bar.dart';
import '../widgets/waiting.dart';

enum TapType { all, inProgress, waiting, finished }

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TapType tapType = TapType.all;

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
                TapWidgets(
                  onTap: () {
                    setState(() {
                      tapType = TapType.all;
                    });
                  },
                  libele: 'All',
                  containerColor: tapType == TapType.all
                      ? AppColors.primary
                      : AppColors.whit200,
                  textColor: tapType == TapType.all
                      ? AppColors.whit
                      : AppColors.gry400,
                ),
                TapWidgets(
                  onTap: () {
                    setState(() {
                      tapType = TapType.inProgress;
                    });
                  },
                  libele: 'inProgress',
                  containerColor: tapType == TapType.inProgress
                      ? AppColors.primary
                      : AppColors.whit200,
                  textColor: tapType == TapType.inProgress
                      ? AppColors.whit
                      : AppColors.gry400,
                ),
                TapWidgets(
                  onTap: () {
                    setState(() {
                      tapType = TapType.waiting;
                    });
                  },
                  libele: 'Waiting',
                  containerColor: tapType == TapType.waiting
                      ? AppColors.primary
                      : AppColors.whit200,
                  textColor: tapType == TapType.waiting
                      ? AppColors.whit
                      : AppColors.gry400,
                ),
                TapWidgets(
                  onTap: () {
                    setState(() {
                      tapType = TapType.finished;
                    });
                  },
                  libele: 'Finished',
                  containerColor: tapType == TapType.finished
                      ? AppColors.primary
                      : AppColors.whit200,
                  textColor: tapType == TapType.finished
                      ? AppColors.whit
                      : AppColors.gry400,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  if (tapType == TapType.all) {
                    return const AllTasks();
                  } else if (tapType == TapType.inProgress) {
                    return const InProgress();
                  } else if (tapType == TapType.waiting) {
                    return const Waiting();
                  } else if (tapType == TapType.finished) {
                    return const Finished();
                  }
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
