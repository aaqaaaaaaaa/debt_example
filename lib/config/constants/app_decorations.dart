import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

abstract class AppDecorations {
  // static BoxDecoration defDecor = BoxDecoration(
  //   borderRadius: BorderRadius.circular(10),
  //   color: AppColors.metalColor.shade10,
  // );

  static ButtonStyle buttonStyle({
    double? borderRadius,
    Color? bgColor,
    BorderSide? border,
  }) {
    return ElevatedButton.styleFrom(
      shadowColor: Colors.transparent,
      fixedSize: Size.fromHeight(40.h),
      elevation: 0,
      backgroundColor: bgColor ?? AppColors.greenColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
      ),
    );
  }
}
