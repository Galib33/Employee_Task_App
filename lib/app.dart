import 'cubits/employees/employee_cubit.dart';
import 'presentation/pages/employee%20list%20page/employee_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'themes/theme_datas.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) => EmployeeCubit(),
          child: MaterialApp(
           debugShowCheckedModeBanner: false,
            title: 'Employee Task App',
            theme: ThemeDatas.generalAppTheme,
            home: child,
          ),
        );
      },
      child: const EmployeesMainPage(),
    );
  }
}
