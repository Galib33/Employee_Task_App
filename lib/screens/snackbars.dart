import '../cubits/employees/employee_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_paddings.dart';
import '../constants/colors/app_colors.dart';
import '../constants/texts/app_texts.dart';
import '../constants/texts/app_titles.dart';

class Snackbars {
  static void generalShow(BuildContext context,
      {required Color color, required String snackbarMessage}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        snackbarMessage,
        style: const TextStyle(color: AppColors.whiteColor),
      ),
      backgroundColor: color,
      duration: const Duration(milliseconds: 800),
    ));
  }

  static void deletedShow(
    BuildContext context,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      padding: AppPaddings.left16T0B0,
      action: SnackBarAction(
        label: AppTitles.undo,
        onPressed: () {
          context.read<EmployeeCubit>().undo();
        },
        textColor: AppColors.primaryColor,
      ),
      content: Text(
        AppTexts.employeeDeletedWarning,
        style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w400),
      ),
      backgroundColor: AppColors.textBlackColor,
      duration: const Duration(seconds: 15),
    ));
  }
}
