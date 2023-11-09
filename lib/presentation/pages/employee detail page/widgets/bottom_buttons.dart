import '../../../../constants/texts/app_titles.dart';
import '../../../../cubits/employees/employee_cubit.dart';
import '../../../../extensions/context_extension.dart';
import '../../../../models/employee%20detail/employee_detail_model.dart';
import '../../employee%20list%20page/employee_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/app_paddings.dart';
import '../../../../constants/colors/app_colors.dart';
import '../../../widgets/global_button.dart';

class BottomButtons extends StatelessWidget {
  final bool isEdit;
  final EmployeeDetailModel? editingModel;
  const BottomButtons({super.key, required this.isEdit, this.editingModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border:
              Border(top: BorderSide(width: 2, color: AppColors.gray6Color))),
      child: Padding(
        padding: AppPaddings.vert12R16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GlobalButton(
              text: AppTitles.cancel,
              textPadding: AppPaddings.horz15vert12,
              onPressed: () {
                context.read<EmployeeCubit>().emptyFields();
                context.goPushReplacement(const EmployeesMainPage());
              },
            ),
            16.horizontalSpace,
            GlobalButton(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.whiteColor,
              text: AppTitles.save,
              textPadding: AppPaddings.horz21vert12,
              onPressed: () {
                isEdit
                    ? context
                        .read<EmployeeCubit>()
                        .editEmployeeDetails(editingModel!.employeeID, context)
                    : context.read<EmployeeCubit>().addEmployee(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
