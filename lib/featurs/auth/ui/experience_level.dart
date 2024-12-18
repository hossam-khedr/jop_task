import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jop_task/core/app_stylse.dart';
import 'package:jop_task/featurs/auth/logic/cubit.dart';
import 'package:jop_task/featurs/auth/logic/states.dart';

import '../../../core/app_colors.dart';

class ExperienceLevelWidget extends StatefulWidget {
  const ExperienceLevelWidget({super.key});

  @override
  State<ExperienceLevelWidget> createState() => _ExperienceLevelWidgetState();
}

class _ExperienceLevelWidgetState extends State<ExperienceLevelWidget> {
  List<String> levels = ['fresh', 'junior', 'midLevel','senior',];
  String selectedLevel = 'fresh';

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);
    return BlocProvider.value(
      value:cubit ,
      child: BlocBuilder<AuthCubit,AuthStates>(
        builder: (context,state){
          return DropdownButtonFormField(
            hint: Text(
              'Choose experience Level',
              style: AppStyles.dropDownHintStyle(),
            ),
            value: state.experienceLevel,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.gry200,
                  width: 0.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.gry200,
                  width: 0.5,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.error,
                  width: 1,
                ),
              ),
            ),
            items: levels
                .map(
                  (level) => DropdownMenuItem<String>(
                value: level,
                child: Text(level),
              ),
            )
                .toList(),
            onChanged: (value) {
                if (value != null) {
                  cubit.updateLevelValue(value);
                }
            },
          );
        },

      ),
    );
  }
}
