
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.isLoading=true,
    this.isColor=true,this.onTap,
    super.key,
    required this.text, required this.color, required this.width,
  });

final double width ;
  final String text;
  final bool isLoading ;
  final bool isColor ;
  final Color color ;
  final void Function()?onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(height: 50.h,width:width ,
          decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(12.r),
            border: Border.all(color:AppColors.primaryColor),
            color:color,
          ),
          child: isLoading ?Center(
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(fontSizeFactor: 1.sp)
                  .copyWith(
                color: isColor?AppColors.myWhite:AppColors.myDark,
                fontWeight: FontWeight.w400,
              ),
            ),
          ):Center(child:Center(child:CircularProgressIndicator(color:AppColors.myWhite)))),
    );
  }
}
