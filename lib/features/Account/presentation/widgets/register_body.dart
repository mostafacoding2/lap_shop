
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
import '../screens/login_screen.dart';
import '../screens/select_role.dart';
import 'custom_button.dart';
import 'custom_navigationtext.dart';
class RegisterBody extends StatefulWidget {
  const RegisterBody(
      {super.key,
      required this.formKey,
      required this.usernameController,
      required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.firstNameController,
      required this.lastNameController,
      required this.phoneController,
      required this.streetController,
      required this.cityController});
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneController;
  final TextEditingController streetController;
  final TextEditingController cityController;
  final GlobalKey<FormState> formKey;

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateCustomerCubit(CheckoutRepoImpl()),
      child: BlocBuilder<CreateCustomerCubit, CreateCustomerState>(
        builder: (context, state) {
          var Data = CreateCustomerCubit.get(context);
          return Column(

            children: [
               SizedBox(height: 30.h),
              CustomTextFormField(
                  keyboardType: TextInputType.text,
                  widget: const Icon(Icons.person),
                  controller: widget.firstNameController,
                  label: AppString.fristName,
                  obscureText: false,
                  validator: (value) => FormValidators.validateField(
                      widget.firstNameController.text, AppString.fristName)),
              const SizedBox(height: 20),
              CustomTextFormField(
                  keyboardType: TextInputType.text,
                  widget: const Icon(Icons.person),
                  controller: widget.lastNameController,
                  label: AppString.lastName,
                  obscureText: false,
                  validator: (value) => FormValidators.validateField(
                      widget.lastNameController.text, AppString.lastName)),
              const SizedBox(height: 20),
              CustomTextFormField(
                  keyboardType: TextInputType.text,
                  widget: const Icon(Icons.person),
                  controller: widget.usernameController,
                  label: AppString.username,
                  obscureText: false,
                  validator: (value) => FormValidators.validateField(
                      widget.usernameController.text, AppString.username)),
              const SizedBox(height: 20),
              CustomTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  widget: const Icon(Icons.email),
                  controller: widget.emailController,
                  label: AppString.email,
                  obscureText: false,
                  validator: (value) => FormValidators.validateField(
                      widget.emailController.text, AppString.email)),
              const SizedBox(height: 20),
              BlocProvider(
                create: (context) => AccountCubit(),
                child: BlocBuilder<AccountCubit, AccountState>(
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
                        controller: widget.passwordController,
                        label: AppString.password,
                        obscureText: cubit.isPassword,
                        validator: (value) => FormValidators.validateField(
                            widget.passwordController.text,
                            AppString.password));
                  },
                ),
              ),
              const SizedBox(height: 20),
              BlocProvider(
                create: (context) => AccountCubit(),
                child: BlocBuilder<AccountCubit, AccountState>(
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
                        controller: widget.confirmPasswordController,
                        label: AppString.confirmPassword,
                        obscureText: cubit.isPassword,
                        validator: (value) => FormValidators.validateField(
                            widget.confirmPasswordController.text,
                            AppString.password));
                  },
                ),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                  keyboardType: TextInputType.text,
                  widget: const Icon(Icons.location_city_outlined),
                  controller: widget.streetController,
                  label: AppString.street,
                  obscureText: false,
                  validator: (value) => FormValidators.validateField(
                      widget.streetController.text, AppString.street)),
              const SizedBox(height: 20),
              CustomTextFormField(
                  keyboardType: TextInputType.text,
                  widget: const Icon(Icons.location_city),
                  controller: widget.cityController,
                  label: AppString.city,
                  obscureText: false,
                  validator: (value) => FormValidators.validateField(
                      widget.usernameController.text, AppString.city)),
              const SizedBox(height: 20),
              CustomTextFormField(
                  keyboardType: TextInputType.number,
                  widget: const Icon(Icons.phone),
                  controller: widget.phoneController,
                  label: AppString.phone,
                  obscureText: false,
                  validator: (value) => FormValidators.validateField(
                      widget.usernameController.text, AppString.phone)),
              const SizedBox(height: 20),
              BlocProvider(
                create: (context) => AccountCubit(),
                child: BlocConsumer<AccountCubit, AccountState>(
                  listener: (context, state) {
                    if (state is RegisterErrorState) {
                      if (state.failureRegisterModel.errors!.ConfirmPass![0]
                          .isNotEmpty) {
                        flutterToast(
                            message: state
                                .failureRegisterModel.errors!.ConfirmPass![0],
                            success: false);
                      }
                      if (state.failureRegisterModel.errors!.ConfirmPass![1]
                          .isNotEmpty) {
                        flutterToast(
                            message: state
                                .failureRegisterModel.errors!.ConfirmPass![1],
                            success: false);
                      }
                      ////////////////////////
                      if (state.failureRegisterModel.errors!.Password![0]
                          .isNotEmpty) {
                        flutterToast(
                            message:
                                state.failureRegisterModel.errors!.Password![0],
                            success: false);
                      }
                      if (state.failureRegisterModel.errors!.Password![1]
                          .isNotEmpty) {
                        flutterToast(
                            message:
                                state.failureRegisterModel.errors!.Password![1],
                            success: false);
                      }
                    }
                    if (state is RegisterFailureState) {
                      flutterToast(message: state.failure, success: false);
                    }
                    if (state is RegisterSuccessState) {
                      print(state.registerModel.roles);
                      PreferenceUtils.setString(SharedKeys.userName,widget.usernameController.text );
                      userName = widget.usernameController.text;
                      flutterToast(
                          message: "An account has been created successfully",
                          success: true);
                      Data.createCustomer(
                          name: widget.usernameController.text);
                      if (state.registerModel.roles!.length == 1) {
                        PreferenceUtils.setString(SharedKeys.role, "User");
                        role = "User";
                      }
                      final Widget widgetScreen;
                      (state.registerModel.roles!.length == 1)
                          ? widgetScreen = BottomNavScreen(
                              currentIndex: 0,
                            )
                          : widgetScreen = SelectRole(
                              roles: state.registerModel.roles,
                            );
                      navigateAndReplacement(context, widgetScreen);

                    }
                  }

                    // TODO: implement listener
                  ,
                  builder: (context, state) {
                    final cubit = AccountCubit.get(context);
                    return

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),                child: CustomButton(
                        isLoading: state is RegisterLoadingState?false:true,
                        width: MediaQuery.sizeOf(context).width,
                        onTap: () {
                          if (widget.formKey.currentState!.validate()) {
                            cubit.register(
                                street: widget.streetController.text,
                                city: widget.cityController.text,
                                phone: widget.phoneController.text,
                                firstName: widget.firstNameController.text,
                                lastName: widget.lastNameController.text,
                                userName: widget.usernameController.text,
                                password: widget.passwordController.text,
                                confirmPass:
                                    widget.confirmPasswordController.text,
                                email: widget.emailController.text);
                          }
                        },
                        text: "Register",
                        color: AppColors.primaryColor,
                      ),
                      );
                  },
                ),
              ),


              const SizedBox(height: 20),
              Row(
                children: [
                  const Spacer(),
                  Text("Already have account?",
                      style: lightTheme.textTheme.labelSmall!.apply(
                        fontSizeFactor: 1.sp,
                        color: AppColors.myWhite,
                      )),
                  const Spacer(),
                  NavigationText(
                    text: AppString.login,
                    onTap: () {
                      navigateTo(context, const LoginScreen());
                    },
                  ),
                  const Spacer(),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
