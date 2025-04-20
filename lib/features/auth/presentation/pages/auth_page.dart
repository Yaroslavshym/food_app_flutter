import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app_flutter/features/auth/domain/usecases/google_auth_use_case.dart';
import 'package:food_app_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:food_app_flutter/features/auth/presentation/widget/input/my_text_inputs_enum.dart';
import 'package:food_app_flutter/features/auth/presentation/widget/my_button.dart';
import 'package:food_app_flutter/theme/style/my_colors.dart';
import 'package:food_app_flutter/theme/style/my_text_style.dart';

import '../../../welcome/presentation/widget/my_icon_button.dart';
import '../widget/my_checkbox.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageNames = [
      'google_icon',
      'facebook_icon',
      'apple_icon'
    ];
    return Scaffold(
        backgroundColor: MyColors.white.color,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 32.h,
                  ),
                  // title
                  BlocSelector<AuthBloc, AuthState, bool>(
                    selector: (state) => state is AuthLoginState,
                    builder: (context, isLoginState) {
                      return Text(
                        isLoginState
                            ? 'Login to your\naccount'
                            : 'Create your new\naccount',
                        style: MyText.h4.textStyle.copyWith(
                          color: MyColors.black100.color,
                        ),
                        textAlign: TextAlign.start,
                      );
                    },
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  // subtitle
                  BlocSelector<AuthBloc, AuthState, bool>(
                    selector: (state) => state is AuthLoginState,
                    builder: (context, isLoginState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isLoginState
                                ? 'Please sign in to your account '
                                : 'Create an account to start looking for the food you like',
                            style: MyText.body.textStyle.copyWith(
                              color: MyColors.grey60.color,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: isLoginState ? 32.h : 12.h),
                        ],
                      );
                    },
                  ),
                  // email input bloc title + text field
                  BlocSelector<AuthBloc, AuthState, bool>(
                    selector: (state) => state is AuthRegisterState,
                    builder: (context, isRegisterState) {
                      return MyTextInputs.email.widget(
                        textEditingController:
                            context.read<AuthBloc>().emailController,
                        isValidation: isRegisterState,
                        context: context,
                      );
                    },
                  ),

                  SizedBox(
                    height: 14.h,
                  ),
                  // name input bloc title + text field
                  BlocSelector<AuthBloc, AuthState, bool>(
                      selector: (state) => state is AuthRegisterState,
                      builder: (context, isRegisterState) {
                        return isRegisterState
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyTextInputs.name.widget(
                                      textEditingController: context
                                          .read<AuthBloc>()
                                          .nameController,
                                      context: context,
                                      isValidation: isRegisterState),
                                  SizedBox(
                                    height: 14.h,
                                  ),
                                ],
                              )
                            : SizedBox();
                      }),
                  // password input bloc title + text field
                  BlocSelector<AuthBloc, AuthState, bool>(
                    selector: (state) => state is AuthRegisterState,
                    builder: (context, isRegisterState) {
                      return MyTextInputs.password.widget(
                          isValidation: isRegisterState,
                          textEditingController:
                              context.read<AuthBloc>().passwordController,
                          context: context);
                    },
                  ),
                  // forgot password +
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      bool isLoginState = state is AuthLoginState;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 24.h),
                          // forgot password
                          if (isLoginState)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Forgot password?',
                                  textAlign: TextAlign.end,
                                  style: MyText.body.textStyle.copyWith(
                                    color: MyColors.orange.color,
                                  ),
                                ),
                              ],
                            ),
                          // terms agree + checkbox
                          if (!isLoginState)
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // checkbox
                                  MyCheckBox(
                                    state: state,
                                    value:
                                        context.read<AuthBloc>().isTermsAgreed,
                                    onChanged: (bool? newValue) {
                                      context.read<AuthBloc>().add(
                                            AuthTogglePrivacyAgree(
                                              newIsAgree: newValue ?? false,
                                            ),
                                          );
                                    },
                                  ),
                                  SizedBox(width: 8.w),
                                  // terms of service
                                  RichText(
                                    text: TextSpan(
                                      style: MyText.body.textStyle.copyWith(
                                        color: MyColors.black100.color,
                                      ),
                                      children: [
                                        TextSpan(text: 'I Agree with '),
                                        TextSpan(
                                          text: 'Terms of Service',
                                          style: MyText.body.textStyle.copyWith(
                                            color: MyColors.orange.color,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {},
                                        ),
                                        TextSpan(text: ' and '),
                                        TextSpan(
                                          text: 'Privacy\nPolicy',
                                          style: MyText.body.textStyle.copyWith(
                                            color: MyColors.orange.color,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      );
                    },
                  ),

                  SizedBox(
                    height: 24.h,
                  ),
                  BlocSelector<AuthBloc, AuthState, bool>(
                    selector: (state) => state is AuthLoginState,
                    builder: (context, isLoginState) {
                      return MyButton(
                        textStyle: MyText.body.textStyle
                            .copyWith(color: MyColors.white.color),
                        buttonDecoration: BoxDecoration(
                            color: MyColors.orange.color,
                            borderRadius: BorderRadius.circular(100.r)),
                        text: isLoginState ? 'Log in' : 'Register',
                        onTap: isLoginState
                            ? () =>
                                context.read<AuthBloc>().add(AuthLoginPressed())
                            : () => context
                                .read<AuthBloc>()
                                .add(AuthRegisterPressed()),
                      );
                    },
                  ),
                  BlocSelector<AuthBloc, AuthState, bool>(
                    selector: (state) => state is AuthLoginState,
                    builder: (context, isLoginState) {
                      return isLoginState
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 24.h,
                                ),
                                Container(
                                  child: FittedBox(
                                    fit: BoxFit.none,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(
                                        3,
                                        (i) {
                                          if (i == 1) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 16.w),
                                                  child: Text(
                                                    'Or sign in with',
                                                    style: MyText.body.textStyle
                                                        .copyWith(
                                                            color: MyColors
                                                                .grey60.color,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }

                                          return Container(
                                            color: MyColors.grey60.color,
                                            width: 99.5.w,
                                            height: 1.h,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(5, (i) {
                                    if ([1, 3].contains(i)) {
                                      return SizedBox(width: 16.w);
                                    }
                                    return MyIconButton(
                                      imageName: imageNames.elementAt(i == 2
                                          ? 1
                                          : i == 4
                                              ? 2
                                              : 0),
                                      onTap: () {
                                        if (i == 0) {
                                          GoogleAuthUseCase()
                                              .signInWithGoogle();
                                        }
                                      },
                                    );
                                  }),
                                ),
                              ],
                            )
                          : SizedBox();
                    },
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  BlocSelector<AuthBloc, AuthState, bool>(
                    selector: (state) => state is AuthLoginState,
                    builder: (context, isLoginState) {
                      return Center(
                        child: RichText(
                          text: TextSpan(
                            style: MyText.body.textStyle
                                .copyWith(color: MyColors.black100.color),
                            children: [
                              TextSpan(
                                  text: isLoginState
                                      ? "Have an account? "
                                      : "Don't have account? "),
                              TextSpan(
                                text: isLoginState ? 'Register' : 'Sign in',
                                style: MyText.body.textStyle
                                    .copyWith(color: MyColors.orange.color),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = isLoginState
                                      ? () => context.read<AuthBloc>().add(
                                            AuthGoRegisterPressed(),
                                          )
                                      : () => context.read<AuthBloc>().add(
                                            AuthGoLoginPressed(),
                                          ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                ],
              ),
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return Container(
                    color: Colors.black.withValues(alpha: 0.3),
                    child: Center(
                      child: CircularProgressIndicator(
                          color: MyColors.orange.color),
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ],
        ));
  }
}
