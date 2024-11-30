
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shop/features/Account/presentation/screens/welcome_screen.dart';

import '../../../../core/Theme/light_theme.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/component_in_general.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/shared _pref.dart';
import '../../../../core/utils/validation_account.dart';
import '../../../Home/presentation/screens/bottom_nav_screen.dart';
import '../../../payment/data/repos/checkout_repo_impl.dart';
import '../../../payment/presentation/manger/cubit/create_customer_cubit.dart';
import '../controller/account_cubit.dart';
import '../screens/forget_password_screen.dart';
import '../screens/register_screen.dart';
import '../screens/select_role.dart';
import 'curvy_appbar.dart';
import 'custom_button.dart';
import 'custom_navigationtext.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.formKey,
  });
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateCustomerCubit(CheckoutRepoImpl()),
      child: BlocBuilder<CreateCustomerCubit, CreateCustomerState>(
        builder: (context, state) {
          var Data = CreateCustomerCubit.get(context);
          return
            BlocProvider(
  create: (context) => AccountCubit(),
  child: Column(
            children: [
               CurvyAppBar(
                onTap: (){navigateTo(context, WelcomeScreen());},
                title: AppString.login,
              ),
              SizedBox(height: 180.h),
              Padding(
                padding: EdgeInsets.all(18.0.r),
                child: Column(
                  children: [
                    CustomTextFormField(
                        keyboardType: TextInputType.text,
                        widget: const Icon(Icons.person),
                        controller: widget.usernameController,
                        label: AppString.username,
                        obscureText: false,
                        validator: (value) => FormValidators.validateField(
                            widget.usernameController.text,
                            AppString.username)),
                    SizedBox(height: 20.h),
                    BlocBuilder<AccountCubit, AccountState>(
                      builder: (context, state) {
                        var cubit = AccountCubit.get(context);
                        return CustomTextFormField(
                            keyboardType: TextInputType.text,
                            widget: GestureDetector(
                              onTap: () {
                                cubit.changePasswordVisibility();
                              },
                              child: Icon(cubit.icon,color:AppColors.myWhite),
                            ),
                            controller: widget.passwordController,
                            label: AppString.password,
                            obscureText: cubit.isPassword,
                            validator: FormValidators.validatePassword);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.w,
              ),
              BlocBuilder<AccountCubit, AccountState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
SizedBox(width: 30.w,),
                      NavigationText(
                        text: AppString.forgotPassword,
                        onTap: () {

                            navigateAndReplacement(
                                context, const ForgotPasswordScreen());

                        },
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 80.h),
              BlocProvider(
                create: (context) => AccountCubit(),
                child: BlocConsumer<AccountCubit, AccountState>(
                  listener: (context, state) {
                    if (state is LoginErrorState) {
                      flutterToast(
                          message: "Make sure the data is correct",
                          success: false);
                    }
                    if (state is LoginFailureState) {
                      flutterToast(message: state.failure, success: false);
                    }
                    if (state is LoginSuccessState) {
                      print(state.loginModel.roles);
                      PreferenceUtils.setString(SharedKeys.userName,widget.usernameController.text );
                      userName = widget.usernameController.text;
                      flutterToast(
                          message: "You have successfully logged in",
                          success: true);
                      Data.createCustomer(name: widget.usernameController.text);
                      if (state.loginModel.roles!.length == 1) {
                        PreferenceUtils.setString(SharedKeys.role, "User");
                        role = "User";
                      }
                      final Widget widgetScreen;
                      (state.loginModel.roles!.length == 1)
                          ? widgetScreen = BottomNavScreen(
                              currentIndex: 0,
                            )
                          : widgetScreen = SelectRole(
                              roles: state.loginModel.roles,
                            );
                      navigateAndReplacement(context, widgetScreen);
                      // navigateTo(context, const HomeScreen());
                    }
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    var cubit = AccountCubit.get(context);
                    return   Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),                child: CustomButton(

                      isLoading:state is LoginLoadingState?false:true ,
                      width: MediaQuery.sizeOf(context).width,

                      onTap: () {

                        {
                          if (widget.formKey.currentState!.validate()) {
                            cubit.login(
                                userName: widget.usernameController.text,
                                password: widget.passwordController.text);
                          }
                        }
                      },
                      text: 'Login',
                      color: AppColors.primaryColor,
                    ),
                    );
                  },
                ),
              ),



              SizedBox(height: 60.h),
              Center(
                  child: Row(
                children: [
                  const Spacer(),
                  Text(
                    "Don’t have an account?",
                    style: lightTheme.textTheme.labelSmall!.apply(
                      fontSizeFactor: 1.sp,
                      color: AppColors.myWhite,
                    ),
                  ),
                  const Spacer(),
                  NavigationText(
                    onTap: () {
                      navigateTo(context, const RegisterScreen());
                    },
                    text: AppString.createAncount,
                  ),
                  const Spacer(),
                ],
              )),
            ],
          ),
);

        },
      ),
    );
  }
}
