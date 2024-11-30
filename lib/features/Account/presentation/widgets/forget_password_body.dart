
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Theme/light_theme.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/component_in_general.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/validation_account.dart';
import '../controller/account_cubit.dart';
import '../screens/login_screen.dart';
import 'custom_button.dart';
import 'custom_navigationtext.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody(
      {super.key,
      required this.formKey,
      required this.userNameController,
      required this.newPasswordController});
  final TextEditingController userNameController;
  final TextEditingController newPasswordController;
  final GlobalKey<FormState> formKey;
  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
           create: (context) => AccountCubit(),
  child: Column(
      children: [
        SizedBox(height: 60.h),
        CustomTextFormField(
            keyboardType: TextInputType.text,
            widget: const Icon(Icons.person),
            controller: widget.userNameController,
            label: AppString.username,
            obscureText: false,
            validator: (value) => FormValidators.validateField(
                widget.userNameController.text, AppString.username)),
        SizedBox(height: 40.h),
        BlocBuilder<AccountCubit, AccountState>(
          builder: (context, state) {
            var cubit = AccountCubit.get(context);
            return CustomTextFormField(
                keyboardType: TextInputType.text,
                widget: GestureDetector(
                  onTap: () {
                    cubit.changePasswordVisibility();
                    setState(() {});
                  },
                  child: Icon(cubit.icon,color:AppColors.myWhite),
                ),
                controller: widget.newPasswordController,
                label: AppString.newPassword,
                obscureText: cubit.isPassword,
                validator: (value) => FormValidators.validateField(
                    widget.newPasswordController.text, AppString.newPassword));
          },
        ),
        SizedBox(height: 60.h),
//  ToDo edit cubit and status
        BlocProvider(
          create: (context) => AccountCubit(),
          child: BlocConsumer<AccountCubit, AccountState>(
            listener: (context, state) {
              if (state is ForgetPasswordErrorState) {
                flutterToast(message: state.errormessage, success: false);
              }
              if (state is ForgetPasswordFailureState) {
                flutterToast(message: state.failure, success: false);
              }
              if (state is ForgetPasswordSuccessState) {
                flutterToast(message: "success  you can login now ", success: true);
                navigateAndReplacement(context, const LoginScreen());
              } else {
                isLoading = true;
              }
              // TODO: implement listener
            },
            builder: (context, state) {
              final cubit = AccountCubit.get(context);
              return    Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),                child: CustomButton(
                isLoading:state is ForgetPasswordLoadingState?false:true ,
                width: MediaQuery.sizeOf(context).width,
                onTap: ()  {
                  if (widget.formKey.currentState!.validate()) {
                    cubit.forgetPassword(
                        userName: widget.userNameController.text,
                        changePass: widget.newPasswordController.text);
                  }
                },
                text: AppString.resetPassword,
                color: AppColors.primaryColor,
              ),
              );
            },
          ),
        ),


        SizedBox(height: 60.h),
        Row(
          children: [
            const Spacer(),
            Text('Now you can login',
                style: lightTheme.textTheme.labelSmall!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.myWhite,
                ),),
            const Spacer(),
            NavigationText(
                text: AppString.login,
                onTap: () {
                  navigateAndRemove(context, const LoginScreen());
                }),
            const Spacer(),
          ],
        )
      ],
    ),
);
  }
}
