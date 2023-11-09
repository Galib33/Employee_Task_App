import '../../../constants/colors/app_colors.dart';
import '../../../constants/texts/app_titles.dart';
import '../../../extensions/context_extension.dart';
import '../employee%20detail%20page/employee_detail_page.dart';
import '../employee%20list%20page/widgets/employees_list.dart';
import '../../widgets/global_app_bar.dart';
import 'package:flutter/material.dart';


class EmployeesMainPage extends StatelessWidget {
  const EmployeesMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryScaffoldColor,
      appBar: const GlobalAppBar(title: AppTitles.employeeList, isEdit: false,),
      body: const EmployeesList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goPushReplacement(const EmployeeDetailPage(isEdit: false));
        },
        child: const Icon(
          Icons.add,
          size: 36,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
