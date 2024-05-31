import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navKey = GlobalKey();
  static pushToWidget(Widget widget) async {
    Navigator.of(navKey.currentContext!)
        .push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  static pushWithReplacementToWidget(Widget widget) {
    Navigator.of(navKey.currentContext!)
        .pushReplacement(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  static pop() {
    Navigator.of(navKey.currentContext!).pop();
  }


  static showErrorSnackBar(String title, String message) {
    ScaffoldMessenger.of(navKey.currentContext!)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        elevation: 0,
        width: 400.w,
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        content: Container(
          //width: 400.w,
          height: 90.h,
          padding: EdgeInsets.all(10.sp),
          margin: EdgeInsets.only(bottom: 20.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 9,
                  offset: const Offset(5, 10), // changes position of shadow
                ),
              ],
            color: const Color.fromRGBO(255, 114, 118, 1.0)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.error_outline,size: 35.sp,),
              SizedBox(width: 10.w,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 30.h,
                      child: Text(title,style: TextStyle(color: Colors.black,fontSize: 20.sp),)
                  ),
                  const Spacer(),
                  SizedBox(
                      height: 30.h,
                      child: Text(message,style: TextStyle(color: Colors.black,fontSize: 17.sp),)
                  )
                ],
              ),
            ],
          ),
        )
      ));
  }

  static showSnackBar(String title, String message) =>
      ScaffoldMessenger.of(navKey.currentContext!)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          elevation: 0,
            width: 600.w,
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
            content: Container(
              //width: 400.w,
              height: 90.h,
              padding: EdgeInsets.all(10.sp),
              margin: EdgeInsets.only(bottom: 20.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 9,
                      offset: const Offset(5, 10), // changes position of shadow
                    ),
                  ],
                  color: const Color.fromRGBO(166, 255, 114, 1.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.done_outline,size: 35.sp,),
                  SizedBox(width: 10.w,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 30.h,
                          child: Text(title,style: TextStyle(color: Colors.black,fontSize: 20.sp),)
                      ),
                      const Spacer(),
                      SizedBox(
                          height: 30.h,
                          child: Text(message,style: TextStyle(color: Colors.black,fontSize: 17.sp),)
                      )
                    ],
                  ),
                ],
              ),
            )
        ));
}
