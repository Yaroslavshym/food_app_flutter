import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/style/my_colors.dart';
import '../../../../../theme/style/my_text_style.dart';
import 'my_text_input.dart';

class TextForm extends StatelessWidget {
  final String name;
  final TextEditingController textEditingController;
  bool obscureText;
  final bool isSuffixIcon;
  final bool isBorderHighlight;
  final void Function(String text) onChanged;
  final Widget extraWidget;

  TextForm({
    required this.onChanged,
    required this.name,
    required this.textEditingController,
    this.obscureText = false,
    this.isSuffixIcon = false,
    this.isBorderHighlight = false,
    this.extraWidget = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          name,
          style: MyText.body.textStyle.copyWith(
            color: MyColors.black100.color,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 8.h,
        ),
        extraWidget,
        // Extra widget
        MyTextInput(
          textStyle: MyText.body.textStyle.copyWith(
            color: MyColors.black.color,
          ),
          isBorderHighlight: isBorderHighlight,
          obscurePasswordText: obscureText,
          isSuffixIcon: isSuffixIcon,
          textEditingController: textEditingController,
          hintText: 'Enter your ${name.toLowerCase()}',
          onChanged: onChanged,
        ),
      ],
    );
  }
}
