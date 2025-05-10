import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryButton extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final String label;
  const CategoryButton({
    Key? key,
    this.isActive = false,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: 59.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }
}
