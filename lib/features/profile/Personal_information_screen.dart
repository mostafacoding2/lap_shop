import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/core/utils/images_paths.dart';
import 'package:ultra_shop/core/utils/shared%20_pref.dart';
import 'package:ultra_shop/features/Account/presentation/screens/change_password_screen.dart';
import 'package:ultra_shop/features/Account/presentation/controller/account_cubit.dart';
import 'package:ultra_shop/features/ApplyShop/presentation/controller/applyshop_cubit.dart';
import 'package:ultra_shop/features/ApplyShop/presentation/screens/create_apply_shop_screen.dart';
import 'package:ultra_shop/features/Home/presentation/screens/add_role_screen.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_profile_item.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/item_text_profile.dart';
import 'package:ultra_shop/features/Account/presentation/screens/select_role.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/Shimmers/profile.dart';

import '../../core/Theme/light_theme.dart';
import '../../core/utils/app_color.dart';
import '../Home/presentation/widgets/custom_appBar_title_and_arrow.dart';
class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(backgroundColor: AppColors.myDark,
      body: Column(
        children: [SizedBox(height: 20.h,),
          CustomAppBarTitleArrow(arrow_back:true,onpressed:(){Navigator.pop(context);},
            title: "Personal information",
          ),
          SizedBox(height: 30.h,),
          Container(
            padding: EdgeInsets.all(20.0.r),
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
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                            BlocProvider(
                  create: (context) => AccountCubit()..showUser(),
                  child: BlocBuilder<AccountCubit, AccountState>(
                    builder: (context, state) {
                      var data = AccountCubit.get(context).showUserModel;
                      return state is ShowUserSuccessState
                          ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ItemTextProfile(
                            title: "Name:",
                            content: '${data!.firstName!} ${data.lastName!}',
                          ),
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

                          ItemTextProfile(
                            title: "Email:",
                            content: data.email!,
                          ),
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

                          ItemTextProfile(
                            title: "UserName:",
                            content: data.userName!,
                          ),
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

                          ItemTextProfile(
                            title: "The Address:",
                            content: " ${data.street!} / ${data.city!}",
                          ),
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

                          ItemTextProfile(
                            title: "Phone Number :",
                            content: data.phone!,
                          ),
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

                          ItemTextProfile(
                            title: "Role Now :",
                            content: role,
                          ),
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

                          data.roles!.length == 1
                              ? SizedBox()
                              :  GestureDetector(
                            onTap: () {
                              PreferenceUtils.removeData(
                                  SharedKeys.role);
                              if (role.length > 1) {
                                navigateAndRemove(
                                    context,
                                    SelectRole(
                                      roles: data.roles,
                                    ));
                              }
                            },
                            child: CustomProfile(
                              widget:  Row(
                                children: [
                                  Text(
                                    'Change Role',
                                    style: lightTheme.textTheme.labelSmall!
                                        .apply(
                                      fontSizeFactor: 1.sp,
                                      color: AppColors.myDeepBlue,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    FontAwesomeIcons.person,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                          : Center(
                          child: ProfileShimmer()
                      );
                    },
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

              ],
            ),
          ),
        ],
      ),
    );
  }
}
