import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../widgets/curvy_appbar.dart';
import '../widgets/forget_password_body.dart';
class ForgotPasswordScreen extends StatefulWidget {
 const ForgotPasswordScreen({super.key});
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}
class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _userNameController = TextEditingController();
  final  _newPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
@override
  void dispose() {
  _userNameController.dispose();
  _newPasswordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
       SystemUiOverlayStyle(
        statusBarColor:AppColors.primaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(    backgroundColor:  AppColors.myDark,
      body: Form(
          key: _formKey,
        child:   SingleChildScrollView(
          child: Column(
            children: [
               CurvyAppBar(
                title: AppString.forgotpassword,
              ),
              Padding(
                padding:  EdgeInsets.all(18.0.r),
                child: ForgetPasswordBody(
                        formKey: _formKey, userNameController: _userNameController, newPasswordController: _newPasswordController),
              )
            ],
          ),
        ),
      ),
    );
  }}
