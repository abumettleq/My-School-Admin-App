import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_school_admin_app/Provider/student_excel_provider.dart';
import 'package:my_school_admin_app/Provider/teacher_excel_provider.dart';
import 'package:my_school_admin_app/Provider/user_provider.dart';
import 'package:my_school_admin_app/screens/Students/show_all_students.dart';
import 'package:my_school_admin_app/screens/Teacher/show_all_teacher.dart';
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
                        width: 330.w,
                        height: 350.h,
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
                              style: TextStyle(color: Colors.black, fontSize: 14.sp,fontWeight: FontWeight.bold),
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
                                  fixedSize: Size(225.w,40.h),
                                ),
                                onPressed: () {
                                  studentExcelProvider.selectExcelFile();
                                },
                                child: Text(
                                  "Upload New Students",
                                  style: TextStyle(
                                      color: Colors.black,fontWeight: FontWeight.bold, fontSize: 14.sp),
                                ),
                              ),
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
                                  fixedSize: Size(225.w,40.h),
                                ),
                                onPressed: () async{
                                  showDialog(context: context, builder: (context){
                                    return const ShowAllStudents();
                                  });
                                  userProvider.clearStudentsData();
                                  await userProvider.getStudentData();
                                },
                                child: Text(
                                  "Show All Students",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.bold),
                                ),
                              ),
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
                                  fixedSize: Size(225.w,40.h),
                                ),
                                onPressed: () {

                                },
                                child: Text(
                                  "Notify a Student",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 50.w,),
                      Container(
                        width: 330.w,
                        height: 350.h,
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
                              TextStyle(color: Colors.black, fontSize: 14.sp,fontWeight: FontWeight.bold),
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
                                  fixedSize: Size(225.w,40.h),
                                ),
                                onPressed: () {
                                  teacherExcelProvider.selectExcelFile();
                                },
                                child: Text(
                                  "Upload New Teachers",
                                  style: TextStyle(
                                      color: Colors.black,fontWeight: FontWeight.bold, fontSize: 14.sp),
                                ),
                              ),
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
                                  fixedSize: Size(225.w,40.h),
                                ),
                                onPressed: () async{
                                  showDialog(context: context, builder: (context){
                                    return const ShowAllTeacher();
                                  });
                                  userProvider.clearTeachersData();
                                  await userProvider.getTeacherData();
                                },
                                child: Text(
                                  "Show All Teachers",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.bold),
                                ),
                              ),
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
                                  fixedSize: Size(225.w,40.h),
                                ),
                                onPressed: () {

                                },
                                child: Text(
                                  "Notify a Teacher",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),     
                      SizedBox(width: 50.w,),              
                    ],
                  ),
                  SizedBox(height: 50.h,),
                ],
              )
            )
          ],
        ),
      );
    });
  }
}
