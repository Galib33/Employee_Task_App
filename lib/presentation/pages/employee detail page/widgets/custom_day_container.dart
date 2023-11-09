import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/app_text_style.dart';
import '../../../../constants/colors/app_colors.dart';

class CustomDayContainer extends StatelessWidget {
  final String day;
  final Color? dayColor;
  const CustomDayContainer(
      {super.key, required this.day, this.dayColor = AppColors.lightGrayColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(day,
          style: AppTextStyle.longInputTextStyle
              .copyWith(fontSize: 15.sp, color: dayColor)),
    );
  }
}
