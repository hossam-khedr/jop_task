import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jop_task/core/app_icons.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/widgets/custom_snack_bar.dart';
import 'package:jop_task/featurs/task/logic/cubit.dart';
import 'package:jop_task/featurs/task/logic/state.dart';
import 'package:jop_task/featurs/task/ui/screens/profile/widgets/body_profile_widget.dart';
import 'package:jop_task/featurs/task/ui/screens/profile/widgets/profile_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TaskCubit>().getUserInfo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.scaledWidth(24),
          vertical: context.scaledHeight(24),
        ),
        child: BlocBuilder<TaskCubit,TaskStates>(
          builder: (context,state){
            if(state.isError){
              return Center(child: Text(state.errorMessage??''),);
            }
            if(state.isLoading){
              return const Center(child: CircularProgressIndicator());
            }
            if(state.isSuccess){
              return Column(
                spacing: context.scaledHeight(8),
                children: [
                   BodyProfileWidget(
                    title: 'NAME',
                    subTitle: state.model?.displayName??'no name',
                  ),
                  BodyProfileWidget(
                    title: 'PHONE',
                    subTitle: state.model?.phone??'no phone',
                    leading: InkWell(
                      onTap: () {
                        Clipboard.setData(
                            const ClipboardData(text: '+20 1514101330'));
                        CustomSnackBar.show(
                          context: context,
                          massage: 'Copyed',
                          snackBarType: SnackBarType.success,
                        );
                      },
                      child: SvgPicture.asset(SvgIcons.copy),
                    ),
                  ),
                   BodyProfileWidget(
                    title: 'LEVEL',
                    subTitle: state.model?.level??'no level',
                  ),
                   BodyProfileWidget(
                    title: 'YEARS OF EXPERIENCE',
                    subTitle: state.model!.experienceYears.toString(),
                  ),
                   BodyProfileWidget(
                    title: 'LOCATION',
                    subTitle: state.model?.address??'no address',
                  ),
                ],
              );
            }
            else{
              return const SizedBox.shrink();
            }
          },

        ),
      ),
    );
  }
}
