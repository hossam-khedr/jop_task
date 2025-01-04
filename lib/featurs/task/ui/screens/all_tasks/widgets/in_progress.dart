import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/featurs/task/ui/screens/all_tasks/logic/cubit.dart';
import 'package:jop_task/featurs/task/ui/screens/all_tasks/logic/states.dart';



class InProgress extends StatefulWidget {
  const InProgress({super.key});

  @override
  State<InProgress> createState() => _InProgressState();
}

class _InProgressState extends State<InProgress> {

  @override
  void initState() {
    super.initState();
    context.read<TasksCubit>().getInProgressTask('inProgress');
  }
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<TasksCubit>(context);
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<TasksCubit, TasksStates>(builder: (context, state) {
        if(state.isGetTasksSuccess){
          if(state.inProgressList.isEmpty){
            return Center(
              child:
              Image.asset(
                'assets/images/empty.png',
                height: context.scaledHeight(150),
              ),


            );
          }else{
            return ListView.builder(
                itemCount: state.inProgressList.length,
                itemBuilder: (context, index) {

                  return Text(state.inProgressList[index].status??"no Status");
                });
          }

        }else{
          return const SizedBox.shrink();
        }

      }),
    );
  }
}
