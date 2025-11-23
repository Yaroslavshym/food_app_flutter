import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  final TextStyle textStyle;
  final String text;
  final VoidCallback onTap;
  final Size? buttonSize;
  final BoxDecoration? buttonDecoration;
  const MyButton({super.key, 
    required this.textStyle,
    required this.text,
    required this.onTap,
    this.buttonSize,
    this.buttonDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonSize?.width ?? 327.w,
        height: buttonSize?.height ?? 52.h,
        decoration: buttonDecoration,
        child: Center(
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
