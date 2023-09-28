import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_school_admin_app/Provider/user_provider.dart';
import 'package:my_school_admin_app/Router/app_router.dart';
import 'package:provider/provider.dart';

class ShowAllTeacher extends StatelessWidget {
  const ShowAllTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1600.w,
      height: 1024.h,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2)
      ),
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
                      onPressed: (){
                        AppRouter.pop();
                      },
                      icon: Icon(Icons.cancel_outlined,color: Colors.black,size: 24.sp,)
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 1000.w,
            height: 1024.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r)
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color:const Color.fromRGBO(192, 192, 192, 1.0),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(16.r),topLeft: Radius.circular(16.r))
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200.w,
                        //height: 40.h,
                        child: Text("Teacher Name",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                        width: 180.w,
                        //height: 40.h,
                        child: Text("Teacher ID",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 170.w,
                        //height: 40.h,
                        child: Text("Employment Status",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 220.w,
                        //height: 40.h,
                        child: Text("Email",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 180.w,
                        //height: 40.h,
                        child: Text("Contact Number",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold
                          ),
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
                  width: 1000.w,
                  height: MediaQuery.of(context).size.height-50,
                  child: Consumer<UserProvider>(
                      builder: (context,userProvider,child) {
                        return userProvider.teacherData.isEmpty
                            ? const Center(child: CircularProgressIndicator(color: Colors.grey,),)
                            : ListView.builder(
                            itemCount: userProvider.teacherData.length,
                            itemBuilder: (context,index){
                              return Column(
                                children: [
                                  Container(
                                    color: index % 2 == 0  ? Colors.white : const Color.fromRGBO(243, 194, 252, 1.0),
                                    padding:EdgeInsets.symmetric(vertical: 10.h,horizontal: 16.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 200.w,
                                          //height: 60.h,
                                          child: Text(
                                            userProvider.teacherData[index].fullName!,
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
                                            userProvider.teacherData[index].teacherId!,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17.sp,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 170.w,
                                          //height: 40.h,
                                          child: Text(
                                            userProvider.teacherData[index].empStatus!,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17.sp,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 220.w,
                                          //height: 40.h,
                                          child: Text(
                                            userProvider.teacherData[index].email!,
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
                                            userProvider.teacherData[index].contactNumber!,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17.sp,
                                            ),
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
                            }
                        );
                      }
                  ),
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
