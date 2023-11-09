import '../../../../cubits/employees/employee_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/app_paddings.dart';
import '../../../widgets/global_input.dart';
import 'calendar_dialog.dart';

class DateIntervals extends StatelessWidget {
  const DateIntervals({super.key});

  @override
  Widget build(BuildContext context) {
    EmployeeCubit cubit = context.read<EmployeeCubit>();
    return Row(
      children: [
        Expanded(
            child: GlobalInput(
                readOnly: true,
                controller: cubit.requiredFieldControllers["startDate"],
                onTap: () {
                  cubit.isEndDate = false;
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (dialogContext) {
                      return Padding(
                          padding: AppPaddings.all16,
                          child: const CalendarDialog());
                    },
                  );
                },
                hintFontSize: 14.sp,
                hintText: "No Date",
                prefixIcon: Padding(
                  padding: AppPaddings.all8,
                  child: SvgPicture.asset("assets/images/svg/my_calendar.svg"),
                ))),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SvgPicture.asset("assets/images/svg/arrow_forward.svg")),
        Expanded(
            child: GlobalInput(
          onTap: () {
            cubit.isEndDate = true;
            if (cubit.requiredFieldControllers["startDate"]!.text != "") {
              showDialog(
                context: context,
                builder: (context) {
                  return Padding(
                      padding: AppPaddings.all16,
                      child: const CalendarDialog());
                },
              );
            }
          },
          controller: cubit.endDateController,
          readOnly: true,
          hintFontSize: 14.sp,
          hintText: "No Date",
          prefixIcon: Padding(
            padding: AppPaddings.all8,
            child: SvgPicture.asset("assets/images/svg/my_calendar.svg"),
          ),
        )),
      ],
    );
  }
}
