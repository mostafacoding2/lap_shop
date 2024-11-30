
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/utils/app_color.dart';
import '../widgets/Login_body.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, });
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  bool isLoading=false ;
  final  _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      backgroundColor:  AppColors.myDark,
        body: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child:LoginBody(
                    formKey: _formKey,
            usernameController: _usernameController,
                   passwordController: _passwordController,
                  )
                ),
              ),
      );
  }
}
