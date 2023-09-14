import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_school_admin_app/Provider/student_excel_provider.dart';
import 'package:my_school_admin_app/Provider/teacher_excel_provider.dart';
import 'package:my_school_admin_app/Provider/user_provider.dart';
import 'package:provider/provider.dart';

class PeopleWidget extends StatelessWidget {
  const PeopleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<StudentExcelProvider, TeacherExcelProvider,UserProvider>(
        builder: (context, studentExcelProvider, teacherExcelProvider,userProvider, child) {
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
              "People",
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
                        width: 450.w,
                        height: 250.h,
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
                              "Students",
                              style: TextStyle(color: Colors.black, fontSize: 20.sp,fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.people_alt_outlined,
                                  size: 24.sp,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "${userProvider.studentsNumber}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20.sp),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 35.w,
                                  height: 35.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.r),
                                      color: Colors.white),
                                  child: Icon(
                                    Icons.bar_chart_rounded,
                                    size: 24.sp,
                                    color: const Color.fromRGBO(150, 101, 255, 1.0),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "${((userProvider.studentsNumber / userProvider.totalUsers) * 100).toStringAsFixed(2)}%",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20.sp),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    backgroundColor:
                                    const Color.fromRGBO(142, 90, 252, 1.0),
                                    foregroundColor:
                                    const Color.fromRGBO(255, 255, 255, 0.5),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 50.w, vertical: 15.h)),
                                onPressed: () {
                                  studentExcelProvider.selectExcelFile();
                                },
                                child: Text(
                                  "Upload New Students",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20.sp),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 50.w,),
                      Container(
                        width: 450.w,
                        height: 250.h,
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
                              "Teachers",
                              style:
                              TextStyle(color: Colors.black, fontSize: 20.sp,fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.people_alt_outlined,
                                  size: 24.sp,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "${userProvider.teachersNumber}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20.sp),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 35.w,
                                  height: 35.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.r),
                                      color: Colors.white),
                                  child: Icon(
                                    Icons.bar_chart_rounded,
                                    size: 24.sp,
                                    color: const Color.fromRGBO(150, 101, 255, 1.0),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                    "${((userProvider.teachersNumber / userProvider.totalUsers) * 100).toStringAsFixed(2)}%",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20.sp),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    backgroundColor:
                                    const Color.fromRGBO(142, 90, 252, 1.0),
                                    foregroundColor:
                                    const Color.fromRGBO(255, 255, 255, 0.5),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 50.w, vertical: 15.h)),
                                onPressed: () {
                                  teacherExcelProvider.selectExcelFile();
                                },
                                child: Text(
                                  "Upload New Teachers",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20.sp),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            )
          ],
        ),
      );
    });
  }
}
