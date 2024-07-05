import 'package:calculator/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final double progressValue;
  final Color mainColor;

  CustomCircularProgressIndicator({
    required this.progressValue,
    required this.mainColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 160,

      child: CircularProgressIndicator(
                value: progressValue,
                strokeWidth: 40, 
                valueColor: AlwaysStoppedAnimation<Color>(mainColor), 
                backgroundColor: secondaryColor, 
              ),

    );
  }
}
