import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app_flutter/theme/style/my_text_style.dart';

import '../../../../theme/style/my_colors.dart';
import 'my_button.dart';

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String body;
  final String buttonText;
  final VoidCallback onTap;
  // () => Navigator.pop(context)}
  const MyAlertDialog({super.key, 
    required this.title,
    required this.body,
    this.buttonText = 'OK',
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.orange.color, width: 1.h),
        borderRadius: BorderRadius.circular(24.r),
        color: MyColors.white.color,
      ),
      padding: EdgeInsets.symmetric(horizontal: 35.5.w),
      width: 375.w,
      height: 300.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: MyText.h4.textStyle.copyWith(
              color: MyColors.black100.color,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  body,
                  style: MyText.body.textStyle.copyWith(
                    color: MyColors.grey60.color,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          MyButton(
            textStyle:
                MyText.body.textStyle.copyWith(color: MyColors.white.color),
            buttonDecoration: BoxDecoration(
                color: MyColors.orange.color,
                borderRadius: BorderRadius.circular(100.r)),
            text: buttonText,
            onTap: () => Navigator.pop(context),
          ),
          SizedBox(
            height: 24.h,
          ),
        ],
      ),
    );
  }
}
