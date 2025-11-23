import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app_flutter/theme/style/my_colors.dart';
import 'package:food_app_flutter/theme/style/my_text_style.dart';

class MyTextInput extends StatefulWidget {
  final TextEditingController textEditingController;
  bool obscurePasswordText;
  final String hintText;
  final bool isSuffixIcon;
  final void Function(String text) onChanged; // when user types something
  final TextStyle textStyle;
  MyTextInput({
    super.key,
    required this.onChanged,
    required this.textEditingController,
    required this.hintText,
    required this.textStyle,
    this.obscurePasswordText = false,
    this.isSuffixIcon = false,
    this.isBorderHighlight = false,
  });

  final bool isBorderHighlight;

  @override
  State<MyTextInput> createState() => _MyTextInputState();
}

class _MyTextInputState extends State<MyTextInput> {
  @override
  Widget build(BuildContext context) {
    Color outlineColor = widget.isBorderHighlight
        ? MyColors.orange.color
        : MyColors.grey40.color;
    return Container(
        child: TextField(
      style: widget.textStyle,
      onChanged: widget.onChanged,
      controller: widget.textEditingController,
      obscureText: widget.obscurePasswordText,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        suffixIcon: widget.isSuffixIcon
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    widget.obscurePasswordText = !widget.obscurePasswordText;
                  });
                },
                child: Icon(
                  !widget.obscurePasswordText
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: widget.isSuffixIcon
                      ? MyColors.black.color
                      : Colors.transparent,
                ),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: MyText.body.textStyle.copyWith(
          color: MyColors.grey60.color,
          fontWeight: FontWeight.normal,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: outlineColor, width: 1.h),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: outlineColor, width: 1.h),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: outlineColor, width: 1.h),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: outlineColor, width: 1.h),
        ),
      ),
    ));
  }
}
