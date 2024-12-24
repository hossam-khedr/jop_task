import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_router/route_name.dart';
import 'package:jop_task/core/app_stylse.dart';
import 'package:jop_task/core/widgets/custom_button.dart';
import 'package:jop_task/core/widgets/custom_text.dart';
import 'package:jop_task/core/widgets/custom_text_form_field.dart';
import 'package:jop_task/featurs/auth/data/models/register_model.dart';
import 'package:jop_task/featurs/auth/logic/cubit.dart';
import 'package:jop_task/featurs/auth/logic/states.dart';
import 'package:jop_task/featurs/auth/ui/dont_have_account.dart';

import '../../../../core/app_icons.dart';
import '../../../../core/app_strings.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../country_code.dart';
import '../experience_level.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController yearsOfExperience = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();
  final registerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(context.scaledWidth(24.5)),
      child: SingleChildScrollView(
        child: BlocConsumer<AuthCubit, AuthStates>(
          listener: (context, state) {
            if (state.isRegisterError) {
              CustomSnackBar.show(
                  context: context,
                  massage: state.errorMessage ?? '',
                  snackBarType: SnackBarType.error);
            }
            if (state.isRegisterSuccess) {
              CustomSnackBar.show(
                context: context,
                massage: 'Register successfully',
                snackBarType: SnackBarType.success,
              );
              Navigator.pushReplacementNamed(context, RouteName.login);
            }
          },
          builder: (context, state) {
            return Form(
              key: registerKey,
              child: Column(
                spacing: context.scaledHeight(24.5),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.scaledHeight(10),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: context.scaledHeight(400),
                    child: Image.asset(
                      // height: 200,
                      //width: double.infinity,
                      fit: BoxFit.cover,
                      'assets/images/Frame.png',
                    ),
                  ),
                  CustomText(
                    text: 'Register',
                    style: AppStyles.titleStyle(),
                  ),
                  CustomTextFormField(
                    hintText: 'Name',
                    keyboardType: TextInputType.name,
                    controller: fullName,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    hintText: AppStrings.phoneHint,
                    keyboardType: TextInputType.phone,
                    prefixIcon: CountryCode(),
                    controller: phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'phone is required';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    hintText: 'Years of experience...',
                    keyboardType: TextInputType.number,
                    controller: yearsOfExperience,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Experience is required';
                      }
                      return null;
                    },
                  ),
                  const ExperienceLevelWidget(),
                  CustomTextFormField(
                    keyboardType: TextInputType.streetAddress,
                    hintText: 'Address...',
                    controller: address,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Address is required';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.scaledWidth(12),
                      ),
                      child: InkWell(
                        onTap: () {
                          context
                              .read<AuthCubit>()
                              .passwordShow(state.obscureText);
                        },
                        child: SvgPicture.asset(SvgIcons.eye),
                      ),
                    ),
                    obscureText: state.obscureText,
                    hintText: AppStrings.passwordHint,
                    keyboardType: TextInputType.visiblePassword,
                    controller: password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                  state.isRegisterLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomButton(
                          text: 'Sign up',
                          onPressed: () {
                            RegisterModel model = RegisterModel(
                              displayName: fullName.text,
                              phone: phone.text,
                              experienceYears: int.tryParse(yearsOfExperience.text),
                              level: state.experienceLevel,
                              address: address.text,
                              password: password.text
                            );
                            if (registerKey.currentState!.validate()) {
                              context.read<AuthCubit>().register(model);
                            }
                          },
                        ),
                  Align(
                    alignment: Alignment.center,
                    child: DontHaveAccount(
                      message: 'Already have any account?',
                      action: 'Sign in',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    ));
  }
  @override
  void dispose() {
    fullName.dispose();
    phone.dispose();
    password.dispose();
    yearsOfExperience.dispose();
    address.dispose();
    super.dispose();
  }
}
