import '../../../../constants/app_path.dart';
import '../../../../cubits/employees/employee_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/colors/app_colors.dart';
import '../../../widgets/global_input.dart';
import 'job_list.dart';

class JobInput extends StatelessWidget {
  const JobInput({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalInput(
      controller: context.read<EmployeeCubit>().requiredFieldControllers["job"],
      readOnly: true,
      onTap: () {
        showModalBottomSheet(
          constraints: BoxConstraints(minWidth: 1.sw),
          context: context,
          builder: (context) {
            return const JobList();
          },
        );
      },
      hintText: "Select role",
      prefixIcon: Padding(
        padding: const EdgeInsets.all(9).w,
        child: SvgPicture.asset(
          AppPath.bagPath,
        ),
      ),
      suffixIcon: const Icon(
        Icons.arrow_drop_down_rounded,
        size: 40,
        color: AppColors.primaryColor,
      ),
    );
  }
}
