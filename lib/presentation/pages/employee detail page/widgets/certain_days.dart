
import '../../../../cubits/employees/employee_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'certain_day_container.dart';

class CertainDays extends StatelessWidget {
  const CertainDays({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    EmployeeCubit cubit = context.read<EmployeeCubit>();
    return BlocBuilder<EmployeeCubit, String>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                CertainDayContainer(
                  certainDay: cubit.isEndDate ? "No Date" : "Today",
                  isActive: state == (cubit.isEndDate ? "No Date" : "Today"),
                ),
                16.horizontalSpace,
                CertainDayContainer(
                  isActive:
                      state == (cubit.isEndDate ? "Today" : "Next Monday"),
                  certainDay: cubit.isEndDate ? "Today" : 'Next Monday',
                ),
              ],
            ),
            cubit.isEndDate ? const SizedBox.shrink() : 16.verticalSpace,
            Offstage(
              offstage: cubit.isEndDate,
              child: Row(
                children: [
                  CertainDayContainer(
                    certainDay: 'Next Tuesday',
                    isActive: state == "Next Tuesday",
                  ),
                  16.horizontalSpace,
                  CertainDayContainer(
                    certainDay: 'After 1 week',
                    isActive: state == "After 1 week",
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
