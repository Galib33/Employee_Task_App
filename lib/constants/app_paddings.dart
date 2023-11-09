import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPaddings {
  AppPaddings._();

  static EdgeInsets all8 = const EdgeInsets.all(8).w;
  static EdgeInsets all16 = const EdgeInsets.all(16).w;
  static EdgeInsets horz16 = EdgeInsets.symmetric(horizontal: 16.0.w);
  static EdgeInsets horz16T24B7 =
      const EdgeInsets.only(top: 24.0, left: 16, right: 16, bottom: 7).r;
  static EdgeInsets bottom44 = const EdgeInsets.only(bottom: 44.0).r;
  static EdgeInsets vert12R16 = const EdgeInsets.only(top: 12.0, bottom: 12, right: 16).r;
  static EdgeInsets left16 = const EdgeInsets.only(left: 16).r;
  static EdgeInsets left16T0B0 =
      const EdgeInsets.only(left: 16, top: 0, bottom: 0).r;

  static EdgeInsets horz15vert12 =
      EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h);
  static EdgeInsets horz21vert12 =
      EdgeInsets.symmetric(horizontal: 21.w, vertical: 12.h);

  static EdgeInsets lr16T60 =
      EdgeInsets.only(left: 16.w, right: 16.w, top: 60.h);
}
