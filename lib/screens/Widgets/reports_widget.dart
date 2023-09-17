import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_school_admin_app/Provider/reports_provider.dart';
import 'package:provider/provider.dart';

class ReportsWidget extends StatelessWidget {
 const ReportsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportsProvider>(
        builder: (context, reportsProvider, child) {
      return Container(
        width: 1290.w,
        height: 950.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
        ),
        child: ListView.builder(
            itemCount: reportsProvider.reports?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 1200.w,
                height: 210.h,
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: const Color.fromRGBO(217, 217, 217, 1.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reportsProvider.reports![index].fullName!,
                      style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      reportsProvider.reports![index].sidOrMobile!,
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Color.fromARGB(255, 94, 166, 254),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h,),
                    SizedBox(
                      width: 1280.w,
                      //height: 90.h,
                      child: Text(
                        reportsProvider.reports![index].comment!,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          reportsProvider.reports![index].emailAddress!,
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          reportsProvider.reports![index].timestamp!,
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
      );
    });
  }
}
