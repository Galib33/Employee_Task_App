// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';

class AppInputBorders {
  AppInputBorders._();

  
  static InputBorder globalInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.lightGrayColor),
      borderRadius: BorderRadius.all(const Radius.circular(4).r));
 
}
