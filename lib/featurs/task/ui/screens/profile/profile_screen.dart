import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jop_task/core/app_icons.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_stylse.dart';
import 'package:jop_task/core/widgets/custom_app_bar.dart';
import 'package:jop_task/core/widgets/custom_snack_bar.dart';
import 'package:jop_task/core/widgets/custom_text.dart';
import 'package:jop_task/featurs/task/ui/screens/profile/logic/cubit.dart';
import 'package:jop_task/featurs/task/ui/screens/profile/logic/states.dart';
import 'package:jop_task/featurs/task/ui/screens/profile/widgets/body_profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBat(title: 'Profile'),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.scaledWidth(24),
          vertical: context.scaledHeight(24),
        ),
        child: BlocBuilder<ProfileCubit, ProfileStates>(
          builder: (context, state) {
            if (state.isGetUserInfoError) {
              return Center(
                child: CustomText(
                  text: state.errorMsg,
                  style: AppStyles.errorStyle(),
                ),
              );
            }
            if (state.isGetUserInfoLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.isGetUserInfoSuccess) {
              return Column(
                spacing: context.scaledHeight(8),
                children: [
                  BodyProfileWidget(
                    title: 'NAME',
                    subTitle: state.model?.displayName ?? 'no name',
                  ),
                  BodyProfileWidget(
                    title: 'PHONE',
                    subTitle: state.model?.username ?? 'no phone',
                    leading: InkWell(
                      onTap: () {
                        Clipboard.setData(
                             ClipboardData(text: state.model?.username??''));
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
                    subTitle: state.model?.level ?? 'no level',
                  ),
                  BodyProfileWidget(
                    title: 'YEARS OF EXPERIENCE',
                    subTitle: state.model!.experienceYears.toString(),
                  ),
                  BodyProfileWidget(
                    title: 'LOCATION',
                    subTitle: state.model?.address ?? 'no address',
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
