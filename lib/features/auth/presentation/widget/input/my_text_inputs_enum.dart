import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app_flutter/features/auth/presentation/widget/input/text_form.dart';

import '../../../../../theme/style/my_colors.dart';
import '../../../../../theme/style/my_text_style.dart';
import '../../bloc/auth_bloc.dart';

enum MyTextInputs { name, password, email }

extension MyTextInputsExtension on MyTextInputs {
  Widget widget({
    required BuildContext context,
    required TextEditingController textEditingController,
    bool isValidation = false,
  }) {
    void updateController(String controllerName) {
      context.read<AuthBloc>().add(AuthTextControllerChange(
          controllerName: controllerName.toLowerCase(),
          controllerText: textEditingController.text));
    }

    switch (this) {
      case MyTextInputs.email:
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return TextForm(
              isBorderHighlight:
                  !context.read<AuthBloc>().isEmailValidated && isValidation,
              textEditingController: textEditingController,
              name: 'Email',
              onChanged: (String text) {
                updateController('Email');
                if (isValidation) {
                  context.read<AuthBloc>().add(AuthEmailValidation());
                }
              },
            );
          },
        );
      case MyTextInputs.name:
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return TextForm(
              isBorderHighlight:
                  !context.read<AuthBloc>().isNameValidated && isValidation,
              textEditingController: textEditingController,
              name: 'Name',
              onChanged: (String text) {
                updateController('Name');
                if (isValidation) {
                  context.read<AuthBloc>().add(AuthNameValidation());
                }
              },
            );
          },
        );
      case MyTextInputs.password:
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return TextForm(
              textEditingController: textEditingController,
              isBorderHighlight:
                  !context.read<AuthBloc>().isPasswordValidated && isValidation,
              name: 'Password',
              extraWidget: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  List<String> passwordProblems =
                      context.read<AuthBloc>().passwordControllerProblems;

                  return passwordProblems.isNotEmpty && isValidation
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Password should contain:',
                              style: MyText.body.textStyle.copyWith(
                                  color: MyColors.orange.color,
                                  fontSize:
                                      (MyText.body.textStyle.fontSize ?? 0) *
                                          0.8),
                              textAlign: TextAlign.start,
                            ),
                            RichText(
                              text: TextSpan(
                                children: List.generate(
                                  passwordProblems.length,
                                  (int i) {
                                    return TextSpan(
                                      children: [
                                        TextSpan(text: ' * '),
                                        TextSpan(
                                          text:
                                              '${passwordProblems.elementAt(i)}${i == passwordProblems.length - 1 ? "" : "\n"}',
                                          style: MyText.body.textStyle.copyWith(
                                            color: MyColors.orange.color,
                                            fontSize: (MyText.body.textStyle
                                                        .fontSize ??
                                                    0) *
                                                0.8,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            )
                          ],
                        )
                      : SizedBox();
                },
              ),
              obscureText: true,
              isSuffixIcon: true,
              onChanged: (String text) {
                updateController('Password');
                if (isValidation) {
                  context.read<AuthBloc>().add(AuthPasswordValidation());
                }
              },
            );
          },
        );
    }
  }
}
