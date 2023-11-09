import '../../constants/app_text_style.dart';
import '../../constants/borders/app_input_borders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors/app_colors.dart';

class GlobalInput extends StatelessWidget {
  final Function()? onTap;
  final TextEditingController? controller;
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool? readOnly;
  final double? hintFontSize;
  final double? textFontSize;
  const GlobalInput({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.readOnly = false,
    this.controller,
    this.hintFontSize,
    this.textFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: TextFormField(
        
        onTap: onTap,
        readOnly: readOnly!,
        controller: controller,
        style: AppTextStyle.longInputTextStyle.copyWith(fontSize: textFontSize),
        decoration: InputDecoration(
          
            hintStyle: AppTextStyle.longInputHintStyle
                .copyWith(fontSize: hintFontSize),
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            fillColor: AppColors.textGrayColor,
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            border: AppInputBorders.globalInputBorder,
            enabledBorder: AppInputBorders.globalInputBorder,
            focusedBorder: AppInputBorders.globalInputBorder,
            ),
      ),
    );
  }
}
