import '../../../../cubits/employees/employee_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/app_paddings.dart';
import '../../../../constants/app_text_style.dart';

class JobList extends StatelessWidget {
  const JobList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> jobs = [
      "Product Designer",
      "Flutter Developer",
      "QA Tester",
      "Product Owner"
    ];
    return ListView.separated(
      separatorBuilder: (context, index) => 1.verticalSpace,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        String job = jobs[index];
        return GestureDetector(
          onTap: () {
            context.read<EmployeeCubit>().requiredFieldControllers["job"]!.text = job;
            Navigator.pop(context);
          },
          child: Container(
            color: Colors.white,
            alignment: Alignment.center,
            padding: AppPaddings.all16,
            child: Text(
              job,
              style: AppTextStyle.longInputTextStyle,
            ),
          ),
        );
      },
    );
  }
}
