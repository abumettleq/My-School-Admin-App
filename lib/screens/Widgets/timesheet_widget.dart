import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimesheetWidget extends StatelessWidget {
  const TimesheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1290.w,
      height: 950.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
      ),

    );
  }
}
