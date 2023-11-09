
import '../../../constants/app_paddings.dart';
import '../../../cubits/employees/employee_cubit.dart';
import '../../../models/employee%20detail/employee_detail_model.dart';
import '../employee%20detail%20page/widgets/bottom_buttons.dart';
import '../employee%20detail%20page/widgets/date_intervals.dart';
import '../employee%20detail%20page/widgets/job_input.dart';
import '../../widgets/global_app_bar.dart';
import '../../widgets/global_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors/app_colors.dart';

class EmployeeDetailPage extends StatefulWidget {
  final bool isEdit;
  final EmployeeDetailModel? employeeDetailModel;
  const EmployeeDetailPage(
      {super.key, required this.isEdit, this.employeeDetailModel});

  @override
  State<EmployeeDetailPage> createState() => _EmployeeDetailPageState();
}

class _EmployeeDetailPageState extends State<EmployeeDetailPage> {
  late EmployeeCubit employeeCubit;

  @override
  void initState() {
    employeeCubit = context.read<EmployeeCubit>();
    if (widget.isEdit) {
      employeeCubit.setDetails(widget.employeeDetailModel!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: employeeCubit.detailScaffoldKey,
      appBar: GlobalAppBar(
          isEdit: widget.isEdit,
          title:
              widget.isEdit ? "Edit Employee Details" : "Add Employee Details"),
      bottomNavigationBar: BottomButtons(
        editingModel: widget.employeeDetailModel,
        isEdit: widget.isEdit,
      ),
      body: Padding(
        padding: AppPaddings.lr16T60.copyWith(top: 24).r,
        child: Column(
          children: [
            GlobalInput(
                controller: employeeCubit.requiredFieldControllers["fullName"],
                hintText: "Employee name",
                prefixIcon: const Icon(
                  Icons.person_outlined,
                  color: AppColors.primaryColor,
                )),
            23.verticalSpace,
            const JobInput(),
            23.verticalSpace,
            const DateIntervals()
          ],
        ),
      ),
    );
  }
}
