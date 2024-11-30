import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ultra_shop/features/Account/presentation/screens/welcome_screen.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/shared _pref.dart';
import '../widgets/custom_button.dart';
import '../widgets/on_boarding_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

bool islast = false;

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0XFF657D86),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        islast = true;
                      });
                      PreferenceUtils.setBool(
                        SharedKeys.onBoarding,
                        true,
                      );

                      print('last');
                    } else {
                      print(' not last');
                      setState(() {
                        islast = false;
                      });
                    }
                  },
                  controller: boardController,
                  itemBuilder: (context, index) => Column(
                    children: [
                      onBoardingWidget(
                          index: index,
                          width: width,
                          boarding: boarding,
                          boardController: boardController),
                    ],
                  ),
                  itemCount: boarding.length,
                ),
              ),
              Positioned(
                right: 230.w,
                bottom: 10.h,
                child: CustomButton(
                  width: 120.w,
                  onTap: () {
                    if (islast) {
                      PreferenceUtils.setBool(
                        SharedKeys.onBoarding,
                        true,
                      );
                      navigateAndRemove(
                        context,
                        const WelcomeScreen(),
                      );
                    } else {
                      boardController.nextPage(
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  text: islast ? "Start now" : 'Next',
                  color: AppColors.myDark,
                ),
              ),
              Positioned(
                right: 150.w,
                bottom: 80.h,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 2.0.h,
                  ),
                  child: SmoothPageIndicator(
                    controller: boardController,
                    effect: ExpandingDotsEffect(
                      dotColor: AppColors.myWhite,
                      dotHeight: 8.h,
                      expansionFactor: 2,
                      dotWidth: 12.w,
                      spacing: 2.w,
                      activeDotColor: AppColors.myDark,
                    ),
                    count: boarding.length,
                  ),
                ),
              ),
              Positioned(
                right: 10.w,
                bottom: 10.h,
                child: CustomButton(
                  width: 120.w,
                  onTap: () {
                    PreferenceUtils.setBool(
                      SharedKeys.onBoarding,
                      true,
                    );
                    navigateAndRemove(
                      context,
                      const WelcomeScreen(),
                    );
                  },
                  text: 'Skip',
                  color: AppColors.myDark,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
