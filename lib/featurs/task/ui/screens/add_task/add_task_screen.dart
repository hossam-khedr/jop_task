import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jop_task/core/app_icons.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_stylse.dart';
import 'package:jop_task/core/widgets/custom_button.dart';
import 'package:jop_task/core/widgets/custom_snack_bar.dart';
import 'package:jop_task/core/widgets/custom_text.dart';
import 'package:jop_task/core/widgets/custom_text_form_field.dart';
import 'package:jop_task/featurs/task/data/models/task_model.dart';
import 'package:jop_task/featurs/task/logic/cubit.dart';
import 'package:jop_task/featurs/task/logic/state.dart';
import 'package:jop_task/featurs/task/ui/screens/add_task/widgets/add_image.dart';
import 'package:jop_task/featurs/task/ui/screens/add_task/widgets/app_bar.dart';
import 'package:jop_task/featurs/task/ui/screens/add_task/widgets/priority_widget.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController taskTitle = TextEditingController();
  TextEditingController taskDesc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskStates>(
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
            massage: 'Task added successfully',
            snackBarType: SnackBarType.success,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const AddTaskAppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.scaledWidth(22),
                  vertical: context.scaledHeight(24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AddImage(),
                  SizedBox(
                    height: context.scaledHeight(16),
                  ),
                  CustomText(
                      text: 'Task title', style: AppStyles.addTaskHintStyle()),
                  CustomTextFormField(
                    hintText: 'Enter title here...',
                    controller: taskTitle,
                  ),
                  SizedBox(
                    height: context.scaledHeight(16),
                  ),
                  CustomText(
                      text: 'Task Description',
                      style: AppStyles.addTaskHintStyle()),
                  CustomTextFormField(
                    hintText: 'Enter description here...',
                    maxLines: 6,
                    controller: taskDesc,
                  ),
                  SizedBox(
                    height: context.scaledHeight(16),
                  ),
                  CustomText(
                      text: 'Priority', style: AppStyles.addTaskHintStyle()),
                  const PriorityWidget(),
                  SizedBox(
                    height: context.scaledHeight(16),
                  ),
                  CustomText(
                      text: 'Due date', style: AppStyles.addTaskHintStyle()),
                  CustomTextFormField(
                    hintText: state.selectedDate != null
                        ? state.dataFormat
                        : 'choose due date...',
                    readOnly: true,
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(context.scaledWidth(10)),
                      child: GestureDetector(
                        onTap: () {
                          context.read<TaskCubit>().pickeDate(context);
                        },
                        child: SvgPicture.asset(SvgIcons.calender),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.scaledHeight(24),
                  ),
                  state.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomButton(
                          text: 'Add task',
                          onPressed: () {
                            TaskModel task = TaskModel(
                              image: context.read<TaskCubit>().selectedImage?.path,
                                title: taskTitle.text,
                                desc: taskDesc.text,
                                priority: state.selectedPriority,
                                dueDate: state.dataFormat);
                            context.read<TaskCubit>().addTask(task);
                          },
                        )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
