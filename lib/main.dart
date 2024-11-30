import 'package:device_preview/device_preview.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/api_constant.dart';
import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/core/utils/bloc_observe.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/core/utils/dio_helper.dart';
import 'package:ultra_shop/core/utils/shared%20_pref.dart';
import 'package:ultra_shop/features/Account/presentation/controller/account_cubit.dart';
import 'package:ultra_shop/features/Account/presentation/screens/on_Boarding_screen.dart';
import 'package:ultra_shop/features/Account/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/Home/presentation/screens/bottom_nav_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  await PreferenceUtils.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  token = PreferenceUtils.getString(
    SharedKeys.token,
  );
  print(" token ==: ${token.toString()}");
  customerId = PreferenceUtils.getString(
    SharedKeys.customerId,
  );
  userName = PreferenceUtils.getString(
    SharedKeys.userName,
  );
  print(" userName== ${userName.toString()}");
  print(" customId ==: ${customerId.toString()}");
  role = PreferenceUtils.getString(
    SharedKeys.role,
  );
  print(" role== ${role.toString()}");
  Stripe.publishableKey = ApiConstant.stripePublishableKey;






  token = PreferenceUtils.getString(SharedKeys.token);
  onBoarding=  PreferenceUtils.getBool(SharedKeys.onBoarding);
  print(onBoarding);
  print(token);
  Widget widget;
  (onBoarding == false)
      ? widget = const OnBoardingScreen()
      : (token == '')
      ? widget = WelcomeScreen()
      : widget = BottomNavScreen(currentIndex: 0, );
  runApp(
    DevicePreview(
        enabled: false,
        builder: (context) => ECommerceApp(
            widgetStart:widget
            )
        ),
  );
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({ super.key, this.widgetStart,});
  final Widget? widgetStart;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return BlocProvider(
            create: (context) => AccountCubit(),
            child: MaterialApp(
              title: AppString.ecommerceApp,
              theme: lightTheme,
              debugShowCheckedModeBanner: false,
              home: widgetStart,
            ),
          );
        });
  }
}