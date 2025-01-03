import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jop_task/core/app_responsive.dart';


import 'package:jop_task/featurs/task/ui/screens/all_tasks/logic/cubit.dart';
import 'package:jop_task/featurs/task/ui/screens/all_tasks/logic/states.dart';
import 'package:jop_task/featurs/task/ui/screens/all_tasks/widgets/task_item.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({super.key});

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  @override
  void initState() {
    super.initState();
    context.read<TasksCubit>().getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<TasksCubit>(context);
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<TasksCubit, TasksStates>(
        builder: (context, state) {
          if (state.isGetTasksError) {
            return Center(child: Text(state.errorMsg));
          }
          if (state.isGetTasksLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.isGetTasksSuccess) {
            if (state.tasks.isEmpty) {
              return Center(
                child:
                  Image.asset(
                  'assets/images/empty.png',
                  height: context.scaledHeight(150),
                ),


              );
            }
            return NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.pixels ==
                        notification.metrics.maxScrollExtent &&
                    Notification is ScrollUpdateNotification) {
                  cubit.getAllTasks();
                }
                return true;
              },
              child: ListView.builder(
                  itemCount: state.tasks.length,
                  itemBuilder: (context, index) {
                    return AllTasksItem(
                      model: state.tasks[index],
                    );
                  }),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
