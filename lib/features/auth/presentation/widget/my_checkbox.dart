import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/style/my_colors.dart';

class MyCheckBox extends StatelessWidget {
  final state;
  final bool value;
  final void Function(bool?) onChanged;
  const MyCheckBox({
    super.key,
    required this.onChanged,
    required this.state,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: value ? MyColors.orange.color : Colors.transparent,
        border: Border.all(
          color: value ? Colors.transparent : MyColors.grey40.color,
          width: 1.h,
        ),
        borderRadius: BorderRadius.circular(4.r),
      ),
      width: 20.w,
      height: 20.h,
      child: Checkbox(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.transparent,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        side: BorderSide(
          color: Colors.transparent, // outline color when unchecked
        ),
      ),
    );
  }
}
