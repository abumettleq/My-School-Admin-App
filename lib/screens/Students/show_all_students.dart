import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_school_admin_app/Provider/user_provider.dart';
import 'package:my_school_admin_app/Router/app_router.dart';
import 'package:my_school_admin_app/screens/Students/modify_specific_student.dart';
import 'package:provider/provider.dart';

class ShowAllStudents extends StatelessWidget {
  const ShowAllStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1600.w,
      height: 1024.h,
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 300.w,
              child: Row(
                children: [
                  const Spacer(),
                  IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        AppRouter.pop();
                      },
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: Colors.black,
                        size: 24.sp,
                      )),
                ],
              ),
            ),
          ),
          Container(
            width: 1100.w,
            height: 1024.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(192, 192, 192, 1.0),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16.r),
                          topLeft: Radius.circular(16.r))),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 230.w,
                        //height: 40.h,
                        child: Text(
                          "Student Name",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                        width: 180.w,
                        //height: 40.h,
                        child: Text(
                          "Student ID",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                        //height: 40.h,
                        child: Text(
                          "Class",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 250.w,
                        //height: 40.h,
                        child: Text(
                          "Address",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 180.w,
                        //height: 40.h,
                        child: Text(
                          "Contact Number",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 90.w,
                        //height: 40.h,
                        child: Text(
                          "Record",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.h,
                  height: 0,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 1100.w,
                  height: MediaQuery.of(context).size.height - 50,
                  child: Consumer<UserProvider>(
                      builder: (context, userProvider, child) {
                    return userProvider.isStudentDataLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.grey,
                            ),
                          )
                        : userProvider.studentsData.isEmpty
                            ? const Center(
                                child: Text("No student data fetched."),
                              )
                            : ListView.builder(
                                itemCount: userProvider.studentsData.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        color: index % 2 == 0
                                            ? Colors.white
                                            : const Color.fromRGBO(
                                                243, 194, 252, 1.0),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h, horizontal: 16.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 230.w,
                                              //height: 60.h,
                                              child: Text(
                                                "${userProvider.studentsData[index].studentName} ${userProvider.studentsData[index].fatherName}",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 180.w,
                                              //height: 40.h,
                                              child: Text(
                                                userProvider.studentsData[index]
                                                    .studentID,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 100.w,
                                              //height: 40.h,
                                              child: Text(
                                                userProvider.studentsData[index]
                                                    .currentClass,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 250.w,
                                              //height: 40.h,
                                              child: Text(
                                                userProvider.studentsData[index]
                                                    .address,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 180.w,
                                              //height: 40.h,
                                              child: Text(
                                                userProvider.studentsData[index]
                                                    .phoneNumber,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 90.w,
                                              //height: 40.h,
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                      style:
                                                          IconButton.styleFrom(
                                                        backgroundColor:
                                                            const Color
                                                                .fromARGB(255,
                                                                212, 212, 212),
                                                      ),
                                                      onPressed: () {
                                                        AppRouter.pushToWidget(ModifySpecificStudent(studentModel: userProvider.studentsData[index]));
                                                      },
                                                      icon: Icon(
                                                        Icons
                                                            .edit_attributes_outlined,
                                                        color:
                                                            Colors.blueAccent,
                                                        size: 24.sp,
                                                      )),
                                                  SizedBox(
                                                    width: 10.w,
                                                  ),
                                                  IconButton(
                                                      style:
                                                          IconButton.styleFrom(
                                                        backgroundColor:
                                                            const Color
                                                                .fromARGB(255,
                                                                212, 212, 212),
                                                      ),
                                                      onPressed: () {
                                                        userProvider.deleteUser(userProvider.studentsData[index].studentID);
                                                      },
                                                      icon: Icon(
                                                        Icons
                                                            .delete_forever_outlined,
                                                        color: Colors.redAccent,
                                                        size: 24.sp,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1.h,
                                        height: 0,
                                        color: Colors.black,
                                      ),
                                    ],
                                  );
                                });
                  }),
                ),
              ],
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
