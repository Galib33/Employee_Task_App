import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../constants/app_paddings.dart';
import '../../../../constants/app_text_style.dart';
import '../../../../constants/texts/app_texts.dart';
import '../../../../constants/texts/app_titles.dart';
import '../../../../cubits/employees/employee_cubit.dart';
import '../../../../models/employee detail/employee_detail_model.dart';
import 'current_prev_employees.dart';
import 'no_employee_column.dart';

class EmployeesList extends StatelessWidget {
  const EmployeesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.bottom44,
      child: ValueListenableBuilder(
          valueListenable: context.read<EmployeeCubit>().employeeBoxListener,
          builder: (context, Box<EmployeeDetailModel> box, _) {
            if (box.isEmpty) {
              return const NoEmployeeColumn();
            } else {
              List<EmployeeDetailModel> currentEmployees = box.values
                  .where((element) => element.endDate == null)
                  .toList();
              List<EmployeeDetailModel> previousEmployees = box.values
                  .where((element) => element.endDate != null)
                  .toList();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          CurrentPrevEmployees(
                            current: true,
                            employees: currentEmployees,
                            employeeSituation: AppTitles.currentEmployees,
                          ),
                          CurrentPrevEmployees(
                            current: false,
                            employees: previousEmployees,
                            employeeSituation: AppTitles.previousEmployees,
                          ),
                        ],
                      ),
                    ),
                  ),
                  12.verticalSpace,
                  Padding(
                    padding: AppPaddings.left16,
                    child: Text(
                      AppTexts.swipeLeft,
                      style: AppTextStyle.textGray14.copyWith(fontSize: 15.sp),
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }
}
