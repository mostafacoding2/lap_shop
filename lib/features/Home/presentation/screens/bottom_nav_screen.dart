
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../../../core/utils/app_color.dart';
import '../manger/cubit/home_cubit.dart';
class BottomNavScreen extends StatefulWidget {
  int? currentIndex;
  BottomNavScreen({Key? key, required this.currentIndex}) : super(key: key);
  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}
class _BottomNavScreenState extends State<BottomNavScreen> {

  DateTime? lastPressedTime;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.myDark,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return  BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          if (widget.currentIndex != null) {
            cubit.currentIndex = widget.currentIndex!;
            widget.currentIndex = null;
          }

          print("Current Index: ${cubit.currentIndex}");
          print("Current Screen Widget: ${cubit.screen[cubit.currentIndex]}");

          return WillPopScope(
            onWillPop: () async {
              final now = DateTime.now();
              bool willPop;
              if (lastPressedTime == null ||
                  now.difference(lastPressedTime!) >
                      const Duration(seconds: 2)) {
                lastPressedTime = now;
                Fluttertoast.showToast(
                  msg: 'Press back again to exit',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                );
                willPop = false;
              } else {
                willPop = true;
              }
              return willPop;
            },
            child: Scaffold(
              backgroundColor: AppColors.myDark,
              bottomNavigationBar: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Container(
                  height: 80.h,
                  decoration: BoxDecoration(
                    color: AppColors.myDark,
                    borderRadius:  BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(217, 217, 217, 0.6), // Adjusted alpha value
                        offset: Offset(0, 4), // Vertical offset
                        blurRadius: 20, // Blur radius
                        spreadRadius: 0, // Spread radius
                      ),
                    ],
                  ),
                  child: StylishBottomBar(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                    ),
                    elevation: 150,
                    backgroundColor: AppColors.myDark,
                    currentIndex: cubit.currentIndex,
                    items: [
                      buildSalomonBottomBarItem(

                        icon: Icons.home,
                        isSelected: 0 == cubit.currentIndex,
                        title: "Home",
                      ),
                      buildSalomonBottomBarItem(
                        icon: Icons.shopping_cart,
                        isSelected: 1 == cubit.currentIndex,
                        title: "Cart",
                      ),
                      buildSalomonBottomBarItem(
                        icon: Icons.shopping_cart_checkout_sharp,
                        isSelected: 2 == cubit.currentIndex,
                        title: "my order",
                      ),
                      buildSalomonBottomBarItem(
                        icon: Icons.person,
                        isSelected: 3 == cubit.currentIndex,
                        title: "Profile",
                      ),

                    ],
                    onTap: (index) {
                      cubit.changeBottom(index);
                      SystemChrome.setSystemUIOverlayStyle(
                        SystemUiOverlayStyle(
                          statusBarColor: AppColors.myWhite,
                          statusBarBrightness: Brightness.light,
                          statusBarIconBrightness: Brightness.dark,
                        ),
                      );
                    },
                    option: BubbleBarOptions(
                      opacity: 1,
                      padding: EdgeInsets.symmetric(vertical: 8.h , horizontal: 0.w),
                      borderRadius: BorderRadius.circular(30.r),
                      barStyle: BubbleBarStyle.horizontal,
                      bubbleFillStyle: BubbleFillStyle.fill,
                    ),
                  ),
                ),
              ),
              body: cubit.screen[cubit.currentIndex],
            ),
          );
        },
      ),
    );
  }

  BottomBarItem buildSalomonBottomBarItem({
    bool isSelected = true,
    required String title,
    required IconData icon

  }) {
    return BottomBarItem(
      selectedColor: AppColors.primaryColor,
      backgroundColor: AppColors.primaryColor,
      icon:  Icon(
        icon,
        size: 25.h,
        color:
        isSelected ? AppColors.myWhite : const Color(0xffA4AAAB),
      ),
      title: Padding(
        padding:  EdgeInsetsDirectional.only(end: 12.0.w),
        child: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.myWhite,
          ),
        ),
      ),
    );
  }
}

