
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/constants.dart';
import '../../../Home/presentation/screens/bottom_nav_screen.dart';
import '../../../Home/presentation/widgets/custom_appBar_title_and_arrow.dart';
import '../widgets/change_password_body.dart';
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}
class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  GlobalKey<FormState> fromkey = GlobalKey();
  @override
  void dispose() {
    oldPasswordController.dispose();
    userNameController.dispose();
    confirmNewPasswordController.dispose();
    newPasswordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return SafeArea(
        child: Scaffold(backgroundColor: AppColors.myDark,
      body: Form(
        key: fromkey,
        child: ListView(
          children: [
            CustomAppBarTitleArrow(arrow_back: true,
              title: "ChangePassword",
              onpressed: () {
                navigateTo(
                    context,
                    BottomNavScreen(
                      currentIndex: 3,
                    ));
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            ChangePasswordBody(
                oldPasswordController: oldPasswordController,
                newPasswordController: newPasswordController,
                confirmNewPasswordController: confirmNewPasswordController,
                userNameController: userNameController,
                fromkey: fromkey)
          ],
        ),
      ),
    ));
  }
}
