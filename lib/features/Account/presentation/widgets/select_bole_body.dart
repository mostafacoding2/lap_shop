import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shop/core/utils/images_paths.dart';
import '../../../../core/Theme/light_theme.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/shared _pref.dart';
import '../../../Home/presentation/screens/bottom_nav_screen.dart';
import '../widgets/custom_selected_role.dart';
class SelectRoleBody extends StatelessWidget {
  const SelectRoleBody({
    super.key,
    required this.number,
    required this.roles,
  });

  final int number;
  final List<String>? roles;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [SizedBox(height: 60.h,),
        Image.asset(ImagesPaths.logo,height: 250.h,width: 250.w,fit: BoxFit.fill,),
        SizedBox(height: 40.h,),
        Text("Welcome to   Lap Shop ",
            style: lightTheme.textTheme.labelLarge!.apply(
              fontSizeFactor: 1.sp,
              color: AppColors.myRed,
            )),          SizedBox(height: 40.h,),

        Text("You Have 2 role",
            style: lightTheme.textTheme.labelLarge!.apply(
              fontSizeFactor: 1.sp,
              color: AppColors.myOrange,
            )),
        SizedBox(height: 40.h,),
        Text("You can choose either of them",
            style: lightTheme.textTheme.labelLarge!.apply(
              fontSizeFactor: 1.sp,
              color: AppColors.myNavy,
            )),
        SizedBox(height: 40.h,),
        Padding(
          padding:  EdgeInsets.only(left: 15.0.r,right: 15.r),
          child: SizedBox(
              height: 70.h,
              child:  ListView.builder(scrollDirection: Axis.horizontal,
                itemCount: roles!.length,
                itemBuilder: (context, index) {
                  print("roles =======$roles");
                  return customSelectedRole(
                    text: roles![index]=="Seller"?"":roles![index],
                    onTap: () {
                      PreferenceUtils.setString(SharedKeys.role, roles![index]);
                      role = roles![index];
                      if (roles![index]=="User")
                      {
                        navigateAndRemove(context, BottomNavScreen(currentIndex:0 ,));
                      }

                      if (roles![index]=="Admin")
                      {
                        navigateAndRemove(context,  BottomNavScreen(currentIndex:0 ,));
                      }
                    },
                  );

                },
              )),
        )
      ],
    );
  }
}
