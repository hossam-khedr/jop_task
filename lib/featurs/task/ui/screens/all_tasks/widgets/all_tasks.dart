import 'package:flutter/material.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/featurs/task/ui/screens/all_tasks/widgets/task_item.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
        itemBuilder:(context,index){
      return const TaskItem();
    });
  }
}
