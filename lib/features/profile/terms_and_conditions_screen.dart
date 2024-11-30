import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/app_color.dart';
import '../Account/presentation/widgets/curvy_appbar.dart';
import '../Home/presentation/widgets/custom_appBar_title_and_arrow.dart';
class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
        backgroundColor: AppColors.myDark,
        body: Column(
          children: [
            SizedBox(height: 20.h,),
            CustomAppBarTitleArrow(arrow_back:true,onpressed:(){Navigator.pop(context);},
              title: "Terms & Conditions",
            ),
            Padding(
              padding:EdgeInsetsDirectional.symmetric(horizontal: 24.w,vertical: 24.h),
              child: Column(
                children: [
                  PlanItemHelpCenter(title: "Term",description: "to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including",)

            ,SizedBox(height: 15.h,),
                  PlanItemHelpCenter(title: "T&C",description: "to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including",)

                ],
              ),
            ),
          ],
        ));
  }
}

class PlanItemHelpCenter extends StatefulWidget {
  final String? title;
  final String? description;


  const PlanItemHelpCenter(
      {super.key, this.title, this.description, });
  @override
  _PlanItemHelpCenterState createState() => _PlanItemHelpCenterState();
}

class _PlanItemHelpCenterState extends State<PlanItemHelpCenter>
    with SingleTickerProviderStateMixin {
  bool isTextVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.0.r),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.center,
          colors: [
            Color.fromRGBO(255, 97, 26, 0.5),
            Color.fromRGBO(255, 97, 26, 0),
          ],
        ),
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(25.r),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(1.0.r),
        decoration: BoxDecoration(
          color: AppColors.myDark,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(25.r),
          ),    boxShadow:[
          BoxShadow(
            color: Color.fromRGBO(96, 46, 166, 0), // Slight transparency for a smoother effect
            blurRadius: 10, // Increased blur for a softer shadow
            spreadRadius: 4, // Slight spread for better coverage
            offset: Offset(4, 4), // Add some depth by shifting the shadow downwards
          )


        ],
          gradient: LinearGradient(
            begin: AlignmentDirectional.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF000000),
              Color(0xFF000000),
            ],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(25.r),
            ),
            color: AppColors.myDark.withOpacity(0.70),
          ),
          padding: EdgeInsetsDirectional.only(
            start: 21.w,
            end: 12.w,
            top: 15.h,
            bottom: 15.h,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [

                    Text(
                      widget.title!,
                      style: Theme.of(context).textTheme.titleSmall!.apply(
                        fontSizeFactor: 1.sp,
                        color: AppColors.myWhite,
                      ),
                    ),
SizedBox(height: 10.h,),
              Container(width:307.w,height: 2,
                  decoration:BoxDecoration(color:AppColors.myGrey.withOpacity(0.1),  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(96, 46, 166, 0),  // Transparent gradient start
                      Color(0xFFFF8000),               // Orange gradient
                      Color.fromRGBO(96, 46, 166, 0),  // Transparent gradient end
                    ],
                    stops: [-0.0267, 0.0501, 1.0], // Adjust stops for gradient blending
                  ),

                      boxShadow:[
                        BoxShadow(
                          color: Color.fromRGBO(96, 46, 166, 0), // Slight transparency for a smoother effect
                          blurRadius: 10, // Increased blur for a softer shadow
                          spreadRadius: 4, // Slight spread for better coverage
                          offset: Offset(4, 4), // Add some depth by shifting the shadow downwards
                        )


                      ]

                  )

              ),
              Text(
                widget.description!,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.myGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
