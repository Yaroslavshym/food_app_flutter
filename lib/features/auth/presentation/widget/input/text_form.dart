import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/style/my_colors.dart';
import '../../../../../theme/style/my_text_style.dart';
import 'my_text_input.dart';

class TextForm extends StatelessWidget {
  final String
      name; // text at the top of input and inside field 'Enter your $name'
  final TextEditingController textEditingController;
  bool obscureText; // do we hide the text
  final bool isSuffixIcon; // do we add icon such as hide password
  final bool isBorderHighlight; // do we need to highlight the border
  final void Function(String text) onChanged; // when user types something
  final Widget extraWidget; // Used for password problems

  TextForm({super.key, 
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
