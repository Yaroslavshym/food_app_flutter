import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app_flutter/theme/style/my_colors.dart';
import 'package:food_app_flutter/theme/style/my_text_style.dart';

class CategoryButton extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final String label;
  final VoidCallback onTap;
  final double? buttonHeight;
  final double? buttonWidth;

  const CategoryButton({
    super.key,
    this.isActive = false,
    required this.label,
    required this.imageUrl,
    required this.onTap,
    this.buttonHeight,
    this.buttonWidth,
  });

  @override
  Widget build(BuildContext context) {
    print(label);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        height: buttonHeight,
        width: 59.w,
        decoration: BoxDecoration(
          color: isActive ? MyColors.orange.color : MyColors.grey10.color,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //   icon
            Image.network(imageUrl),

            //   title
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                label,
                style: MyText.body.textStyle.copyWith(
                  color:
                      isActive ? MyColors.grey10.color : MyColors.grey60.color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
