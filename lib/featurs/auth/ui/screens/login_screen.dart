import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_icons.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_router/route_name.dart';
import 'package:jop_task/core/app_strings.dart';
import 'package:jop_task/core/app_stylse.dart';
import 'package:jop_task/core/params/login_params.dart';
import 'package:jop_task/core/widgets/custom_button.dart';
import 'package:jop_task/core/widgets/custom_snack_bar.dart';
import 'package:jop_task/core/widgets/custom_text.dart';
import 'package:jop_task/featurs/auth/logic/cubit.dart';
import 'package:jop_task/featurs/auth/logic/states.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../country_code.dart';
import '../dont_have_account.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state.isError) {
            CustomSnackBar.show(
                context: context,
                massage: state.errorMessage ?? '',
                snackBarType: SnackBarType.error);
          }
          if (state.isSuccess) {
            CustomSnackBar.show(
              context: context,
              massage: 'Login successfully',
              snackBarType: SnackBarType.success,
            );
            Navigator.pushNamedAndRemoveUntil(context, RouteName.task, (route)=>false);
          }
        },
        builder: (context, state) {
          return ListView(
            children: [
              SizedBox(
                height: context.scaledHeight(10),
              ),
              Image.asset(
                height: context.scaledHeight(420),
                fit: BoxFit.cover,
                'assets/images/Frame.png',
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.scaledWidth(22)),
                child: Form(
                  key: key,
                  child: Column(
                    spacing: context.scaledHeight(24),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: AppStrings.loginText,
                        style: AppStyles.titleStyle(),
                      ),
                      CustomTextFormField(
                        controller: phoneController,
                        hintText: AppStrings.phoneHint,
                        keyboardType: TextInputType.phone,
                        prefixIcon: const CountryCode(),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Phone number is required';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        controller: passwordController,
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
                        hintText: AppStrings.passwordHint,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: state.obscureText,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'password is required';
                          }
                          return null;
                        },
                      ),
                      state.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : CustomButton(
                              text: AppStrings.signInText,
                              onPressed: () {
                                LoginParams params = LoginParams(
                                  phoneNumber: phoneController.text,
                                  password: passwordController.text,
                                );
                                if (key.currentState!.validate()) {
                                  context.read<AuthCubit>().login(params);
                                }
                              },
                            ),
                      Align(
                        alignment: Alignment.center,
                        child: DontHaveAccount(
                          message: AppStrings.dontHaveAccount,
                          action: AppStrings.signUpHere,
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.register);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
  @override
  void dispose() {
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
