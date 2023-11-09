import '../../../../extensions/date_formatting.dart';
import '../../../../extensions/num_extension.dart';
import '../../../../models/employee%20detail/employee_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/app_paddings.dart';
import '../../../../constants/app_text_style.dart';
import '../../../../constants/colors/app_colors.dart';

class EmployeeInfoContainer extends StatelessWidget {
  final bool current;
  final List<EmployeeDetailModel> employees;
  final int index;
  const EmployeeInfoContainer(
      {super.key,
      required this.current,
      required this.employees,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child:
                  Text(employees[index].job, style: AppTextStyle.textGray14)),
          6.verticalSpace,
          SizedBox(
            height: 20.ch(context),
            child: Text(
                current
                    ? "From ${employees[index].startDate.formatDateForList}"
                    : "${employees[index].startDate.formatDateForList} - ${employees[index].endDate!.formatDateForList}",
                style: AppTextStyle.textGray14.copyWith(fontSize: 12.sp)),
          ),
        ],
      ),
    );
  }
}
