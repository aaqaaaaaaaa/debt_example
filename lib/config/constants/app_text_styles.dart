import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

abstract class AppTextStyles {
  const AppTextStyles._();

  static const String fontFamily = 'Rubik';

  static TextStyle head25w9 = TextStyle(
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.normal,
      fontSize: 25.sp,
      color: AppColors.greyColor);

  static TextStyle head12w4 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 12.sp,
      color: AppColors.primaryTextColor);

  static TextStyle head16w5 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 16.sp,
      color: AppColors.white);
}
