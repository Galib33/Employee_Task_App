// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'employee_detail_model.g.dart';

@HiveType(typeId: 1)
class EmployeeDetailModel {
  @HiveField(0)
  String employeeID;

  @HiveField(1)
  String fullName;

  @HiveField(2)
  String job;

  @HiveField(3)
  DateTime startDate;

  @HiveField(4)
  DateTime? endDate;

  EmployeeDetailModel({
    required this.employeeID,
    required this.fullName,
    required this.job,
    required this.startDate,
    this.endDate,
  });
}
