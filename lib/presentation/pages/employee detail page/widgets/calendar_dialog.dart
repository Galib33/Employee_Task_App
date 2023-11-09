import 'dart:developer';
import '../../../../constants/texts/app_titles.dart';
import '../../../../extensions/date_formatting.dart';

import '../../../../constants/app_paddings.dart';
import '../../../../cubits/employees/employee_cubit.dart';
import '../../employee%20detail%20page/widgets/certain_days.dart';
import '../../employee%20detail%20page/widgets/custom_table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/app_text_style.dart';
import '../../../../constants/colors/app_colors.dart';
import '../../../widgets/global_button.dart';

class CalendarDialog extends StatelessWidget {
  const CalendarDialog({super.key});

  @override
  Widget build(BuildContext context) {
    EmployeeCubit cubit = context.read<EmployeeCubit>();

    return Center(
      child: Material(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                          top: 24.0, left: 16, right: 16, bottom: 7)
                      .r
                      .r,
                  child: const CertainDays()),
              const CustomTableCalendar(),
              42.verticalSpace,
              Container(
                padding: AppPaddings.all16,
                decoration: const BoxDecoration(
                    border:
                        Border(top: BorderSide(color: AppColors.gray6Color))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      "assets/images/svg/my_calendar.svg",
                      height: 23.h,
                      width: 20.w,
                    ),
                    12.horizontalSpace,
                    ValueListenableBuilder(
                        valueListenable: cubit.textDayNotifier,
                        builder: (context, value, _) {
                          log((cubit.activeCertainDay == "No Date").toString());
                          return Text(
                              
                              DateTime.tryParse(value)?.formatDate ?? "No Date",
                              style: AppTextStyle.longInputTextStyle);
                        }),
                    const Spacer(),
                    Expanded(
                      child: GlobalButton(
                        text: "Cancel",
                        textPadding: EdgeInsets.symmetric(vertical: 8.h),
                        onPressed: () {
                          cubit.selectedDayNotifier.value = cubit.startDate;
                          cubit.activeCertainDay = "";
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    16.horizontalSpace,
                    Expanded(
                      child: GlobalButton(
                        foregroundColor: AppColors.whiteColor,
                        backgroundColor: AppColors.primaryColor,
                        text: AppTitles.save,
                        textPadding: EdgeInsets.symmetric(vertical: 8.h),
                        onPressed: () {
                          cubit.onSaveSelectedDay();
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
