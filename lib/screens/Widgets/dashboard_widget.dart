import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_school_admin_app/Provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userProvider, child) {
      return Container(
        width: 1290.w,
        height: 950.h,
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dashboard",
              style: TextStyle(color: Colors.black, fontSize: 24.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 830.h,
              width: 1300.w,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 400.w,
                        height: 370.h,
                        padding: EdgeInsets.all(25.w),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(217, 217, 217, 1.0),
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "People Characteristics",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: double.infinity,
                                height: 200.0, // Adjust the height as needed
                                child: userProvider.isCategorizingDocuments
                                    ? const Center(
                                        child: RefreshProgressIndicator(),
                                      )
                                    : PieChart(
                                        PieChartData(
                                          sections: [
                                            PieChartSectionData(
                                              color: Colors.green,
                                              title:
                                                  "${userProvider.studentsPercentage.toStringAsFixed(2)}%",
                                              value: userProvider.studentsNumber
                                                  .toDouble(),
                                            ),
                                            PieChartSectionData(
                                              color: Colors.blue,
                                              title:
                                                  "${userProvider.teachersPercentage.toStringAsFixed(2)}%",
                                              value: userProvider.teachersNumber
                                                  .toDouble(),
                                            ),
                                          ],
                                          borderData: FlBorderData(show: true),
                                          sectionsSpace: 0,
                                          centerSpaceRadius: 40.0,
                                        ),
                                      ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildIndicator(
                                    color: Colors.green,
                                    text:
                                        "Students (${userProvider.studentsNumber})"),
                                _buildIndicator(
                                    color: Colors.blue,
                                    text:
                                        "Teachers (${userProvider.teachersNumber})"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Column(
                        children: [
                          Container(
                            width: 300.w,
                            height: 160.h,
                            padding: EdgeInsets.all(25.w),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(217, 217, 217, 1.0),
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Feedbacks Characteristics",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: userProvider.isCategorizingDocuments
                                    ? const Center(
                                        child: RefreshProgressIndicator(),
                                      )
                                    : Text(
                                    "Number of Feedbacks: ${userProvider.feedbacksNumber}",
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            width: 300.w,
                            height: 160.h,
                            padding: EdgeInsets.all(25.w),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(217, 217, 217, 1.0),
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "News Characteristics",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: userProvider.isCategorizingDocuments
                                    ? const Center(
                                        child: RefreshProgressIndicator(),
                                      )
                                    : Text(
                                    "Number of News: ${userProvider.newsNumber}",
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            width: 300.w,
                            height: 160.h,
                            padding: EdgeInsets.all(25.w),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(217, 217, 217, 1.0),
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Classes Characteristics",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: userProvider.isCategorizingDocuments
                                    ? const Center(
                                        child: RefreshProgressIndicator(),
                                      )
                                    : Text(
                                    "Number of Classes: ${userProvider.classesNumber}",
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Container(
                        width: 300.w,
                        height: 600.h,
                        padding: EdgeInsets.all(25.w),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(217, 217, 217, 1.0),
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Library Characteristics",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              width: 250.w,
                              height: 500.h,
                              padding: EdgeInsets.all(25.w),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(217, 217, 217, 1.0),
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: userProvider.isCategorizingDocuments
                                    ? const Center(
                                        child: RefreshProgressIndicator(),
                                      )
                                    : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: userProvider
                                          .libraryBooksNumber.keys.length,
                                      itemBuilder: (context, index) {
                                        return Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${userProvider.libraryBooksNumber.keys.elementAt(index)} books: ${userProvider.libraryBooksNumber.values.elementAt(index)}",
                                            style: TextStyle(fontSize: 16.sp),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _buildIndicator({required Color color, required String text}) {
    return Row(
      children: [
        Container(
          width: 16.w,
          height: 16.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
