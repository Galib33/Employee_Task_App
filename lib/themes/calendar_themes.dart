import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../constants/app_text_style.dart';
import '../constants/colors/app_colors.dart';

class CalendarThemes {
  CalendarThemes._();

  static CalendarStyle defaultCalendarStyle(bool isDateNull) {
    return CalendarStyle(
        selectedDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDateNull ? Colors.transparent : AppColors.primaryColor),
        defaultTextStyle:
            AppTextStyle.longInputTextStyle.copyWith(fontSize: 15.sp),
        todayTextStyle: AppTextStyle.longInputTextStyle.copyWith(
            fontSize: 15.sp,
            color:
                isDateNull ? AppColors.textBlackColor : AppColors.primaryColor),
        todayDecoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color:
                    isDateNull ? Colors.transparent : AppColors.primaryColor)),
        outsideDaysVisible: false);
  }

  static HeaderStyle defaultHeaderStyle(bool? isCurrentMonth, bool? isEndDate) {
    return HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        leftChevronMargin: const EdgeInsets.only(left: 82.5).r,
        rightChevronMargin: const EdgeInsets.only(right: 82.5).r,
        leftChevronPadding: EdgeInsets.zero,
        rightChevronPadding: EdgeInsets.zero,
        leftChevronIcon: Icon(
          Icons.arrow_left_rounded,
          color: (isCurrentMonth == true && isEndDate == true)
              ? AppColors.lightGrayColor
              : AppColors.textGrayColor,
          size: 44,
        ),
        rightChevronIcon: const Icon(
          Icons.arrow_right_rounded,
          color: AppColors.textGrayColor,
          size: 44,
        ),
        titleTextStyle: AppTextStyle.textBlack16.copyWith(fontSize: 18.sp));
  }
}
