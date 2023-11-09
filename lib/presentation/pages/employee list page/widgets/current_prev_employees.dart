import '../../../../constants/texts/app_texts.dart';
import '../../../../constants/texts/app_titles.dart';
import '../../../../cubits/employees/employee_cubit.dart';
import '../../../../extensions/context_extension.dart';
import '../../../../extensions/num_extension.dart';
import '../../../../extensions/date_formatting.dart';
import '../../../../models/employee%20detail/employee_detail_model.dart';
import '../../employee%20detail%20page/employee_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/app_paddings.dart';
import '../../../../constants/app_text_style.dart';
import '../../../../constants/colors/app_colors.dart';

class CurrentPrevEmployees extends StatelessWidget {
  final String employeeSituation;

  final List<EmployeeDetailModel> employees;
  final bool current;
  const CurrentPrevEmployees(
      {super.key,
      required this.employeeSituation,
      required this.current,
      required this.employees});

  @override
  Widget build(BuildContext context) {
    EmployeeCubit cubit = context.read<EmployeeCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppPaddings.all16,
          child: Text(employeeSituation, style: AppTextStyle.primary16),
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => 0.5.verticalSpace,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Slidable(
              key: const ValueKey(0),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        cubit.temporaryEmployeeModel = employees[index];
                        cubit.temporaryEmployeeID = employees[index].employeeID;
                        cubit.deleteEmployee(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          padding: AppPaddings.left16T0B0,
                          action: SnackBarAction(
                            label: AppTitles.undo,
                            onPressed: () {
                              cubit.undo();
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
                      },
                      child: Container(
                        color: AppColors.slidableRedColor,
                        alignment: Alignment.center,
                        child: SvgPicture.asset("assets/images/svg/can.svg"),
                      ),
                    ),
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      cubit.temporaryEmployeeModel = employees[index];
                      cubit.temporaryEmployeeID = employees[index].employeeID;
                      context.goPushReplacement(EmployeeDetailPage(isEdit: true,
                      employeeDetailModel: employees[index],
                      ));
                      
                    },
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'Edit',
                  ),
                ],
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: AppPaddings.all16,
                color: AppColors.whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: current ? 20.ch(context) : 24.ch(context),
                        child: Text(employees[index].fullName,
                            style: AppTextStyle.textBlack16)),
                    6.verticalSpace,
                    SizedBox(
                        height: 20.ch(context),
                        child: Text(employees[index].job,
                            style: AppTextStyle.textGray14)),
                    6.verticalSpace,
                    SizedBox(
                      height: 20.ch(context),
                      child: Text(
                          current
                              ? "From ${employees[index].startDate.formatDateForList}"
                              : "${employees[index].startDate.formatDateForList} - ${employees[index].endDate!.formatDateForList}",
                          style: AppTextStyle.textGray14
                              .copyWith(fontSize: 12.sp)),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: employees.length,
        )
      ],
    );
  }
}
