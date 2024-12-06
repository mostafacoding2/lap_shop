import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/app_color.dart';
import '../widgets/select_bole_body.dart';
class SelectRole extends StatelessWidget {
  SelectRole({Key? key,  this.roles}) : super(key: key);
  List<String>?roles;
  @override
  Widget build(BuildContext context) {

   int number=roles!.length;
   SystemChrome.setSystemUIOverlayStyle(
     SystemUiOverlayStyle(
       statusBarColor: AppColors.myWhite,
       statusBarBrightness: Brightness.light,
       statusBarIconBrightness: Brightness.light,
     ),
   );
    return Scaffold(backgroundColor: AppColors.myDark,
      body: SelectRoleBody(number: number, roles: roles),
    );
  }
}


