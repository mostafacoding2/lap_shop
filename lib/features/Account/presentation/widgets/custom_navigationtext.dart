
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Theme/light_theme.dart';
import '../../../../core/utils/app_color.dart';
class NavigationText extends StatelessWidget {
  const NavigationText({super.key, required this.text, required this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
          onTap: onTap,
          child: FittedBox(fit:BoxFit.scaleDown,child: Text(text,style:
          lightTheme.textTheme.labelSmall!.apply(
            fontSizeFactor: 1.sp,
            color: AppColors.myNavy,
          ),)));
  }
}