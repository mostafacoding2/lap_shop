import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ultra_shop/features/product/presentation/screens/review_screen.dart';
import '../../../../core/Theme/light_theme.dart';
import '../../../../core/utils/constants.dart';
import '../../../Home/presentation/widgets/custom_appBar_title_and_arrow.dart';

class AllReviewsProduct extends StatelessWidget {
  const AllReviewsProduct(

  {super.key, required this.reviews, required this.revDtoModel  ,required this.id
});

  final int reviews;
  final int id;
  final List<RevDtoModel> revDtoModel;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return
           SafeArea(
            child: Scaffold(
              bottomNavigationBar:              role=="Admin"||token=='' ? const SizedBox():           GestureDetector(
                onTap: () {
                  navigateAndReplacement(
                      context, ReviewScreen(id: id));
                },
                child: Container(
                  margin:          EdgeInsets.symmetric(
                    vertical: 10, horizontal: 10),
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(360)),
                  child: Icon(
                    Icons.add,
                    size: 28,
                    color: AppColors.myWhite,
                  ),
                ),
              ),

              backgroundColor: AppColors.myDark,
                body:Column(children: [

                  CustomAppBarTitleArrow(
                      arrow_back: true,
                      title: "All Reviews",
                      onpressed: () {
                        Navigator.pop(context);
                      }),
                  
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(right: 10.w, bottom: 10.h ,left: 10.w,top: 10.h),
                        itemCount: reviews,
                        itemBuilder: (context,index){return Container(
                      margin:
                      EdgeInsets.only(right: 10.w, bottom: 9.h,top: 8.h),
                      padding: EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColors.myWhite,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                              color:
                              Color.fromRGBO(191, 214, 215, 0.1),
                              offset: Offset(1, 1),
                              spreadRadius: 0,
                              blurRadius: 4)
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 30.h,
                            child: Image.asset(
                                "assets/images/profile.jpeg"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              revDtoModel[index].comment!,
                              style: lightTheme.textTheme.labelMedium!
                                  .apply(
                                fontSizeFactor: 1.sp,
                                color: AppColors.myDark,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.myYellow,
                                size: 30,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "${revDtoModel[index].rating!}",
                                textAlign: TextAlign.start,
                                style: lightTheme
                                    .textTheme.labelSmall!
                                    .apply(
                                  fontSizeFactor: 1.sp,
                                  color: AppColors.myDark,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                            ],
                          )
                        ],
                      ),
                    ); }),
                  )
                  
                  
                  
                ],),
          ));

  }
}
