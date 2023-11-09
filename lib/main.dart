import 'models/employee%20detail/employee_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(EmployeeDetailModelAdapter());
  await Hive.openBox<EmployeeDetailModel>('Employees');
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}
