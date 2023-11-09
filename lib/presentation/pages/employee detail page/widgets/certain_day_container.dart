import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors/app_colors.dart';
import '../../../../cubits/employees/employee_cubit.dart';

class CertainDayContainer extends StatelessWidget {
  final String certainDay;
  final bool isActive;

  const CertainDayContainer({
    super.key,
    required this.certainDay,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    EmployeeCubit cubit = context.read<EmployeeCubit>();
    DateTime today = DateTime.now();
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          switch (certainDay) {
            case "Next Tuesday":
              cubit.activeCertainDay = "Next Tuesday";
              log(certainDay);
              cubit.selectedDayNotifier.value =
                  onDayChoosen(DateTime.tuesday); //!
              break;
            case "Next Monday":
              cubit.activeCertainDay = "Next Monday";

              cubit.selectedDayNotifier.value =
                  onDayChoosen(DateTime.monday); //!
              break;
            case "After 1 week":
              cubit.activeCertainDay = "After 1 week";
              cubit.selectedDayNotifier.value =
                  today.add(const Duration(days: 7)); //!
              break;
            case "Today":
              if (!cubit.startDate.isAfter(DateTime.now()) &&
                  !cubit.isEndDate) {
                cubit.activeCertainDay = "Today";
                cubit.selectedDayNotifier.value = today;
                cubit.textDayNotifier.value = today.toString();
              } else if (!cubit.startDate.isAfter(DateTime.now())) {
                cubit.selectedDayNotifier.value = today;
                cubit.textDayNotifier.value = today.toString();

                cubit.activeCertainDay = "Today";
              }
              cubit.textDayNotifier.value = today.toString();

              cubit.selectedDate = today;

              cubit.isNoDate = false;
              break;
            case "No Date":
              cubit.activeCertainDay = "No Date";
              cubit.textDayNotifier.value = "No Date";
              await cubit.setNoDateTrue();
              if (cubit.startDate.isAfter(DateTime.now())) {
                cubit.selectedDayNotifier.value = cubit.startDate;
                break;
              } else {
                cubit.selectedDayNotifier.value = null;
              }

              break;
            default:
              break;
          }
          cubit.onTapCertainDays();
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4).w,
              color:
                  isActive ? AppColors.primaryColor : AppColors.lightBlueColor,
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(
              certainDay,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: isActive ? AppColors.whiteColor : AppColors.primaryColor,
              ),
            )),
      ),
    );
  }

  onDayChoosen(int dayNumber) {
    DateTime choosenDay = DateTime.now().add(
        const Duration(days: 1));
    while (choosenDay.weekday != dayNumber) {
      choosenDay = choosenDay.add(const Duration(
          days: 1)); 
    }

    return choosenDay;
  }
}
