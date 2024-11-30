import 'package:flutter/material.dart';import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/core/utils/images_paths.dart';
import 'package:ultra_shop/core/utils/shared%20_pref.dart';
import 'package:ultra_shop/features/Account/presentation/screens/change_password_screen.dart';
import 'package:ultra_shop/features/Account/presentation/controller/account_cubit.dart';
import 'package:ultra_shop/features/Home/presentation/screens/add_role_screen.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_profile_item.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/item_text_profile.dart';
import 'package:ultra_shop/features/Account/presentation/screens/select_role.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/Shimmers/profile.dart';
import '../../../profile/Personal_information_screen.dart';
import '../../../profile/invite_friends_screen.dart';
import '../../../profile/security_screen.dart';
import '../../../profile/terms_and_conditions_screen.dart';
import '../widgets/custom_sing_out.dart';
class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});
  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  void signout() {
    showDialog(
        barrierColor: const Color.fromRGBO(0, 100, 102, 0.2),
        context: context,
        builder: (BuildContext context) {
          return const ItemSigOut(
            title: "Do you want to log out?",
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView(children: [
        SizedBox(
          height: 30.h,
        ),
        Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(90.r)),
          alignment: Alignment.center,
          child: ClipRRect(borderRadius: BorderRadius.circular(90.r),child: Image.asset(height: 200.h, width: 200.w, ImagesPaths.logo)),
        ),


        GestureDetector(
          onTap: () {
            navigateTo(
              context,
              PersonalInformationScreen(),
            );
          },          child: CustomProfile(
          widget: Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Personal information',
                style: lightTheme.textTheme.labelSmall!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.myDeepBlue,
                ),
              ),
              Spacer(),
              Icon(
                FontAwesomeIcons.person,
                size: 24,
              ),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
        ),
        ),
        GestureDetector(
          onTap: () {
            navigateTo(
              context,
              SecurityScreen(),
            );
          },          child: CustomProfile(
          widget: Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Security',
                style: lightTheme.textTheme.labelSmall!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.myDeepBlue,
                ),
              ),
              Spacer(),
              Icon(
              Icons.security,
                size: 24,
              ),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
        ),
        ),
        GestureDetector(
          onTap: () {
            navigateTo(
              context,
              inviteFriendsScreen(),
            );
          },          child: CustomProfile(
          widget: Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Invitation',
                style: lightTheme.textTheme.labelSmall!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.myDeepBlue,
                ),
              ),
              Spacer(),
              Icon(
              Icons.email,
                size: 24,
              ),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
        ),
        ),
        GestureDetector(
          onTap: () {
            navigateTo(
              context,
              TermsAndConditionsScreen(),
            );
          },          child: CustomProfile(
          widget: Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Terms & Conditions',
                style: lightTheme.textTheme.labelSmall!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.myDeepBlue,
                ),
              ),
              Spacer(),
              Icon(
              Icons.interpreter_mode_sharp,
                size: 24,
              ),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
        ),
        ),


        GestureDetector(
          onTap: () {
            navigateTo(
              context,
              ChangePasswordScreen(),
            );
          },          child: CustomProfile(
          widget: Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Change Password',
                style: lightTheme.textTheme.labelSmall!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.myDeepBlue,
                ),
              ),
              Spacer(),
              Icon(
                FontAwesomeIcons.lock,
                size: 24,
              ),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
        ),
        ),

        (role == AppString.admin)
            ?  GestureDetector(
          onTap: () {
            navigateTo(context, AddRoleScreen());
          },
          child: CustomProfile(
            widget: Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Add Role',
                  style: lightTheme.textTheme.labelSmall!.apply(
                    fontSizeFactor: 1.sp,
                    color: AppColors.myDeepBlue,
                  ),
                ),
                Spacer(),
                Icon(
                  FontAwesomeIcons.personBooth,
                  size: 24,
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
        )
            :    SizedBox(),



        SizedBox(
          height: 10.h,
        ),
        GestureDetector(
          onTap: signout,          child: CustomProfile(
          widget: Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Sign Out',
                style: lightTheme.textTheme.labelSmall!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.myDeepBlue,
                ),
              ),
              Spacer(),
              Icon(
                FontAwesomeIcons.signOut,
                size: 24,
                color: AppColors.myRed,
              ),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
        ),
        ),
        SizedBox(
          height: 30.h,
        )
      ]),
    );
  }
}
