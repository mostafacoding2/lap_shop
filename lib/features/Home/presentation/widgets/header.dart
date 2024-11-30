import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle(
      {super.key,
      required this.title,
      required this.onPressed,
      this.arrow = true});
  final String title;
  final bool arrow;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w, right: 12.w, top: 10.h, bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Spacer(flex: 1),
          Text(
            title,
            style: lightTheme.textTheme.labelLarge!.apply(
              fontSizeFactor: 1.sp,
              color: AppColors.primaryColor,
            ),
          ),
          Spacer(
            flex: 10,
          ),

          GestureDetector(
              onTap: onPressed,
              child: arrow
                    ? Icon(
                        Icons.arrow_forward_ios_rounded,color: AppColors.myWhite,
                        size: 20,
                      )
                    :SizedBox() ,
              ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
