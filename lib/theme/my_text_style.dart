import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// if something need to be change to style specifically .copyWith should be used
enum MyText { body, h4 }

extension MyTextExtension on MyText {
  TextStyle get textStyle {
    switch (this) {
      case MyText.body:
        return TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          height: (20 / 14).sp,
        );
      case MyText.h4:
        return TextStyle(
          color: Colors.white,
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
          height: (40 / 32).sp,
        );
    }
  }
}
