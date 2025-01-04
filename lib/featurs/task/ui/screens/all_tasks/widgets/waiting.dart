import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jop_task/core/app_responsive.dart';
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
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<TasksCubit>(context);
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<TasksCubit, TasksStates>(builder: (context, state) {
        if(state.isGetTasksSuccess){
          if(state.waitingList.isEmpty){
            return Center(
              child:
              Image.asset(
                'assets/images/empty.png',
                height: context.scaledHeight(150),
              ),


            );
          }else{
            return ListView.builder(
                itemCount: state.waitingList.length,
                itemBuilder: (context, index) {

                  return Text(state.waitingList[index].status??"no Status");
                });
          }

        }else{
          return const SizedBox.shrink();
        }

      }),
    );
  }
}
