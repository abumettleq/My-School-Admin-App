import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_school_admin_app/Provider/classes_excel_provider.dart';
import 'package:my_school_admin_app/Provider/classes_provider.dart';
import 'package:my_school_admin_app/Provider/people_provider.dart';
import 'package:my_school_admin_app/Provider/user_provider.dart';
import 'package:my_school_admin_app/Router/app_router.dart';
import 'package:my_school_admin_app/screens/Classes/show_all_classes.dart';
import 'package:provider/provider.dart';

class ClassesWidget extends StatelessWidget {
  const ClassesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ClassesExcelProvider, ClassesProvider>(
      builder: (context, classesExcelProvider, classesProvider, child) {
        return Container(
          width: 1290.w,
          height: 950.h,
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.white,
          ),
          child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                 Text(
                  "Classes",
                  style: TextStyle(color: Colors.black, fontSize: 24.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 830.h,
                  width: 1300.w,
                  child: 
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 330.w,
                            height: 300.h,
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
                                  "Class Utilities",
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 16.sp,fontWeight: FontWeight.bold),
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
                                      fixedSize: Size(225.w,40.h),
                                    ),
                                    onPressed: () {
                                      classesExcelProvider.selectExcelFile();
                                    },
                                    child: Text(
                                      "Upload Classes From Excel",
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
                                    onPressed: () async{
                                      showDialog(context: context, builder: (context){
                                        return const ShowAllClasses();
                                      });
                                      classesProvider.clearClassesData();
                                      await classesProvider.getClassesData();
                                    },
                                    child: Text(
                                      "Show All Classes",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),  
                        ],
                      )
                    ],
                  )
                  ,
                )
              ],
          ),
        );
      }
    );
  }
}
