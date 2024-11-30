import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_color.dart';
import '../../data/models/on_Boarding_model.dart';


class onBoardingWidget extends StatelessWidget {
  const onBoardingWidget({
    super.key,
    required this.width,
    required this.index,
    required this.boarding,
    required this.boardController,
  });

  final double width;
  final int index;
  final List<OnBoardingModel> boarding;
  final PageController boardController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [


      Stack(
        children: [
          Image.asset( fit:BoxFit.fill,
                width:MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                boarding[index].image,
              ),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),




        ],
      ),
    );
  }
}