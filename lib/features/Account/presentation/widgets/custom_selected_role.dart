import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Theme/light_theme.dart';
import '../../../../core/utils/app_color.dart';
class customSelectedRole extends StatelessWidget {
  const customSelectedRole(
      {super.key, required this.text, required this.onTap});
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(width: 100,
          child: Center(
            child: Text(text,
                style: lightTheme.textTheme.labelLarge!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.myDark,
                )),
          ),
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.myBlueGrey,
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(191, 214, 215, 0.6),
                    offset: Offset(1, 1),
                    spreadRadius: 0,
                    blurRadius: 4)
              ])),
    );
  }
}
