import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors/app_colors.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle textGray14 =
      TextStyle(fontSize: 14.sp, color: AppColors.textGrayColor);
  static TextStyle longInputHintStyle = TextStyle(
      color: AppColors.textGrayColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400);
  static TextStyle longInputTextStyle = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.textBlackColor);

  static TextStyle black18 = TextStyle(
      fontSize: 18.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w500);

  static TextStyle textBlack16 = TextStyle(
      fontSize: 16.sp,
      color: AppColors.textBlackColor,
      fontWeight: FontWeight.w500);

  static TextStyle primary16 = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
}
