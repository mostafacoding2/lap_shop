import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Theme/light_theme.dart';
import '../../../../core/utils/app_color.dart';

class CurvyAppBar extends StatelessWidget {
  const CurvyAppBar({
    super.key,
    required this.title, this.onTap,
  });
  final String title;
  final   void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return  Container(decoration: BoxDecoration(color:AppColors.primaryColor,borderRadius: BorderRadius.only(bottomLeft:Radius.circular(30) ,bottomRight: Radius.circular(30) ) ),
padding: EdgeInsets.symmetric(vertical: 50.h),
    child:  Center(
      child: CustomAppBar(onTap:onTap ,
        title: title
        ,),
    ),
            );
  }
}

class CustomAppBar extends StatelessWidget {
  const  CustomAppBar({
    super.key, required this.title, this.onTap,
  });
  final String title;
  final   void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Align(alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 30,),
              GestureDetector(
                onTap: onTap,
                  child: Icon(Icons.arrow_back_ios_sharp,color:AppColors.myWhite,size: 18,)),
Spacer(flex: 2,),
              Text(
                title,
                style: lightTheme.textTheme.titleSmall!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.myWhite,
                ),
              ),
              Spacer(flex: 3,),


            ],
          ),
        ),
      ],
    );
  }
}


