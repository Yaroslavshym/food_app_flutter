import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app_flutter/theme/style/my_colors.dart';

class MyIconButton extends StatelessWidget {
  final String imageName;
  final VoidCallback onTap;
  const MyIconButton({Key? key, required this.imageName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            height: 40.h,
            width: 40.w,
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: MyColors.grey60.color,
                width: 1.w,
              ),
            ),
            child: Image.asset(
              'lib/features/welcome/presentation/images/$imageName.png',
              fit: BoxFit.fill,
              color: CoreColors.darkTheme && imageName == 'apple_icon'
                  ? Colors.white
                  : null, // This tints it!
              // colorBlendMode: BlendMode.srcIn,
            )));
  }
}
