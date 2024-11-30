import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/images_paths.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import 'custom_button.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 120.h,
        ),
        Text(
          "Welcome to",
          style: Theme.of(context).textTheme.displayMedium!.apply(
            fontSizeFactor: 1.sp,
            color: AppColors.myWhite,
          ).copyWith(fontSize: 20.sp,fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 32.h,
        ),
        ClipRRect(borderRadius: BorderRadius.circular(360.r),
          child: Image.asset(ImagesPaths.logo,
              height: 200.h, width: 200.w, fit: BoxFit.fill),
        ),
        SizedBox(
          height: 50.h,
        ),
        CustomButton(width:MediaQuery.sizeOf(context).width,
          onTap: () {
            navigateTo(context, RegisterScreen());
          },

          text: 'Register',
          color: AppColors.primaryColor,
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomButton(width: MediaQuery.sizeOf(context).width,
          onTap: () {navigateTo(context, LoginScreen());},
          isColor: false,
          text: 'Login',
          color: AppColors.myWhite,
        ),
        SizedBox(
          height: 33.h,
        ),
      ],
    );
  }
}
