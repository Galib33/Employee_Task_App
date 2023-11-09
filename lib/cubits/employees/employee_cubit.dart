import '../../extensions/context_extension.dart';
import '../../extensions/date_formatting.dart';
import '../../models/employee%20detail/employee_detail_model.dart';
import '../../screens/snackbars.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../constants/colors/app_colors.dart';
import '../../presentation/pages/employee list page/employee_main_page.dart';

class EmployeeCubit extends Cubit<String> {
  EmployeeCubit() : super("");

  final uuid = const Uuid();
  final detailScaffoldKey = GlobalKey<ScaffoldState>();
  ValueNotifier<DateTime?> selectedDayNotifier = ValueNotifier(DateTime.now());
  ValueNotifier<String> textDayNotifier = ValueNotifier("Today");

  final Map<String, TextEditingController> requiredFieldControllers = {
    "fullName": TextEditingController(),
    "job": TextEditingController(),
    "startDate": TextEditingController(),
  };

  final TextEditingController endDateController = TextEditingController();

  String activeCertainDay = "";
  bool isNoDate = false;
  Future<void> setNoDateTrue() async => isNoDate = true;

  bool isEndDate = false;
  DateTime startDate = DateTime.now();
  DateTime? endDate;
  DateTime? selectedDate;

  EmployeeDetailModel? temporaryEmployeeModel;
  String? temporaryEmployeeID;

  Box<EmployeeDetailModel> employeeBox =
      Hive.box<EmployeeDetailModel>("Employees");

  setDetails(EmployeeDetailModel employeeDetailModel) {
    startDate = employeeDetailModel.startDate;
    endDate = employeeDetailModel.endDate;
    requiredFieldControllers["fullName"]!.text = employeeDetailModel.fullName;
    requiredFieldControllers["job"]!.text = employeeDetailModel.job;
    requiredFieldControllers["startDate"]!.text =
        employeeDetailModel.startDate.formatDate;
    if (employeeDetailModel.endDate != null) {
      endDateController.text = employeeDetailModel.endDate!.formatDate;
    }
  }

  emptyFields() {
    for (var element in requiredFieldControllers.values) {
      element.clear();
    }
    endDateController.clear();
  }

  editEmployeeDetails(String employeeID, BuildContext context) async {
    if (requiredFieldControllers.values
        .every((element) => element.text != "")) {
      await employeeBox.put(
          employeeID,
          EmployeeDetailModel(
            employeeID: employeeID,
            fullName: requiredFieldControllers["fullName"]!.text,
            job: requiredFieldControllers["job"]!.text,
            startDate: startDate,
            endDate: endDate,
          ));
      emptyFields();
      if (context.mounted) {
        context.goPushReplacement(const EmployeesMainPage());
      }
    } else {
      Snackbars.generalShow(context,
          color: AppColors.redColor, snackbarMessage: "Warning: Empty field");
    }
  }

  undo() async {
    await employeeBox.put(temporaryEmployeeID, temporaryEmployeeModel!);
  }

  deleteEmployee(BuildContext context) async {
    //! temporaryEmployeeModel = employeeBox.get(employeeID);
    // temporaryEmployeeID = employeeID;
    await employeeBox.delete(temporaryEmployeeID);
  }

  addEmployee(BuildContext context) async {
    final randomID = uuid.v1();
    if (requiredFieldControllers.values
        .every((element) => element.text != "")) {
      await employeeBox.put(
          randomID,
          EmployeeDetailModel(
            employeeID: randomID,
            fullName: requiredFieldControllers["fullName"]!.text,
            job: requiredFieldControllers["job"]!.text,
            startDate: startDate,
            endDate: endDate,
          ));
      emptyFields();
      endDate = null;

      if (context.mounted) {
        context.goPushReplacement(const EmployeesMainPage());
      }
    } else {
      Snackbars.generalShow(context,
          color: AppColors.redColor, snackbarMessage: "Warning: Empty field");
    }
  }

  onTapCertainDays() {
    emit(activeCertainDay);
  }

  onSaveSelectedDay() {
    if (isEndDate) {
      endDate = selectedDate;
      endDateController.text = endDate?.formatDate ?? "";
    } else {
      startDate = selectedDate ?? DateTime.now();
      requiredFieldControllers["startDate"]!.text = startDate.formatDate;
    }
    selectedDate = null;
    selectedDayNotifier.value = startDate;
    activeCertainDay = "";
  }

  ValueListenable<Box<EmployeeDetailModel>> get employeeBoxListener =>
      employeeBox.listenable();

  @override
  Future<void> close() {
    employeeBoxListener.removeListener(() {});
    employeeBox.close();
    return super.close();
  }
}
