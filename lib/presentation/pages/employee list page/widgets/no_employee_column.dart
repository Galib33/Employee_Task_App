import '../../../../constants/app_path.dart';
import '../../../../constants/app_text_style.dart';
import '../../../../constants/texts/app_texts.dart';
import '../../../../extensions/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class NoEmployeeColumn extends StatelessWidget {
  const NoEmployeeColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            AppPath.noEmployeePath,
            height: 218.84.ch(context),
            width: 261.79.cw(context),
          ),
          4.54.verticalSpace,
          Text(
            AppTexts.noEmployeeWarning,
            style: AppTextStyle.black18,
          )
        ],
      ),
    );
  }
}
