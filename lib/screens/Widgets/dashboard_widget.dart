
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
//import 'package:firebase_analytics/observer.dart';

final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

void getCharts() async
{
await analytics.logEvent(
          name: 'button_click',
          parameters: <String, dynamic>{
            'button_id': 'my_button_id',
          },
        );
}


class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1290.w,
      height: 950.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
      ),
      //getCharts(),
    );
  }
}
