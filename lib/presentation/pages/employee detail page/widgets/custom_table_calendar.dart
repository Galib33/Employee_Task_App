import 'dart:developer';

import '../../../../extensions/date_formatting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../constants/colors/app_colors.dart';
import '../../../../cubits/employees/employee_cubit.dart';
import '../../../../themes/calendar_themes.dart';
import 'custom_day_container.dart';

class CustomTableCalendar extends StatelessWidget {
  const CustomTableCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    EmployeeCubit cubit = context.read<EmployeeCubit>();
    DateTime today = DateTime.now();
    bool? isCurrentMonth;
    return ValueListenableBuilder(
        valueListenable: cubit.selectedDayNotifier,
        builder: (context, value, _) {
          isCurrentMonth =
              isSameDay(cubit.selectedDayNotifier.value, cubit.startDate);

         
          return TableCalendar(
            pageAnimationEnabled: false,
            focusedDay: value ?? today,
            onDaySelected: (selectedDay, focusedDay) {
              if (cubit.isEndDate && (selectedDay.day < cubit.startDate.day)) {
                return;
              } else {
                log(selectedDay.formatDate);
                cubit.textDayNotifier.value = selectedDay.toString();
                cubit.isNoDate = false;
                cubit.selectedDayNotifier.value = selectedDay;
                cubit.selectedDate = selectedDay;
                cubit.activeCertainDay = selectedDay.toString();
                cubit.onTapCertainDays();
                
              }
            },
            selectedDayPredicate: (day) =>
                value == null || cubit.isNoDate == true
                    ? false
                    : isSameDay(day, cubit.selectedDayNotifier.value),
            calendarBuilders: CalendarBuilders(
              todayBuilder: (context, day, focusedDay) {
                if (cubit.isEndDate && day.isBefore(cubit.startDate)) {
                  return CustomDayContainer(day: day.day.toString());
                }
                return null;
              },
              disabledBuilder: (context, day, focusedDay) {
                if (cubit.isEndDate && day.isBefore(cubit.startDate)) {
                  return CustomDayContainer(day: day.day.toString());
                }
                return null;
              },
              defaultBuilder: (context, day, focusedDay) {
                if (cubit.isEndDate && day.isBefore(cubit.startDate)) {
                  return CustomDayContainer(day: day.day.toString());
                }
                if (day.day == DateTime(day.year, day.month + 1, 0).day &&
                    cubit.isEndDate) {
                  return CustomDayContainer(
                    day: day.day.toString(),
                    dayColor: AppColors.primaryColor,
                  );
                }
                return null;
              },
            ),
            onPageChanged: (focusedDay) {
              if (cubit.isEndDate) {
                isCurrentMonth = isSameDay(cubit.startDate, focusedDay);
                cubit.selectedDayNotifier.value = focusedDay;
              }
              
            },
            daysOfWeekHeight: 44,
            calendarStyle: CalendarThemes.defaultCalendarStyle(cubit.isNoDate),
            headerStyle: CalendarThemes.defaultHeaderStyle(
                isCurrentMonth, cubit.isEndDate),
            rowHeight: 44.h,
            firstDay:
                cubit.isEndDate ? cubit.startDate : DateTime.utc(2010, 3, 14),
            lastDay: DateTime.utc(2030, 3, 14),
          );
        });
  }
}
