import '../../cubits/employees/employee_cubit.dart';
import '../../extensions/context_extension.dart';
import '../pages/employee%20list%20page/employee_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_paddings.dart';
import '../../constants/colors/app_colors.dart';
import '../../constants/texts/app_texts.dart';
import '../../constants/texts/app_titles.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isEdit;
  const GlobalAppBar({super.key, required this.title, required this.isEdit});

  @override
  Widget build(BuildContext context) {
    EmployeeCubit cubit = context.read<EmployeeCubit>();
    return AppBar(
      title: Text(title),
      actions: [
        isEdit
            ? Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                    onTap: () {
                      cubit.deleteEmployee(context);
                      context.goPushReplacement(const EmployeesMainPage());
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
                    child: SvgPicture.asset("assets/images/svg/can.svg")),
              )
            : const SizedBox.shrink()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
