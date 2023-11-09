import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color blackColor = Color(0xff000002);
  static const Color whiteColor = Color(0xffffffff);

  static const Color primaryColor = Color(0xff1DA1F2);
  static const Color redColor = Color(0xffE00D16);
  static const Color blueColor = Color(0xff4d79ff);
  static const Color secondaryScaffoldColor = Color(0xffF2F2F2);
  static const Color textGrayColor = Color(0xFF949C9E);
  static const Color grayColor = Color(0xff4F4F4F);
  static const Color textBlackColor = Color(0xff323238);
  static const Color gray6Color = Color(0xffF2F2F2);
  static const Color slidableRedColor = Color(0xffF34642);
  static const Color lightGrayColor = Color(0xffE5E5E5);
  static const Color lightBlueColor = Color(0xffEDF8FF);

  static MaterialColor getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, shades);
  }
}
