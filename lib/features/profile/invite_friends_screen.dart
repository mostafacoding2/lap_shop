
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/light_theme.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/constants.dart';
import '../Account/presentation/widgets/curvy_appbar.dart';
import '../Home/presentation/widgets/custom_appBar_title_and_arrow.dart';

class inviteFriendsScreen extends StatefulWidget {
  const inviteFriendsScreen({
    super.key,
  });

  @override
  State<inviteFriendsScreen> createState() => _inviteFriendsScreenState();
}

class _inviteFriendsScreenState extends State<inviteFriendsScreen> {
  String _selectedOption = '';
  bool _isOptionSelected = false;

  @override
  void initState() {
    super.initState();
    _showOptionDialog();
  }

  void _showOptionDialog() {
    Future.delayed(Duration.zero, () {
      showDialog(
        barrierColor: AppColors.myDark.withOpacity(0.3),
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColors.myGrey,
            content: Container(
              height: 200.h,
              width: 200.w,
              child: Column(
                children: [
                  Text(
                    "Choose the invitation method",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.myWhite,
                        )
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      _updateSelectedOption('whatsapp');
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.h),
                      decoration: BoxDecoration(
                          color: AppColors.myDark,
                          borderRadius: BorderRadiusDirectional.circular(12.r)),
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.whatsapp,
                              color: AppColors.myGreen),
                          SizedBox(
                            width: 30.w,
                          ),
                          Text(
                            "whatsapp",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .apply(
                                  fontSizeFactor: 1.sp,
                                  color: AppColors.myWhite,
                                )
                                .copyWith(fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      _updateSelectedOption('Email');
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.h),
                      decoration: BoxDecoration(
                          color: AppColors.myDark,
                          borderRadius: BorderRadiusDirectional.circular(12.r)),
                      child: Row(
                        children: [
                          Icon(Icons.email, color: AppColors.primaryColor),
                          SizedBox(
                            width: 30.w,
                          ),
                          Text(
                            "Sms",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .apply(
                                  fontSizeFactor: 1.sp,
                                  color: AppColors.myWhite,
                                )
                                .copyWith(fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }

  void _updateSelectedOption(String option) {
    setState(() {
      _selectedOption = option;
      _isOptionSelected = true;
    });
  }

  String? normalizePhoneNumber(String number) {
    String cleanedNumber = number.replaceAll(RegExp(r'[^0-9]'), '');

    if (cleanedNumber.startsWith('0')) {
      if (cleanedNumber.startsWith('011') ||
          cleanedNumber.startsWith('012') ||
          cleanedNumber.startsWith('015') ||
          cleanedNumber.startsWith('010')) {
        cleanedNumber = '20' + cleanedNumber.substring(1);
      } else if (cleanedNumber.startsWith('05')) {
        cleanedNumber = '966' + cleanedNumber.substring(1);
      } else if (cleanedNumber.startsWith('05')) {
        cleanedNumber = '971' + cleanedNumber.substring(1);
      }
    }

    if (cleanedNumber.startsWith('20') ||
        cleanedNumber.startsWith('966') ||
        cleanedNumber.startsWith('971')) {
      return cleanedNumber;
    }

    return null;
  }

  void sendWhatsAppMessage(String number) async {
    // Updated URL with your Google Play Store link
    String url =
        'https://wa.me/$number?text=Check%20this%20out%3A%20https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dahmed.app_direct.deal.app';

    // Check if the URL can be launched
    if (await canLaunch(url)) {
      try {
        // Attempt to launch the URL
        await launch(url);
      } catch (e) {
        // Handle any error that may occur when launching the URL
        flutterToast(
          message: 'Error launching WhatsApp: $e',
          success: false,
        );
        flutterToast(
          message: 'Failed to send message via WhatsApp',
          success: false,
        );
      }
    } else {
      flutterToast(
        message: 'Could not launch WhatsApp',
        success: false,
      );
    }
  }

  void sendSms(String number) async {
    // Updated URL with your Google Play Store link
    String url =
        'sms:$number?body=Check%20this%20out%3A%20https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dahmed.app_direct.deal.app';

    // Check if the URL can be launched
    if (await canLaunch(url)) {
      try {
        // Attempt to launch the URL
        await launch(url);
      } catch (e) {
        // Handle any error that may occur when launching the URL
        flutterToast(
          message: 'Error launching SMS app: $e',
          success: false,
        );
        flutterToast(
          message: 'Failed to send SMS',
          success: false,
        );
      }
    } else {
      flutterToast(
        message: 'Could not launch SMS app',
        success: false,
      );
    }
  }


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
              title: "inviteFriends",
            ),
            Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 24.w, vertical: 24.h),
                child: _selectedOption.isEmpty
                    ? Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            SizedBox(
                              height: 64.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                "The method of sending the invitation has not been specified"
                                    ,
                                style: lightTheme.textTheme.labelLarge!.apply(
                                  fontSizeFactor: 1.sp,
                                  color: AppColors.myWhite,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                textAlign: TextAlign.center,
                                "Please specify the sending method",
                                style: lightTheme.textTheme.labelMedium!.apply(
                                  fontSizeFactor: 1.sp,
                                  color: AppColors.myWhite,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        child: FutureBuilder<List<Contact>>(
                          future: getContacts(),
                          builder: (context, AsyncSnapshot snapshot) {
                            // Handle loading state
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.myWhite,
                                ),
                              );
                            }

                            // Handle error state
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(
                                  'Error loading contacts',
                                  style: TextStyle(color: AppColors.myWhite),
                                ),
                              );
                            }

                            // Handle no data state
                            if (!snapshot.hasData || snapshot.data.isEmpty) {
                              return Center(
                                child: Text(
                                  'No contacts available',
                                  style: TextStyle(color: AppColors.myWhite),
                                ),
                              );
                            }

                            // Display the contact list
                            return SizedBox(height: 600.h,
                              child: ListView.builder(
                                itemCount: snapshot.data.length, // Corrected 'length'
                                itemBuilder: (context, index) {
                                  Contact contact = snapshot.data[index];
                              
                                  // Handle if there are no phone numbers
                                  Object phone = contact.phones.isNotEmpty
                                      ? contact.phones[0].number
                                      : 'No phone number';
                              
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.myDark,
                                    ),
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${phone}", // Display phone number or 'No phone number'
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .apply(
                                                fontSizeFactor: 1.sp,
                                                color: AppColors.myWhite,
                                              )
                                              .copyWith(fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          contact.displayName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .apply(
                                                fontSizeFactor: 1.sp,
                                                color: AppColors.myWhite,
                                              )
                                              .copyWith(fontWeight: FontWeight.w700),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            _selectedOption == "whatsapp"
                                                ? sendWhatsAppMessage(
                                                    normalizePhoneNumber("${phone}")!)
                                                : sendSms(normalizePhoneNumber(
                                                    "${phone}")!);
                                          },
                                          child: Container(
                                              padding: EdgeInsets.all(10.h),
                                              decoration: BoxDecoration(
                                                  color: AppColors.primaryColor,
                                                  borderRadius:
                                                      BorderRadiusDirectional
                                                          .circular(12.r)),
                                              child: Text(
                                                "Invite", // Display10.h phone number or 'No phone number'
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall!
                                                    .apply(
                                                      fontSizeFactor: 1.sp,
                                                      color: AppColors.myWhite,
                                                    )
                                                    .copyWith(
                                                        fontWeight: FontWeight.w700),
                                              )),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      )),
          ],
        ));
  }

  Future<List<Contact>> getContacts() async {
    bool isGranted = await Permission.contacts.status.isGranted;

    if (!isGranted) {
      isGranted = await Permission.contacts.request().isGranted;
    }

    if (isGranted) {
      return await FastContacts.getAllContacts();
    }
    return [];
  }
}
